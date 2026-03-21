# Events

Events are actions or occurrences that happen in the browser that JavaScript can respond to. They allow you to create interactive web applications by responding to user actions and other browser events.

## Event Types

### Mouse Events

```javascript
element.addEventListener('click', function(event) {
  console.log('Element clicked');
});

element.addEventListener('dblclick', function(event) {
  console.log('Element double-clicked');
});

element.addEventListener('mousedown', function(event) {
  console.log('Mouse button pressed');
});

element.addEventListener('mouseup', function(event) {
  console.log('Mouse button released');
});

element.addEventListener('mousemove', function(event) {
  console.log('Mouse moved:', event.clientX, event.clientY);
});

element.addEventListener('mouseenter', function(event) {
  console.log('Mouse entered element');
});

element.addEventListener('mouseleave', function(event) {
  console.log('Mouse left element');
});

element.addEventListener('contextmenu', function(event) {
  event.preventDefault(); // Prevent right-click menu
  console.log('Right-click detected');
});
```

### Keyboard Events

```javascript
input.addEventListener('keydown', function(event) {
  console.log('Key pressed:', event.key);
  console.log('Key code:', event.keyCode); // Deprecated, use key instead
});

input.addEventListener('keyup', function(event) {
  console.log('Key released:', event.key);
});

input.addEventListener('keypress', function(event) {
  console.log('Key pressed and released');
});

// Special keys
document.addEventListener('keydown', function(event) {
  if (event.key === 'Enter') {
    console.log('Enter pressed');
  }
  
  if (event.ctrlKey && event.key === 's') {
    event.preventDefault();
    console.log('Ctrl+S pressed');
  }
});
```

### Form Events

```javascript
let input = document.querySelector('input');

input.addEventListener('focus', function(event) {
  console.log('Input focused');
});

input.addEventListener('blur', function(event) {
  console.log('Input lost focus');
});

input.addEventListener('change', function(event) {
  console.log('Value changed:', event.target.value);
});

input.addEventListener('input', function(event) {
  console.log('Input value changed:', event.target.value);
});

let form = document.querySelector('form');
form.addEventListener('submit', function(event) {
  event.preventDefault();
  console.log('Form submitted');
});

form.addEventListener('reset', function(event) {
  console.log('Form reset');
});
```

### Window Events

```javascript
window.addEventListener('load', function(event) {
  console.log('Page fully loaded');
});

window.addEventListener('resize', function(event) {
  console.log('Window resized:', window.innerWidth, window.innerHeight);
});

window.addEventListener('scroll', function(event) {
  console.log('Page scrolled:', window.scrollY);
});

window.addEventListener('beforeunload', function(event) {
  // Show confirmation dialog
  event.returnValue = 'Are you sure you want to leave?';
});
```

### Document Events

```javascript
document.addEventListener('DOMContentLoaded', function(event) {
  console.log('DOM fully loaded and parsed');
});

document.addEventListener('readystatechange', function(event) {
  console.log('Document ready state:', document.readyState);
});
```

## Event Object

Every event handler receives an event object with information about the event:

```javascript
element.addEventListener('click', function(event) {
  // Prevent default behavior
  event.preventDefault();
  
  // Stop event bubbling
  event.stopPropagation();
  
  // Event properties
  console.log('Event type:', event.type);
  console.log('Target element:', event.target);
  console.log('Current target:', event.currentTarget);
  
  // Mouse coordinates
  console.log('Mouse X:', event.clientX);
  console.log('Mouse Y:', event.clientY);
  console.log('Page X:', event.pageX);
  console.log('Page Y:', event.pageY);
  
  // Keyboard properties
  console.log('Key pressed:', event.key);
  console.log('Key code:', event.keyCode);
  console.log('Alt pressed:', event.altKey);
  console.log('Ctrl pressed:', event.ctrlKey);
  console.log('Shift pressed:', event.shiftKey);
  console.log('Meta pressed:', event.metaKey);
});
```

## Event Propagation

Events propagate through the DOM in three phases:

### Capturing Phase

Event travels from root to target element:

```javascript
document.addEventListener('click', function() {
  console.log('Document (capturing)');
}, true); // true = capturing phase

parent.addEventListener('click', function() {
  console.log('Parent (capturing)');
}, true);
```

### Target Phase

Event reaches the target element.

### Bubbling Phase

Event bubbles up from target to root:

```javascript
child.addEventListener('click', function() {
  console.log('Child (bubbling)');
}); // Default is bubbling

parent.addEventListener('click', function() {
  console.log('Parent (bubbling)');
});

document.addEventListener('click', function() {
  console.log('Document (bubbling)');
});
```

### Stopping Propagation

```javascript
child.addEventListener('click', function(event) {
  event.stopPropagation(); // Stop bubbling
  console.log('Child clicked, propagation stopped');
});
```

## Event Delegation

Attach event listeners to parent elements to handle events on child elements:

```javascript
// Instead of adding listeners to each li
document.querySelector('#list').addEventListener('click', function(event) {
  if (event.target.tagName === 'LI') {
    console.log('List item clicked:', event.target.textContent);
    event.target.classList.toggle('selected');
  }
});

// Works for dynamically added elements too
function addListItem(text) {
  let li = document.createElement('li');
  li.textContent = text;
  document.querySelector('#list').appendChild(li);
}
```

