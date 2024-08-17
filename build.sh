#!/bin/bash

# check num of args is 0
if [ "$#" -ne 0 ]; then
    echo "Error: Usage is $0" 1>&2
    exit 1
fi

PROD_DIR='build'

clean_prod_dir () {
    if [ -d "./${PROD_DIR}" ]; then
        rm --recursive --force "./${PROD_DIR}"
        return "$?"
    fi
    return '0'
}

echo "Building into production directory at ./${PROD_DIR}"
echo '...'

# install or update modern-normalize dependency
npm update modern-normalize

# remove production directory if it exists
clean_prod_dir

# check if required directories and files exist
req_dir=(
    './node_modules/modern-normalize'
    './res'
    './test'
)

req_fil=(
    './favicon.ico'
    './favicon.svg'
    './icon-192.png'
    './icon-512.png'
    './icon-apple-touch.png'
    './index.html'
    './LICENSE'
    './manifest.webmanifest'
    './README.md'
    './reset.css'
)

for dir in "${req_dir[@]}"; do
    if [ ! -d "${dir}" ]; then
        echo "Error: Required directory at ${dir} not found" 1>&2
        exit 1
    fi
done

for fil in "${req_fil[@]}"; do
    if [ ! -f "${fil}" ]; then
        echo "Error: Required file at ${fil} not found" 1>&2
        exit 1
    fi
done

# make new empty production directory
mkdir "./${PROD_DIR}"
if [ ! -d "./${PROD_DIR}" ]; then
    echo "Error: Failed to make directory at ./${PROD_DIR}" 1>&2
    exit 1
fi

# copy required directories and files into production directory
for dir in "${req_dir[@]}"; do
    cp --recursive "${dir}" "./${PROD_DIR}"
done

for fil in "${req_fil[@]}"; do
    cp "${fil}" "./${PROD_DIR}"
done

# update relative file paths
sed --in-place 's#node_modules/##' "./${PROD_DIR}/reset.css"

sed --in-place 's/\.html//g' "./${PROD_DIR}/index.html"

sed --in-place 's/index\.html//g' "./${PROD_DIR}/test/with-reset.html"
sed --in-place 's/\.html//g' "./${PROD_DIR}/test/with-reset.html"

sed --in-place 's/index\.html//g' "./${PROD_DIR}/test/without-reset.html"
sed --in-place 's/\.html//g' "./${PROD_DIR}/test/without-reset.html"

echo 'Build done'
