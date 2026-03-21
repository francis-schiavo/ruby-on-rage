# CSS Basics

CSS (Cascading Style Sheets) is a stylesheet language used to describe the presentation of a document written in HTML or XML. CSS describes how elements should be rendered on screen, on paper, in speech, or on other media.

## What is CSS?

CSS is a cornerstone technology of the World Wide Web, alongside HTML and JavaScript. It enables the separation of content (HTML) from presentation (CSS), making websites more maintainable and allowing for consistent styling across multiple pages.

## How CSS Works

CSS works by selecting HTML elements and applying styles to them. The browser then renders the styled content.

### CSS Syntax

```css
selector {
  property: value;
  property: value;
}
```

- **Selector**: Identifies which HTML elements to style
- **Property**: The aspect of the element you want to change (e.g., color, font-size)
- **Value**: The value for the property

## Ways to Add CSS to HTML

### External Stylesheet

```html
<head>
  <link rel="stylesheet" href="styles.css">
</head>
```

### Internal Stylesheet

```html
<head>
  <style>
    body { background-color: lightblue; }
  </style>
</head>
```

### Inline Styles

```html
<h1 style="color: red;">Heading</h1>
```

## CSS Comments

```css
/* This is a single-line comment */

/*
This is a
multi-line comment
*/
```

## CSS Units

### Absolute Units

- `px`: Pixels
- `pt`: Points (1/72 inch)
- `pc`: Picas (12 points)
- `in`: Inches
- `cm`: Centimeters
- `mm`: Millimeters

### Relative Units

- `%`: Percentage
- `em`: Relative to the font-size of the element
- `rem`: Relative to the font-size of the root element
- `vw`: 1% of viewport width
- `vh`: 1% of viewport height
- `vmin`: 1% of viewport's smaller dimension
- `vmax`: 1% of viewport's larger dimension

## Color Values

### Named Colors

```css
color: red;
color: blue;
color: green;
```

### Hexadecimal

```css
color: #ff0000; /* Red */
color: #00ff00; /* Green */
color: #0000ff; /* Blue */
color: #ffffff; /* White */
color: #000000; /* Black */
```

### RGB/RGBA

```css
color: rgb(255, 0, 0); /* Red */
color: rgba(255, 0, 0, 0.5); /* Red with 50% opacity */
```

### HSL/HSLA

```css
color: hsl(0, 100%, 50%); /* Red */
color: hsla(0, 100%, 50%, 0.5); /* Red with 50% opacity */
```

## CSS Properties

### Text Properties

```css
font-family: Arial, sans-serif;
font-size: 16px;
font-weight: bold;
color: #333;
text-align: center;
text-decoration: underline;
line-height: 1.5;
```

### Background Properties

```css
background-color: #f0f0f0;
background-image: url('image.jpg');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
```

### Box Model Properties

```css
width: 200px;
height: 100px;
padding: 20px;
border: 1px solid #ccc;
margin: 10px;
```

### Layout Properties

```css
display: block;
position: relative;
float: left;
clear: both;
```

## CSS Specificity

Specificity determines which CSS rule is applied when multiple rules target the same element.

### Specificity Hierarchy

1. Inline styles (highest specificity)
2. ID selectors
3. Class, attribute, and pseudo-class selectors
4. Element selectors (lowest specificity)

### Calculating Specificity

- Element selectors: 1 point each
- Class/attribute/pseudo-class selectors: 10 points each
- ID selectors: 100 points each
- Inline styles: 1000 points

## CSS Cascade

The cascade determines which styles are applied when multiple rules have the same specificity.

### Cascade Order

1. User agent styles (browser defaults)
2. User styles (user-defined styles)
3. Author styles (your CSS)
4. !important declarations

## CSS Inheritance

Some CSS properties are inherited by child elements from their parent elements.

### Inherited Properties

- `color`
- `font-family`
- `font-size`
- `text-align`
- `line-height`

### Non-Inherited Properties

- `width`
- `height`
- `margin`
- `padding`
- `border`

## CSS Reset/Normalize

CSS resets remove default browser styling, while normalize.css makes elements render consistently across browsers.

```css
/* Simple reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
```

## Browser Developer Tools

Modern browsers include developer tools for inspecting and debugging CSS:

- **Elements/Inspector**: View HTML structure and applied CSS
- **Console**: JavaScript debugging
- **Network**: Monitor resource loading
- **Performance**: Analyze page performance

## Best Practices

1. Use external stylesheets for reusability
2. Follow consistent naming conventions
3. Use shorthand properties when possible
4. Avoid inline styles except for dynamic changes
5. Use relative units for responsive design
6. Minimize specificity conflicts
7. Comment your CSS for maintainability
8. Test across different browsers and devices

## Next Steps

Understanding the basics of CSS syntax and how styles are applied is fundamental. Next, you'll learn about CSS selectors, which allow you to target specific HTML elements for styling.
