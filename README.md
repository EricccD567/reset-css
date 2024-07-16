# reset-css

An opinionated CSS reset.

## Usage

### Standalone

Copy to the start of a CSS file:

```css
/* global reset */

*,
*::before,
*::after {
  box-sizing: border-box;
}

* {
  margin: 0;
  padding: 0;
}

html {
  text-size-adjust: none;
  -moz-text-size-adjust: none;
  -webkit-text-size-adjust: none;
}

body {
  font-family: system-ui, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',
    'Segoe UI Symbol', 'Noto Color Emoji';
  line-height: 1.5;
  min-height: 100svh;
}

code,
kbd,
pre,
samp {
  font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas,
    'DejaVu Sans Mono', monospace;
}

button,
input,
select,
textarea {
  font: inherit;
  line-height: 1.15;
}

canvas,
img,
svg,
video {
  display: block;
  height: auto;
  max-width: 100%;
}

audio {
  display: block;
  max-width: 100%;
}

/* optional reset */

img {
  font-style: italic;
}

h1,
h2,
h3,
h4,
h5,
h6,
p {
  overflow-wrap: break-word;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  text-wrap: balance;
}

@supports (text-wrap: pretty) {
  p {
    hyphens: auto;
    text-wrap: pretty;
  }
}

p {
  max-width: 75ch;
}

a {
  color: inherit;
  text-decoration: none;
}

#root {
  isolation: isolate;
}
```

### Including modern-normalize

Install [modern-normalize](https://github.com/sindresorhus/modern-normalize):

```shell
npm install modern-normalize
```

Copy to the start of a CSS file:

```css
/* global reset */

@import 'node_modules/modern-normalize/modern-normalize.css';

*,
*::before,
*::after {
  box-sizing: border-box;
}

* {
  margin: 0;
  padding: 0;
}

html {
  text-size-adjust: none;
  -moz-text-size-adjust: none;
  -webkit-text-size-adjust: none;
}

body {
  font-family: system-ui, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',
    'Segoe UI Symbol', 'Noto Color Emoji';
  line-height: 1.5;
  min-height: 100svh;
}

code,
kbd,
pre,
samp {
  font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas,
    'DejaVu Sans Mono', monospace;
}

button,
input,
select,
textarea {
  font: inherit;
  line-height: 1.15;
}

canvas,
img,
svg,
video {
  display: block;
  height: auto;
  max-width: 100%;
}

audio {
  display: block;
  max-width: 100%;
}

/* optional reset */

img {
  font-style: italic;
}

h1,
h2,
h3,
h4,
h5,
h6,
p {
  overflow-wrap: break-word;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  text-wrap: balance;
}

@supports (text-wrap: pretty) {
  p {
    hyphens: auto;
    text-wrap: pretty;
  }
}

p {
  max-width: 75ch;
}

a {
  color: inherit;
  text-decoration: none;
}

#root {
  isolation: isolate;
}
```

## Notes

- Specify the intrinsic size (`height` and `width` attributes) of media elements in the HTML where possible to prevent layout shifts, reduce reflows, and increase rendering speed.
  - Before the media is downloaded and painted to the screen, the browser calculates the media's aspect ratio based on the provided `height` and `width` attributes to reserve an appropriate amount of space in the layout.
- If using a framework and a root [stacking context](https://www.joshwcomeau.com/css/stacking-contexts/), change the root id selector name to match the framework.
  - For example, the top-level HTML element for create-react-app is `<div id="root"></div>` so the correct selector is `#root`.

## Sources

- [modern-normalize](https://github.com/sindresorhus/modern-normalize)
- [Modern Font Stacks](https://modernfontstacks.com/)
- Josh W Comeau's CSS reset: [My Custom CSS Reset](https://www.joshwcomeau.com/css/custom-css-reset/)
- Kevin Powell's CSS reset: [Minimal and kind of opinionated CSS reset](https://codepen.io/kevinpowell/pen/QWxBgZX)
- Andy Bell's CSS reset: [A (more) Modern CSS Reset](https://piccalil.li/blog/a-more-modern-css-reset/)

## Future Reference

- Kevin Powell's [manual system/light/dark mode implementation](https://codepen.io/kevinpowell/pen/KKEevOp)
- Switch from media queries to [`light-dark()`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value/light-dark) for auto (system preference) light/dark mode color scheme when [browser support and compatibility](https://caniuse.com/?search=light-dark()) increases
