# Introduction to Sass

Sass (Syntactically Awesome Style Sheets) is a CSS preprocessor that extends CSS with features like variables, nesting, mixins, and functions. It makes CSS more maintainable, reusable, and powerful.

## What is Sass?

Sass is a preprocessor that compiles to CSS. It adds powerful features to CSS while maintaining backward compatibility. There are two syntaxes: SCSS (Sassy CSS) and Sass (indented syntax).

### SCSS vs Sass

```scss
// SCSS (recommended)
.container {
  width: 100%;
  .item {
    color: red;
  }
}
```

```sass
// Sass (indented)
.container
  width: 100%
  .item
    color: red
```

## Installation and Setup

### Using npm

```bash
npm install -g sass
```

### Using Ruby (if you have Ruby installed)

```bash
gem install sass
```

### Compilation

```bash
# Watch a file
sass --watch input.scss output.css

# Watch a directory
sass --watch src/sass:dist/css
```

## Variables

Variables store reusable values like colors, fonts, and sizes.

```scss
// Variables
$primary-color: #007bff;
$font-stack: 'Helvetica Neue', Helvetica, Arial, sans-serif;
$border-radius: 4px;

// Usage
.button {
  background-color: $primary-color;
  font-family: $font-stack;
  border-radius: $border-radius;
}
```

### Variable Scope

```scss
$global-var: global;

.container {
  $local-var: local; // Only available in this scope
  color: $global-var; // Works
  background: $local-var; // Works
}

.outside {
  color: $global-var; // Works
  background: $local-var; // Error: undefined
}
```

### Default Values

```scss
$font-size: 16px !default;

.button {
  font-size: $font-size;
}
```

## Nesting

Nesting allows you to write CSS that mirrors your HTML structure.

```scss
.nav {
  background: #333;
  
  ul {
    list-style: none;
    margin: 0;
    padding: 0;
    
    li {
      display: inline-block;
      
      a {
        color: white;
        text-decoration: none;
        padding: 10px;
        
        &:hover {
          background: #555;
        }
      }
    }
  }
}
```

Compiles to:

```css
.nav {
  background: #333;
}
.nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
.nav ul li {
  display: inline-block;
}
.nav ul li a {
  color: white;
  text-decoration: none;
  padding: 10px;
}
.nav ul li a:hover {
  background: #555;
}
```

## Partials and Imports

Partials are Sass files that contain reusable code snippets.

```scss
// _variables.scss
$primary: #007bff;
$secondary: #6c757d;

// _mixins.scss
@mixin button($color) {
  background: $color;
  border: 1px solid darken($color, 10%);
  border-radius: 4px;
  padding: 10px 20px;
}

// main.scss
@import 'variables';
@import 'mixins';

.button-primary {
  @include button($primary);
}

.button-secondary {
  @include button($secondary);
}
```

## Mixins

Mixins are reusable blocks of CSS that can accept parameters.

```scss
// Basic mixin
@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
  -moz-border-radius: $radius;
  border-radius: $radius;
}

.box {
  @include border-radius(10px);
}

// Mixin with default values
@mixin box-shadow($x: 0, $y: 2px, $blur: 4px, $color: rgba(0,0,0,0.1)) {
  -webkit-box-shadow: $x $y $blur $color;
  -moz-box-shadow: $x $y $blur $color;
  box-shadow: $x $y $blur $color;
}

.card {
  @include box-shadow(0, 4px, 8px, rgba(0,0,0,0.2));
}

// Content blocks
@mixin media-query($breakpoint) {
  @if $breakpoint == tablet {
    @media (min-width: 768px) { @content; }
  } @else if $breakpoint == desktop {
    @media (min-width: 1024px) { @content; }
  }
}

.container {
  width: 100%;
  
  @include media-query(tablet) {
    width: 750px;
  }
  
  @include media-query(desktop) {
    width: 970px;
  }
}
```

## Functions

Functions perform calculations and return values.

