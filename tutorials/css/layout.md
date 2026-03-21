# CSS Layout

CSS layout techniques determine how elements are positioned and sized on a web page. Modern CSS provides powerful tools for creating responsive, flexible layouts.

## Traditional Layout Methods

### Float-Based Layout

```html
<div class="container">
  <div class="sidebar">Sidebar</div>
  <div class="main">Main content</div>
</div>
```

```css
.sidebar {
  float: left;
  width: 30%;
}

.main {
  float: left;
  width: 70%;
}

/* Clear floats */
.container::after {
  content: "";
  display: table;
  clear: both;
}
```

### Position-Based Layout

```css
.static {
  position: static; /* Default */
}

.relative {
  position: relative;
  top: 10px;
  left: 20px;
}

.absolute {
  position: absolute;
  top: 0;
  right: 0;
}

.fixed {
  position: fixed;
  bottom: 20px;
  right: 20px;
}

.sticky {
  position: sticky;
  top: 0;
}
```

## Modern Layout: Flexbox

Flexbox is a one-dimensional layout method for arranging items in rows or columns.

### Flex Container

```css
.container {
  display: flex;
  /* or inline-flex */
}
```

### Flex Direction

```css
.container {
  flex-direction: row; /* Default: left to right */
  flex-direction: row-reverse; /* Right to left */
  flex-direction: column; /* Top to bottom */
  flex-direction: column-reverse; /* Bottom to top */
}
```

### Justify Content (Main Axis)

```css
.container {
  justify-content: flex-start; /* Default */
  justify-content: flex-end;
  justify-content: center;
  justify-content: space-between; /* Equal space between items */
  justify-content: space-around; /* Equal space around items */
  justify-content: space-evenly; /* Equal space between and around */
}
```

### Align Items (Cross Axis)

```css
.container {
  align-items: stretch; /* Default */
  align-items: flex-start;
  align-items: flex-end;
  align-items: center;
  align-items: baseline;
}
```

### Flex Items

```css
.item {
  flex-grow: 0; /* Default: don't grow */
  flex-shrink: 1; /* Default: shrink if needed */
  flex-basis: auto; /* Default size */
  
  /* Shorthand */
  flex: 1 1 auto; /* flex-grow | flex-shrink | flex-basis */
  
  /* Common shortcuts */
  flex: 1; /* flex: 1 1 0% */
  flex: none; /* flex: 0 0 auto */
}
```

### Align Self

```css
.item {
  align-self: auto; /* Default */
  align-self: flex-start;
  align-self: flex-end;
  align-self: center;
  align-self: stretch;
}
```

### Flexbox Examples

#### Navigation Bar

```html
<nav class="nav">
  <div class="logo">Logo</div>
  <ul class="nav-links">
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
```

```css
.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
}

.nav-links {
  display: flex;
  list-style: none;
  gap: 2rem;
}
```

#### Card Layout

```html
<div class="card">
  <img src="image.jpg" alt="Card image">
  <div class="card-content">
    <h3>Card Title</h3>
    <p>Card description...</p>
    <button>Read More</button>
  </div>
</div>
```

```css
.card {
  display: flex;
  flex-direction: column;
  max-width: 300px;
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden;
}

.card-content {
  padding: 1rem;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
}

.card-content button {
  margin-top: auto;
  align-self: flex-start;
}
```

## Modern Layout: CSS Grid

CSS Grid is a two-dimensional layout system for creating complex layouts.

### Grid Container

```css
.container {
  display: grid;
  /* or inline-grid */
}
```

### Grid Template Columns/Rows

```css
.container {
  /* Fixed sizes */
  grid-template-columns: 100px 200px 100px;
  
  /* Flexible units */
  grid-template-columns: 1fr 2fr 1fr;
  
  /* Mixed units */
  grid-template-columns: 200px 1fr 200px;
  
  /* Repeat function */
  grid-template-columns: repeat(3, 1fr);
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  
  /* Named lines */
  grid-template-columns: [start] 1fr [middle] 2fr [end];
}
```

