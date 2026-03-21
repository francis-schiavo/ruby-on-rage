# DOM Manipulation

The Document Object Model (DOM) is a programming interface for HTML and XML documents. It represents the page as a tree of objects that can be manipulated with JavaScript.

## Understanding the DOM

The DOM represents HTML as a tree structure:

```html
<!DOCTYPE html>
<html>
<head>
  <title>My Page</title>
</head>
<body>
  <h1>Hello World</h1>
  <p>This is a paragraph.</p>
  <div>
    <span>Span inside div</span>
  </div>
</body>
</html>
```

This creates a tree:
```
document
└── html
    ├── head
    │   └── title
    └── body
        ├── h1
        ├── p
        └── div
            └── span
```

## Selecting Elements

### getElementById

```javascript
let element = document.getElementById('myId');
```

### getElementsByClassName

```javascript
let elements = document.getElementsByClassName('myClass');
// Returns HTMLCollection
```

### getElementsByTagName

```javascript
let paragraphs = document.getElementsByTagName('p');
let allDivs = document.getElementsByTagName('div');
```

### querySelector

```javascript
// Selects first matching element
let element = document.querySelector('.myClass');
let link = document.querySelector('a[href="#"]');
let nested = document.querySelector('div > p');
```

### querySelectorAll

```javascript
// Selects all matching elements
let elements = document.querySelectorAll('.myClass');
// Returns NodeList
```

## Working with Element Content

### innerHTML

```javascript
let div = document.querySelector('#content');

// Get HTML content
let html = div.innerHTML;

// Set HTML content
div.innerHTML = '<p>New content</p>';

// Append HTML
div.innerHTML += '<span>More content</span>';
```

### textContent

```javascript
let paragraph = document.querySelector('p');

// Get text content (ignores HTML tags)
let text = paragraph.textContent; // "Hello <strong>world</strong>"

// Set text content (escapes HTML)
paragraph.textContent = 'Hello <strong>world</strong>';
// Result: Hello &lt;strong&gt;world&lt;/strong&gt;
```

### innerText

```javascript
// Similar to textContent but considers CSS styling
let visibleText = element.innerText;
```

## Modifying Attributes

### getAttribute and setAttribute

```javascript
let link = document.querySelector('a');

// Get attribute
let href = link.getAttribute('href');

// Set attribute
link.setAttribute('href', 'https://example.com');

// Remove attribute
link.removeAttribute('title');
```

### Direct Property Access

```javascript
let input = document.querySelector('input');

// For standard attributes
input.value = 'New value';
input.disabled = true;
link.href = 'https://example.com';

// For data attributes
element.dataset.userId = '123';
element.dataset.customValue = 'value';
```

## Modifying Styles

### style Property

```javascript
let element = document.querySelector('.box');

element.style.backgroundColor = 'red';
element.style.width = '200px';
element.style.height = '100px';
element.style.border = '1px solid black';
element.style.borderRadius = '5px';
```

### CSS Classes

```javascript
let element = document.querySelector('.box');

// Add class
element.classList.add('active');

// Remove class
element.classList.remove('hidden');

// Toggle class
element.classList.toggle('visible');

// Check if class exists
if (element.classList.contains('active')) {
  // Do something
}

// Replace class
element.classList.replace('oldClass', 'newClass');

// Add multiple classes
element.classList.add('class1', 'class2');

// Remove multiple classes
element.classList.remove('class1', 'class2');
```

## Creating and Adding Elements

### createElement

```javascript
let newDiv = document.createElement('div');
let newParagraph = document.createElement('p');
let newImage = document.createElement('img');
```

### Setting Properties

```javascript
let img = document.createElement('img');
img.src = 'image.jpg';
img.alt = 'Description';
img.className = 'thumbnail';
img.style.width = '200px';
```

### Adding to DOM