## Custom Events

Create and dispatch your own events:

```javascript
// Create custom event
let customEvent = new CustomEvent('userAction', {
  detail: { action: 'login', userId: 123 },
  bubbles: true,
  cancelable: true
});

// Dispatch event
element.dispatchEvent(customEvent);

// Listen for custom event
element.addEventListener('userAction', function(event) {
  console.log('User action:', event.detail.action);
  console.log('User ID:', event.detail.userId);
});
```

## Event Listeners

### Adding Event Listeners

```javascript
// Method 1: addEventListener (recommended)
element.addEventListener('click', handleClick);
element.addEventListener('click', handleClick2); // Multiple listeners

// Method 2: Property assignment (only one listener)
element.onclick = handleClick;

// Method 3: Inline HTML (not recommended)
// <button onclick="handleClick()">Click me</button>
```

### Removing Event Listeners

```javascript
function handleClick() {
  console.log('Clicked!');
}

// Add listener
element.addEventListener('click', handleClick);

// Remove specific listener
element.removeEventListener('click', handleClick);

// For anonymous functions, you need a reference
let handler = function() { console.log('Clicked!'); };
element.addEventListener('click', handler);
element.removeEventListener('click', handler);
```

### Event Listener Options

```javascript
element.addEventListener('click', handleClick, {
  capture: true,        // Use capturing phase
  once: true,          // Remove listener after first execution
  passive: true        // Improve scroll performance
});
```

## Common Event Patterns

### Debouncing

Limit how often a function can be called:

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

### Throttling

Ensure function is called at most once per time interval:

```javascript
function throttle(func, limit) {
  let inThrottle;
  return function() {
    const args = arguments;
    const context = this;
    if (!inThrottle) {
      func.apply(context, args);
      inThrottle = true;
      setTimeout(() => inThrottle = false, limit);
    }
  };
}

window.addEventListener('scroll', throttle(function() {
  console.log('Scrolled');
}, 100));
```

### Event Emitter Pattern

```javascript
class EventEmitter {
  constructor() {
    this.events = {};
  }
  
  on(event, listener) {
    if (!this.events[event]) {
      this.events[event] = [];
    }
    this.events[event].push(listener);
  }
  
  off(event, listener) {
    if (!this.events[event]) return;
    this.events[event] = this.events[event].filter(l => l !== listener);
  }
  
  emit(event, ...args) {
    if (!this.events[event]) return;
    this.events[event].forEach(listener => listener(...args));
  }
}

// Usage
let emitter = new EventEmitter();

function onUserLogin(user) {
  console.log('User logged in:', user.name);
}

emitter.on('login', onUserLogin);
emitter.emit('login', { name: 'John', id: 123 });
```

## Touch Events

For mobile devices:

```javascript
element.addEventListener('touchstart', function(event) {
  console.log('Touch started');
  let touch = event.touches[0];
  console.log('Touch X:', touch.clientX);
  console.log('Touch Y:', touch.clientY);
});

element.addEventListener('touchmove', function(event) {
  console.log('Touch moved');
  event.preventDefault(); // Prevent scrolling
});

element.addEventListener('touchend', function(event) {
  console.log('Touch ended');
});

element.addEventListener('touchcancel', function(event) {
  console.log('Touch cancelled');
});
```

## Drag and Drop

```javascript
let draggedElement;

document.addEventListener('dragstart', function(event) {
  draggedElement = event.target;
  event.dataTransfer.setData('text/html', event.target.outerHTML);
});

document.addEventListener('dragover', function(event) {
  event.preventDefault(); // Allow drop
});

document.addEventListener('drop', function(event) {
  event.preventDefault();
  let data = event.dataTransfer.getData('text/html');
  event.target.innerHTML = data;
});
```

## Best Practices

### Use Event Delegation

```javascript
// Good - one listener on parent
document.querySelector('#list').addEventListener('click', function(event) {
  if (event.target.matches('li')) {
    handleListItemClick(event.target);
  }
});

// Avoid - listeners on each item
document.querySelectorAll('li').forEach(item => {
  item.addEventListener('click', handleListItemClick);
});
```

### Clean Up Event Listeners

```javascript
class Component {
  constructor() {
    this.handleClick = this.handleClick.bind(this);
    this.element.addEventListener('click', this.handleClick);
  }
  
  destroy() {
    this.element.removeEventListener('click', this.handleClick);
  }
}
```

### Handle Browser Compatibility

```javascript
function addEventListener(element, event, handler) {
  if (element.addEventListener) {
    element.addEventListener(event, handler, false);
  } else if (element.attachEvent) {
    element.attachEvent('on' + event, handler); // IE8 and below
  }
}
```

### Use Passive Events for Performance

```javascript
// For scroll events
element.addEventListener('scroll', handleScroll, { passive: true });

// For touch events
element.addEventListener('touchstart', handleTouch, { passive: true });
```

### Avoid Inline Event Handlers

```javascript
// Bad
<button onclick="handleClick()">Click me</button>

// Good
document.querySelector('button').addEventListener('click', handleClick);
```

Events are the primary way JavaScript interacts with user actions and browser state changes. Mastering event handling is essential for creating interactive web applications.
