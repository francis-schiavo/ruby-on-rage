# CSS Selectors

CSS selectors are patterns used to select and style HTML elements. They are the foundation of CSS, allowing you to target specific elements or groups of elements for styling.

## Basic Selectors

### Universal Selector

Selects all elements on the page:

```css
* {
  margin: 0;
  padding: 0;
}
```

### Element Selector (Type Selector)

Selects all elements of a specific type:

```css
p {
  color: blue;
}

h1 {
  font-size: 2em;
}
```

### Class Selector

Selects elements with a specific class attribute:

```html
<p class="highlight">This paragraph is highlighted.</p>
<div class="container">Content</div>
```

```css
.highlight {
  background-color: yellow;
}

.container {
  width: 80%;
  margin: 0 auto;
}
```

### ID Selector

Selects a single element with a specific id attribute:

```html
<div id="header">Header content</div>
```

```css
#header {
  background-color: #333;
  color: white;
}
```

## Combinator Selectors

### Descendant Selector (Space)

Selects all descendants of a specified element:

```html
<div class="container">
  <p>This paragraph is selected.</p>
  <div>
    <p>This paragraph is also selected.</p>
  </div>
</div>
```

```css
.container p {
  color: red;
}
```

### Child Selector (>)

Selects direct children of a specified element:

```html
<div class="container">
  <p>This paragraph is selected.</p>
  <div>
    <p>This paragraph is NOT selected.</p>
  </div>
</div>
```

```css
.container > p {
  color: red;
}
```

### Adjacent Sibling Selector (+)

Selects the immediately following sibling:

```html
<h1>Title</h1>
<p>This paragraph is selected.</p>
<p>This paragraph is NOT selected.</p>
```

```css
h1 + p {
  margin-top: 0;
}
```

### General Sibling Selector (~)

Selects all following siblings:

```html
<h1>Title</h1>
<p>This paragraph is selected.</p>
<div>Some content</div>
<p>This paragraph is also selected.</p>
```

```css
h1 ~ p {
  color: blue;
}
```

## Attribute Selectors

### Presence Selector

Selects elements that have a specific attribute:

```html
<input type="text" required>
<input type="email">
<textarea required></textarea>
```

```css
[required] {
  border: 2px solid red;
}
```

### Value Selector

Selects elements with a specific attribute value:

```html
<input type="text" data-validation="required">
<input type="text" data-validation="optional">
```

```css
[data-validation="required"] {
  border-color: red;
}
```

### Substring Matching

- `[attr^="value"]`: Starts with
- `[attr$="value"]`: Ends with
- `[attr*="value"]`: Contains

```css
/* Links starting with https */
a[href^="https"] {
  color: green;
}

/* Email inputs */
input[type$="email"] {
  background-color: lightblue;
}

/* Elements with 'btn' in class name */
[class*="btn"] {
  border-radius: 4px;
}
```

### Case Sensitivity

By default, attribute selectors are case-sensitive. Use `i` flag for case-insensitive:

```css
[data-type="button" i] {
  /* Matches 'button', 'Button', 'BUTTON', etc. */
}
```

## Pseudo-Class Selectors

### Link States

```css
a:link { color: blue; }        /* Unvisited links */
a:visited { color: purple; }   /* Visited links */
a:hover { color: red; }        /* Mouse over */
a:active { color: orange; }    /* Mouse click */
a:focus { outline: 2px solid blue; } /* Keyboard focus */
```

### Form States

```css
input:focus { border-color: blue; }
input:valid { border-color: green; }
input:invalid { border-color: red; }
input:checked + label { font-weight: bold; }
input:disabled { opacity: 0.5; }
```

### Structural Pseudo-Classes

```css
li:first-child { font-weight: bold; }      /* First child */
li:last-child { margin-bottom: 0; }       /* Last child */
li:nth-child(odd) { background-color: #f0f0f0; }  /* Odd children */
li:nth-child(even) { background-color: #fff; }    /* Even children */
li:nth-child(3n+1) { color: red; }         /* Every 3rd item starting from 1 */
```

### Other Pseudo-Classes

```css
p:empty { display: none; }                 /* Empty paragraphs */
div:not(.special) { opacity: 0.8; }       /* All divs except those with class 'special' */
```

## Pseudo-Element Selectors

### Content Pseudo-Elements

```css
p::before {
  content: "→ ";
  color: blue;
}

p::after {
  content: " ←";
  color: blue;
}
```

### Selection Pseudo-Element

```css
::selection {
  background-color: yellow;
  color: black;
}
```

### First Line/Letter

```css
p::first-line {
  font-weight: bold;
  color: red;
}

p::first-letter {
  font-size: 2em;
  float: left;
  margin-right: 5px;
}
```

## Grouping Selectors

Apply the same styles to multiple selectors:

```css
h1, h2, h3 {
  color: blue;
  font-family: Arial, sans-serif;
}

.header, .footer, .sidebar {
  padding: 20px;
  background-color: #f0f0f0;
}
```

## Selector Specificity

Understanding specificity helps resolve conflicts:

### Specificity Calculation

- Universal selector (*): 0
- Element selectors: 1 each
- Class/attribute/pseudo-class selectors: 10 each
- ID selectors: 100 each
- Inline styles: 1000
- !important: overrides all

### Examples

```css
/* Specificity: 1 (element) */
p { color: red; }

/* Specificity: 10 (class) */
.highlight { color: blue; }

/* Specificity: 100 (ID) */
#unique { color: green; }

/* Specificity: 101 (ID + element) */
#unique p { color: yellow; }

/* Specificity: 110 (ID + class) */
#unique .highlight { color: orange; }
```

## Best Practices

1. **Use classes over IDs** for styling (IDs have high specificity)
2. **Avoid over-qualifying selectors** (e.g., `div.container` when `.container` suffices)
3. **Use semantic class names** that describe purpose, not appearance
4. **Keep specificity low** to make styles easier to override
5. **Use the cascade** effectively with well-organized CSS
6. **Test selectors** in browser developer tools
7. **Document complex selectors** with comments

## Common Selector Patterns

### Navigation Menu

```css
.nav li {
  display: inline-block;
  margin-right: 20px;
}

.nav a {
  text-decoration: none;
  color: #333;
}

.nav a:hover {
  color: blue;
}
```

### Form Styling

```css
form input[type="text"],
form input[type="email"],
form textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

form input:focus,
form textarea:focus {
  border-color: blue;
  outline: none;
}
```

### Card Layout

```css
.card {
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 20px;
}

.card h3 {
  margin-top: 0;
}

.card p:last-child {
  margin-bottom: 0;
}
```

## Debugging Selectors

Use browser developer tools to:
- Inspect elements and see applied styles
- Test selector specificity
- Find which selectors are affecting an element
- Debug layout issues

## Performance Considerations

- **Avoid universal selectors** in performance-critical CSS
- **Use class selectors** instead of complex attribute selectors when possible
- **Minimize selector complexity** for better rendering performance
- **Consider CSS methodology** like BEM for maintainable selectors

Mastering CSS selectors gives you precise control over styling HTML elements, enabling you to create sophisticated and maintainable stylesheets.