```javascript
let parent = document.querySelector('#container');
let newElement = document.createElement('p');
newElement.textContent = 'New paragraph';

// Append as last child
parent.appendChild(newElement);

// Insert before specific element
let reference = document.querySelector('#reference');
parent.insertBefore(newElement, reference);

// Insert at specific position
parent.insertAdjacentElement('beforeend', newElement);

// Using modern methods
parent.append(newElement); // Can append multiple
parent.prepend(newElement); // Add as first child
```

## Removing Elements

### removeChild

```javascript
let parent = document.querySelector('#container');
let child = document.querySelector('#toRemove');

parent.removeChild(child);
```

### remove (Modern)

```javascript
let element = document.querySelector('#toRemove');
element.remove();
```

## Replacing Elements

```javascript
let oldElement = document.querySelector('#old');
let newElement = document.createElement('div');
newElement.textContent = 'New content';

// Replace
oldElement.parentNode.replaceChild(newElement, oldElement);

// Modern way
oldElement.replaceWith(newElement);
```

## Cloning Elements

```javascript
let original = document.querySelector('#original');
let clone = original.cloneNode(); // Shallow clone
let deepClone = original.cloneNode(true); // Deep clone (includes children)

// Add the clone to DOM
original.parentNode.appendChild(clone);
```

## Traversing the DOM

### Parent Navigation

```javascript
let child = document.querySelector('#child');

let parent = child.parentNode;
let parentElement = child.parentElement; // Same as parentNode for elements
```

### Child Navigation

```javascript
let parent = document.querySelector('#parent');

// First and last child
let firstChild = parent.firstChild; // Includes text nodes
let lastChild = parent.lastChild;

let firstElement = parent.firstElementChild; // Only elements
let lastElement = parent.lastElementChild;

// All children
let children = parent.children; // HTMLCollection of elements
let childNodes = parent.childNodes; // NodeList including text nodes
```

### Sibling Navigation

```javascript
let element = document.querySelector('#middle');

// Previous sibling
let prevSibling = element.previousSibling;
let prevElement = element.previousElementSibling;

// Next sibling
let nextSibling = element.nextSibling;
let nextElement = element.nextElementSibling;
```

## Event Handling

### Adding Event Listeners

```javascript
let button = document.querySelector('#myButton');

// Method 1: addEventListener
button.addEventListener('click', function(event) {
  console.log('Button clicked!');
  console.log('Event type:', event.type);
  console.log('Target:', event.target);
});

// Method 2: Inline (not recommended)
button.onclick = function() {
  console.log('Button clicked!');
};
```

### Event Object

```javascript
button.addEventListener('click', function(event) {
  event.preventDefault(); // Prevent default action
  event.stopPropagation(); // Stop event bubbling
  
  console.log('Mouse X:', event.clientX);
  console.log('Mouse Y:', event.clientY);
  console.log('Which button:', event.button);
});
```

### Event Types

```javascript
let input = document.querySelector('input');

// Mouse events
element.addEventListener('click', handler);
element.addEventListener('dblclick', handler);
element.addEventListener('mousedown', handler);
element.addEventListener('mouseup', handler);
element.addEventListener('mousemove', handler);

// Keyboard events
input.addEventListener('keydown', handler);
input.addEventListener('keyup', handler);
input.addEventListener('keypress', handler);

// Form events
input.addEventListener('focus', handler);
input.addEventListener('blur', handler);
input.addEventListener('change', handler);
input.addEventListener('input', handler);

// Window events
window.addEventListener('load', handler);
window.addEventListener('resize', handler);
window.addEventListener('scroll', handler);
```

### Event Delegation

```javascript
// Instead of adding listeners to each li
document.querySelector('#list').addEventListener('click', function(event) {
  if (event.target.tagName === 'LI') {
    console.log('List item clicked:', event.target.textContent);
  }
});
```

### Removing Event Listeners

```javascript
function handleClick() {
  console.log('Clicked!');
}

button.addEventListener('click', handleClick);
// Remove specific listener
button.removeEventListener('click', handleClick);

// Remove all listeners (not straightforward)
button.onclick = null;
```

## Form Handling

### Getting Form Values