### Grid Gap

```css
.container {
  grid-gap: 20px; /* Both row and column */
  grid-row-gap: 10px;
  grid-column-gap: 20px;
  
  /* Modern syntax */
  gap: 20px;
}
```

### Grid Items

```css
.item {
  /* Span multiple tracks */
  grid-column: span 2;
  grid-row: span 3;
  
  /* Specific start/end lines */
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 1;
  grid-row-end: 4;
  
  /* Shorthand */
  grid-column: 1 / 3;
  grid-row: 1 / 4;
  
  /* Named areas */
  grid-area: header;
}
```

### Grid Areas

```css
.container {
  grid-template-areas:
    "header header header"
    "sidebar main main"
    "footer footer footer";
}

.header { grid-area: header; }
.sidebar { grid-area: sidebar; }
.main { grid-area: main; }
.footer { grid-area: footer; }
```

### Justify/Align Items

```css
.container {
  justify-items: start; /* Default */
  justify-items: end;
  justify-items: center;
  justify-items: stretch;
  
  align-items: start;
  align-items: end;
  align-items: center;
  align-items: stretch;
}
```

### Justify/Align Content

```css
.container {
  justify-content: start;
  justify-content: end;
  justify-content: center;
  justify-content: space-between;
  justify-content: space-around;
  justify-content: space-evenly;
  
  align-content: start;
  align-content: end;
  align-content: center;
  align-content: space-between;
  align-content: space-around;
  align-content: stretch;
}
```

### Grid Examples

#### Holy Grail Layout

```html
<div class="container">
  <header>Header</header>
  <nav>Navigation</nav>
  <main>Main Content</main>
  <aside>Sidebar</aside>
  <footer>Footer</footer>
</div>
```

```css
.container {
  display: grid;
  grid-template-columns: 200px 1fr 200px;
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "header header header"
    "nav main aside"
    "footer footer footer";
  min-height: 100vh;
}

header { grid-area: header; }
nav { grid-area: nav; }
main { grid-area: main; }
aside { grid-area: aside; }
footer { grid-area: footer; }
```

#### Responsive Grid

```css
.container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1rem;
}
```

## Responsive Design

### Media Queries

```css
/* Mobile first */
.container {
  display: flex;
  flex-direction: column;
}

/* Tablet */
@media (min-width: 768px) {
  .container {
    flex-direction: row;
  }
}

/* Desktop */
@media (min-width: 1024px) {
  .container {
    display: grid;
    grid-template-columns: 1fr 3fr 1fr;
  }
}
```

### Container Queries (Modern)

```css
@container (min-width: 400px) {
  .card {
    display: flex;
  }
}
```

## Layout Best Practices

1. **Use Flexbox** for one-dimensional layouts
2. **Use CSS Grid** for two-dimensional layouts
3. **Avoid floats** for new layouts (use modern methods)
4. **Design mobile-first** with responsive breakpoints
5. **Use semantic HTML** with appropriate ARIA attributes
6. **Test layouts** across different screen sizes
7. **Consider performance** (avoid complex nested grids)
8. **Use CSS custom properties** for consistent spacing

## Layout Debugging

### CSS Grid Inspector

```css
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1rem;
  
  /* Debug grid lines */
  background: repeating-linear-gradient(
    to right,
    transparent,
    transparent 1rem,
    rgba(255, 0, 0, 0.1) 1rem,
    rgba(255, 0, 0, 0.1) calc(1rem + 1px)
  );
}
```

### Flexbox Debugging

```css
.container {
  display: flex;
  outline: 1px solid red;
}

.item {
  outline: 1px solid blue;
}
```

Modern CSS layout methods like Flexbox and CSS Grid provide powerful, flexible ways to create responsive layouts that work across all devices and screen sizes.
