# HTML Integration with CSS and JavaScript

HTML provides the structure and content of web pages, while CSS handles presentation and JavaScript adds interactivity. Understanding how these three technologies work together is essential for modern web development.

## Linking CSS to HTML

There are several ways to include CSS in HTML documents:

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
    h1 { color: navy; }
  </style>
</head>
```

### Inline Styles

```html
<h1 style="color: red; font-size: 24px;">Heading</h1>
```

## CSS Selectors and HTML

CSS uses selectors to target HTML elements:

### Element Selectors

```css
p { color: blue; }
h1 { font-size: 2em; }
```

### Class Selectors

```html
<p class="highlight">This paragraph is highlighted.</p>
```

```css
.highlight { background-color: yellow; }
```

### ID Selectors

```html
<div id="main-content">Main content here</div>
```

```css
#main-content { width: 80%; margin: 0 auto; }
```

### Attribute Selectors

```html
<input type="email" data-validation="required">
```

```css
input[data-validation="required"] { border: 2px solid red; }
```

## CSS Box Model

Understanding how CSS treats HTML elements as boxes:

```css
.box {
  width: 200px;
  height: 100px;
  padding: 20px;
  border: 2px solid black;
  margin: 10px;
}
```

- **Content**: The actual content of the element
- **Padding**: Space between content and border
- **Border**: The border around the padding
- **Margin**: Space outside the border

## CSS Layout Techniques

### Flexbox

```html
<div class="container">
  <div class="item">Item 1</div>
  <div class="item">Item 2</div>
  <div class="item">Item 3</div>
</div>
```

```css
.container {
  display: flex;
  justify-content: space-between;
}

.item {
  flex: 1;
}
```

### CSS Grid

```html
<div class="grid">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="main">Main Content</div>
  <div class="footer">Footer</div>
</div>
```

```css
.grid {
  display: grid;
  grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";
  grid-template-columns: 200px 1fr;
  grid-template-rows: auto 1fr auto;
}
```

## Linking JavaScript to HTML

### External Script

```html
<script src="script.js"></script>
```

### Internal Script

```html
<script>
  console.log('Hello, World!');
</script>
```

### Inline Event Handlers

```html
<button onclick="alert('Hello!')">Click me</button>
```

## DOM Manipulation with JavaScript

JavaScript can dynamically modify HTML content:

### Selecting Elements

```javascript
// By ID
const element = document.getElementById('myElement');

// By class name
const elements = document.getElementsByClassName('myClass');

// By tag name
const paragraphs = document.getElementsByTagName('p');

// By CSS selector
const item = document.querySelector('.item');
const items = document.querySelectorAll('.item');
```

### Modifying Content

```javascript
// Change text content
element.textContent = 'New text';

// Change HTML content
element.innerHTML = '<strong>New HTML</strong>';

// Change attributes
element.setAttribute('class', 'new-class');
element.classList.add('active');
```

### Creating and Adding Elements

```javascript
// Create new element
const newDiv = document.createElement('div');
newDiv.textContent = 'New element';

// Add to DOM
document.body.appendChild(newDiv);

// Insert before another element
const referenceElement = document.getElementById('reference');
referenceElement.parentNode.insertBefore(newDiv, referenceElement);
```

## Event Handling

JavaScript can respond to user interactions:

```javascript
// Method 1: Inline (not recommended)
<button onclick="handleClick()">Click me</button>

// Method 2: Event listener
const button = document.querySelector('button');
button.addEventListener('click', handleClick);

function handleClick() {
  alert('Button clicked!');
}
```

### Common Events

- `click`: Mouse click
- `submit`: Form submission
- `input`: Input value change
- `change`: Select value change
- `keydown`/`keyup`: Keyboard events
- `load`: Page/element loaded
- `scroll`: Scrolling

## Form Handling

```html
<form id="myForm">
  <input type="text" id="name" required>
  <input type="email" id="email" required>
  <button type="submit">Submit</button>
</form>
```

```javascript
const form = document.getElementById('myForm');

form.addEventListener('submit', function(e) {
  e.preventDefault(); // Prevent default form submission
  
  const name = document.getElementById('name').value;
  const email = document.getElementById('email').value;
  
  if (name && email) {
    console.log('Form submitted:', { name, email });
    // Send data to server
  }
});
```

## CSS-in-JS

Modern approaches combine CSS with JavaScript:

```javascript
// Using template literals
const styles = `
  .button {
    background: ${theme.primaryColor};
    color: white;
    padding: 10px 20px;
  }
`;

// Dynamic styling
element.style.backgroundColor = 'red';
element.style.transform = 'translateX(100px)';
```

## Responsive Design

CSS media queries work with HTML structure:

```css
/* Mobile first */
.container { width: 100%; }

/* Tablet */
@media (min-width: 768px) {
  .container { width: 750px; }
}

/* Desktop */
@media (min-width: 992px) {
  .container { width: 970px; }
}
```

## Performance Considerations

1. **CSS**: Minimize reflows and repaints
2. **JavaScript**: Use efficient DOM manipulation
3. **Loading**: Optimize loading order (CSS in head, JS at bottom)
4. **Caching**: Leverage browser caching for external files

## Best Practices

### HTML
- Use semantic elements
- Maintain clean, readable structure
- Use appropriate attributes

### CSS
- Use external stylesheets for reusability
- Follow naming conventions (BEM, SMACSS)
- Avoid inline styles except for dynamic changes
- Use CSS custom properties (variables)

### JavaScript
- Use event delegation for dynamic elements
- Avoid inline event handlers
- Separate concerns (HTML for structure, CSS for style, JS for behavior)
- Use modern APIs and frameworks when appropriate

### Integration
- Load CSS early, JS late
- Use CSS for animations when possible (better performance)
- Keep JavaScript unobtrusive
- Test across different browsers and devices

The separation of concerns between HTML, CSS, and JavaScript creates maintainable, scalable web applications.
