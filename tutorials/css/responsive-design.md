# CSS Responsive Design

Responsive design ensures that web pages look good and function well on all devices, from mobile phones to desktop computers. It involves creating flexible layouts that adapt to different screen sizes.

## Viewport Meta Tag

The viewport meta tag controls how the webpage is displayed on mobile devices:

```html
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
```

- `width=device-width`: Sets the width to the device width
- `initial-scale=1.0`: Sets the initial zoom level to 100%

## Media Queries

Media queries allow you to apply different styles based on device characteristics:

### Basic Syntax

```css
@media media-type and (condition) {
  /* CSS rules */
}
```

### Common Media Types

- `all`: All devices (default)
- `screen`: Computer screens
- `print`: Print preview
- `speech`: Screen readers

### Common Breakpoints

```css
/* Mobile (default) */
.container { width: 100%; }

/* Tablet */
@media (min-width: 768px) {
  .container { width: 750px; }
}

/* Desktop */
@media (min-width: 992px) {
  .container { width: 970px; }
}

/* Large desktop */
@media (min-width: 1200px) {
  .container { width: 1170px; }
}
```

### Media Query Features

```css
/* Width and height */
@media (min-width: 768px) and (max-width: 1024px) { /* Tablet */ }
@media (min-height: 600px) { /* Minimum height */ }

/* Orientation */
@media (orientation: portrait) { /* Portrait mode */ }
@media (orientation: landscape) { /* Landscape mode */ }

/* Resolution */
@media (min-resolution: 2dppx) { /* Retina displays */ }

/* Color capabilities */
@media (color) { /* Color screens */ }
@media (monochrome) { /* Monochrome screens */ }
```

## Flexible Layouts

### Fluid Grids

Use percentages instead of fixed pixels:

```css
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
}

.column {
  width: 100%;
}

@media (min-width: 768px) {
  .column {
    width: 50%;
    float: left;
  }
}
```

### Flexible Images

```css
img {
  max-width: 100%;
  height: auto;
}
```

### Flexible Typography

```css
body {
  font-size: 16px;
}

@media (min-width: 768px) {
  body {
    font-size: 18px;
  }
}

h1 {
  font-size: 2rem; /* Relative to root font size */
}
```

## CSS Units for Responsive Design

### Relative Units

- `em`: Relative to parent element's font-size
- `rem`: Relative to root element's font-size
- `vw`: 1% of viewport width
- `vh`: 1% of viewport height
- `vmin`: 1% of viewport's smaller dimension
- `vmax`: 1% of viewport's larger dimension

### Examples

```css
/* Fluid typography */
h1 {
  font-size: clamp(2rem, 5vw, 4rem); /* Min, preferred, max */
}

/* Fluid spacing */
.container {
  padding: clamp(1rem, 3vw, 2rem);
}

/* Viewport-based sizing */
.hero {
  height: 100vh; /* Full viewport height */
  width: 100vw;  /* Full viewport width */
}
```

## Mobile-First Approach

Design for mobile first, then enhance for larger screens:

```css
/* Base styles (mobile) */
.menu {
  display: none; /* Hidden by default */
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  background: white;
}

.menu-toggle {
  display: block; /* Show hamburger menu */
}

/* Tablet and up */
@media (min-width: 768px) {
  .menu {
    display: flex; /* Show horizontal menu */
    position: static;
    width: auto;
  }
  
  .menu-toggle {
    display: none; /* Hide hamburger menu */
  }
}
```

## Flexbox for Responsive Design

```css
.container {
  display: flex;
  flex-direction: column;
}

@media (min-width: 768px) {
  .container {
    flex-direction: row;
  }
}

.item {
  flex: 1;
}
```

## CSS Grid for Responsive Design

```css
.grid {
  display: grid;
  grid-template-columns: 1fr; /* Single column on mobile */
  gap: 1rem;
}

@media (min-width: 768px) {
  .grid {
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  }
}
```

## Responsive Images

### Srcset and Sizes

```html
<img src="small.jpg"
     srcset="small.jpg 480w,
             medium.jpg 768w,
             large.jpg 1024w"
     sizes="(max-width: 480px) 100vw,
            (max-width: 768px) 50vw,
            33vw"
     alt="Responsive image">
```

### Picture Element

```html
<picture>
  <source media="(min-width: 1024px)" srcset="large.jpg">
  <source media="(min-width: 768px)" srcset="medium.jpg">
  <img src="small.jpg" alt="Responsive image">
</picture>
```

## Responsive Typography

### Fluid Typography

```css
html {
  font-size: 16px;
}

@media (min-width: 768px) {
  html {
    font-size: 18px;
  }
}

@media (min-width: 1024px) {
  html {
    font-size: 20px;
  }
}
```

### CSS Custom Properties

```css
:root {
  --font-size-base: 1rem;
  --font-size-large: 1.25rem;
  --spacing-unit: 1rem;
}

@media (min-width: 768px) {
  :root {
    --font-size-base: 1.125rem;
    --font-size-large: 1.5rem;
    --spacing-unit: 1.25rem;
  }
}

body {
  font-size: var(--font-size-base);
}

h1 {
  font-size: var(--font-size-large);
}

.container {
  padding: var(--spacing-unit);
}
```

## Responsive Navigation

### Hamburger Menu

```html
<nav class="nav">
  <button class="nav-toggle" aria-expanded="false">
    <span class="sr-only">Menu</span>
    <span class="hamburger"></span>
  </button>
  <ul class="nav-menu">
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
```

```css
.nav-menu {
  display: none;
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  background: white;
  flex-direction: column;
}

.nav-toggle[aria-expanded="true"] + .nav-menu {
  display: flex;
}

@media (min-width: 768px) {
  .nav-menu {
    display: flex;
    position: static;
    width: auto;
    flex-direction: row;
  }
  
  .nav-toggle {
    display: none;
  }
}
```

## Testing Responsive Design

### Browser Developer Tools

- Toggle device toolbar
- Test different device presets
- Emulate touch events
- Test network throttling

### Real Device Testing

- Test on actual mobile devices
- Check different browsers
- Test in various orientations

### Automated Testing

```javascript
// Check viewport width
const mediaQuery = window.matchMedia('(min-width: 768px)');

function handleMediaQuery(e) {
  if (e.matches) {
    // Tablet and up
  } else {
    // Mobile
  }
}

mediaQuery.addListener(handleMediaQuery);
handleMediaQuery(mediaQuery);
```

## Common Responsive Patterns

### Responsive Cards

```css
.cards {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}

@media (min-width: 768px) {
  .cards {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .cards {
    grid-template-columns: repeat(3, 1fr);
  }
}
```

### Responsive Tables

```css
.table-container {
  overflow-x: auto;
}

table {
  min-width: 600px;
}
```

## Performance Considerations

- Use appropriate image formats and sizes
- Minimize CSS with unused media queries
- Consider critical CSS for above-the-fold content
- Use `loading="lazy"` for images below the fold

## Best Practices

1. **Design mobile-first** with progressive enhancement
2. **Use relative units** (rem, em, %) instead of fixed pixels
3. **Test on real devices** and various screen sizes
4. **Optimize images** for different screen densities
5. **Use semantic HTML** for better accessibility
6. **Consider touch targets** (minimum 44px)
7. **Test performance** across different network conditions
8. **Use CSS Grid and Flexbox** for modern layouts

Responsive design ensures your website provides an optimal viewing experience across all devices, improving user satisfaction and SEO rankings.