```javascript
let form = document.querySelector('#myForm');

form.addEventListener('submit', function(event) {
  event.preventDefault();
  
  let formData = new FormData(form);
  
  // Get individual values
  let name = form.elements['name'].value;
  let email = form.elements['email'].value;
  
  // Or iterate through all fields
  for (let [key, value] of formData.entries()) {
    console.log(`${key}: ${value}`);
  }
});
```

### Dynamic Form Creation

```javascript
function addInputField(container, name, type = 'text') {
  let input = document.createElement('input');
  input.type = type;
  input.name = name;
  input.placeholder = `Enter ${name}`;
  
  let label = document.createElement('label');
  label.textContent = name + ': ';
  label.appendChild(input);
  
  container.appendChild(label);
  container.appendChild(document.createElement('br'));
}

let form = document.querySelector('#dynamicForm');
addInputField(form, 'username');
addInputField(form, 'email', 'email');
addInputField(form, 'password', 'password');
```

## Performance Considerations

### Minimize DOM Access

```javascript
// Bad - multiple DOM accesses
let list = document.querySelector('#list');
for (let i = 0; i < 100; i++) {
  list.innerHTML += '<li>Item ' + i + '</li>';
}

// Good - build string then update DOM once
let list = document.querySelector('#list');
let html = '';
for (let i = 0; i < 100; i++) {
  html += '<li>Item ' + i + '</li>';
}
list.innerHTML = html;
```

### Use Document Fragments

```javascript
let fragment = document.createDocumentFragment();

for (let i = 0; i < 100; i++) {
  let li = document.createElement('li');
  li.textContent = 'Item ' + i;
  fragment.appendChild(li);
}

document.querySelector('#list').appendChild(fragment);
```

### Debounce Events

```javascript
function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

window.addEventListener('resize', debounce(function() {
  console.log('Window resized');
}, 250));
```

## Common Patterns

### Toggle Visibility

```javascript
function toggleVisibility(selector) {
  let element = document.querySelector(selector);
  element.style.display = element.style.display === 'none' ? 'block' : 'none';
}

// Usage
document.querySelector('#toggleBtn').addEventListener('click', function() {
  toggleVisibility('#content');
});
```

### Dynamic List Management

```javascript
let list = document.querySelector('#dynamicList');

function addItem(text) {
  let li = document.createElement('li');
  li.textContent = text;
  
  let removeBtn = document.createElement('button');
  removeBtn.textContent = 'Remove';
  removeBtn.addEventListener('click', function() {
    li.remove();
  });
  
  li.appendChild(removeBtn);
  list.appendChild(li);
}

function clearList() {
  list.innerHTML = '';
}

// Usage
document.querySelector('#addBtn').addEventListener('click', function() {
  let input = document.querySelector('#itemInput');
  if (input.value.trim()) {
    addItem(input.value.trim());
    input.value = '';
  }
});
```

### Modal Dialog

```javascript
function showModal(content) {
  let modal = document.createElement('div');
  modal.className = 'modal';
  modal.innerHTML = `
    <div class="modal-content">
      <span class="close">&times;</span>
      ${content}
    </div>
  `;
  
  document.body.appendChild(modal);
  
  // Close modal when clicking X or outside
  modal.querySelector('.close').addEventListener('click', () => modal.remove());
  modal.addEventListener('click', (e) => {
    if (e.target === modal) modal.remove();
  });
}

// Usage
document.querySelector('#showModal').addEventListener('click', function() {
  showModal('<h2>Modal Title</h2><p>Modal content...</p>');
});
```

## Best Practices

1. **Cache DOM queries** when used multiple times
2. **Use event delegation** for dynamic content
3. **Minimize DOM manipulations** in loops
4. **Use semantic HTML** for better accessibility
5. **Handle browser compatibility** with fallbacks
6. **Clean up event listeners** to prevent memory leaks
7. **Use data attributes** for storing custom data
8. **Test across different browsers** and devices

DOM manipulation is a core skill for front-end development. Understanding these techniques allows you to create dynamic, interactive web applications.