```scss
// Built-in functions
$width: 100px;
$double: $width * 2; // 200px

// Custom functions
@function calculate-rem($size) {
  $rem-size: $size / 16px;
  @return #{$rem-size}rem;
}

.heading {
  font-size: calculate-rem(32px); // 2rem
}

// Color functions
$color: #007bff;
.darker {
  background: darken($color, 10%);
}

.lighter {
  background: lighten($color, 10%);
}

.saturated {
  background: saturate($color, 20%);
}
```

## Inheritance

Extend existing selectors with additional properties.

```scss
// Placeholder selector
%button-base {
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

.button-primary {
  @extend %button-base;
  background: #007bff;
  color: white;
}

.button-secondary {
  @extend %button-base;
  background: #6c757d;
  color: white;
}
```

## Control Directives

### @if / @else

```scss
@mixin button-variant($color, $background) {
  color: $color;
  background: $background;
  
  @if lightness($background) < 50% {
    border-color: lighten($background, 20%);
  } @else {
    border-color: darken($background, 20%);
  }
}
```

### @for

```scss
@for $i from 1 through 3 {
  .col-#{$i} {
    width: 100% / $i;
  }
}
```

### @each

```scss
$colors: (primary: #007bff, secondary: #6c757d, success: #28a745);

@each $name, $color in $colors {
  .text-#{$name} {
    color: $color;
  }
}
```

### @while

```scss
$i: 1;
@while $i <= 3 {
  .item-#{$i} {
    width: 100px * $i;
  }
  $i: $i + 1;
}
```

## Maps

Maps are key-value data structures.

```scss
$breakpoints: (
  small: 576px,
  medium: 768px,
  large: 992px,
  extra-large: 1200px
);

@mixin media-query($size) {
  @if map-has-key($breakpoints, $size) {
    @media (min-width: map-get($breakpoints, $size)) {
      @content;
    }
  }
}

.container {
  width: 100%;
  
  @include media-query(medium) {
    width: 750px;
  }
}
```

## Best Practices

### File Organization

```
sass/
├── base/
│   ├── _reset.scss
│   ├── _typography.scss
│   └── _colors.scss
├── components/
│   ├── _buttons.scss
│   ├── _cards.scss
│   └── _forms.scss
├── layout/
│   ├── _header.scss
│   ├── _footer.scss
│   └── _sidebar.scss
├── pages/
│   ├── _home.scss
│   └── _about.scss
├── utils/
│   ├── _variables.scss
│   ├── _functions.scss
│   └── _mixins.scss
└── main.scss
```

### Naming Conventions

- Use hyphens for variable names: `$primary-color`
- Use descriptive names: `$button-padding` instead of `$bp`
- Follow BEM methodology for classes

### Performance

- Avoid deeply nested selectors
- Use `&` for pseudo-classes and modifiers
- Minimize the use of `@extend` (can bloat CSS)
- Use placeholders for extends when possible

## Integration with Build Tools

### Webpack

```javascript
// webpack.config.js
module.exports = {
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          'style-loader',
          'css-loader',
          'sass-loader'
        ]
      }
    ]
  }
};
```

### Gulp

```javascript
const gulp = require('gulp');
const sass = require('gulp-sass');

gulp.task('sass', function() {
  return gulp.src('src/scss/**/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('dist/css'));
});
```

## Debugging

### Source Maps

Enable source maps for easier debugging:

```bash
sass --watch --source-map src/scss:dist/css
```

### Sass Error Messages

Sass provides detailed error messages with file names and line numbers.

## Migration from CSS

Start small by converting existing CSS files to SCSS:

1. Rename `.css` files to `.scss`
2. Add variables for repeated values
3. Use nesting for related selectors
4. Create mixins for repeated patterns
5. Split into partials for organization

Sass enhances CSS with powerful features while maintaining the familiarity of CSS syntax. It helps create more maintainable, scalable, and efficient stylesheets.
