# Web Components Introduction

Web Components are a set of web platform APIs that allow you to create reusable custom HTML elements with encapsulated functionality and styling. They enable component-based development directly in the browser without external frameworks.

## What are Web Components?

Web Components consist of three main technologies:

1. **Custom Elements**: Define new HTML elements
2. **Shadow DOM**: Encapsulated DOM and styles
3. **HTML Templates**: Reusable markup templates

## Custom Elements

Custom elements allow you to define your own HTML tags:

### Basic Custom Element

```javascript
class MyElement extends HTMLElement {
  connectedCallback() {
    this.innerHTML = '<p>Hello from my custom element!</p>';
  }
}

// Register the element
customElements.define('my-element', MyElement);

// Usage in HTML
// <my-element></my-element>
```

### Lifecycle Methods

```javascript
class MyCounter extends HTMLElement {
  constructor() {
    super();
    this.count = 0;
  }
  
  connectedCallback() {
    this.render();
    this.addEventListener('click', this.increment);
  }
  
  disconnectedCallback() {
    this.removeEventListener('click', this.increment);
  }
  
  attributeChangedCallback(name, oldValue, newValue) {
    if (name === 'count') {
      this.count = parseInt(newValue) || 0;
      this.render();
    }
  }
  
  static get observedAttributes() {
    return ['count'];
  }
  
  increment = () => {
    this.count++;
    this.setAttribute('count', this.count);
  }
  
  render() {
    this.innerHTML = `<button>Count: ${this.count}</button>`;
  }
}

customElements.define('my-counter', MyCounter);
```

## Shadow DOM

Shadow DOM provides encapsulation for styles and markup:

### Basic Shadow DOM

```javascript
class ShadowElement extends HTMLElement {
  constructor() {
    super();
    
    // Create shadow root
    this.attachShadow({ mode: 'open' });
    
    // Add content to shadow DOM
    this.shadowRoot.innerHTML = `
      <style>
        .message { color: blue; }
      </style>
      <div class="message">
        <slot name="content">Default content</slot>
      </div>
    `;
  }
}

customElements.define('shadow-element', ShadowElement);
```

### Shadow DOM Modes

- **Open**: Shadow root accessible via `element.shadowRoot`
- **Closed**: Shadow root not accessible from outside

### Slots

Slots allow content to be projected into the shadow DOM:

```javascript
class CardComponent extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this.shadowRoot.innerHTML = `
      <style>
        .card {
          border: 1px solid #ddd;
          border-radius: 8px;
          padding: 16px;
          box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .header { font-weight: bold; }
        .content { margin: 8px 0; }
      </style>
      <div class="card">
        <div class="header">
          <slot name="header">Card Title</slot>
        </div>
        <div class="content">
          <slot name="content">Card content goes here</slot>
        </div>
        <div class="footer">
          <slot name="footer"></slot>
        </div>
      </div>
    `;
  }
}

customElements.define('my-card', CardComponent);
```

Usage:

```html
<my-card>
  <span slot="header">My Custom Card</span>
  <p slot="content">This is the card content with <strong>HTML</strong> support.</p>
  <button slot="footer">Action Button</button>
</my-card>
```

## HTML Templates

Templates allow you to define reusable HTML fragments:

```html
<template id="user-card-template">
  <style>
    .user-card {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      border-radius: 4px;
    }
    .avatar { width: 50px; height: 50px; border-radius: 50%; }
    .name { font-weight: bold; }
  </style>
  <div class="user-card">
    <img class="avatar" src="" alt="User avatar">
    <div class="name"></div>
    <div class="email"></div>
  </div>
</template>
```

```javascript
class UserCard extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }
  
  connectedCallback() {
    const template = document.getElementById('user-card-template');
    const templateContent = template.content.cloneNode(true);
    
    // Populate template
    templateContent.querySelector('.avatar').src = this.getAttribute('avatar');
    templateContent.querySelector('.name').textContent = this.getAttribute('name');
    templateContent.querySelector('.email').textContent = this.getAttribute('email');
    
    this.shadowRoot.appendChild(templateContent);
  }
}

customElements.define('user-card', UserCard);
```

## Advanced Custom Elements

### Properties and Attributes

```javascript
class ProgressBar extends HTMLElement {
  static get observedAttributes() {
    return ['value', 'max'];
  }
  
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this._value = 0;
    this._max = 100;
  }
  
  get value() {
    return this._value;
  }
  
  set value(val) {
    this._value = Math.max(0, Math.min(val, this._max));
    this.setAttribute('value', this._value);
    this.render();
  }
  
  get max() {
    return this._max;
  }
  
  set max(val) {
    this._max = Math.max(1, val);
    this.setAttribute('max', this._max);
    this.render();
  }
  
  attributeChangedCallback(name, oldValue, newValue) {
    if (oldValue !== newValue) {
      this[name] = newValue;
    }
  }
  
  render() {
    const percentage = (this._value / this._max) * 100;
    this.shadowRoot.innerHTML = `
      <style>
        .progress-bar {
          width: 100%;
          height: 20px;
          background: #f0f0f0;
          border-radius: 10px;
          overflow: hidden;
        }
        .progress-fill {
          height: 100%;
          background: #007bff;
          width: ${percentage}%;
          transition: width 0.3s ease;
        }
      </style>
      <div class="progress-bar">
        <div class="progress-fill"></div>
      </div>
    `;
  }
}

customElements.define('progress-bar', ProgressBar);
```

## Styling Web Components

### External Stylesheets

```javascript
class StyledComponent extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    
    // Load external stylesheet
    const link = document.createElement('link');
    link.rel = 'stylesheet';
    link.href = 'component-styles.css';
    this.shadowRoot.appendChild(link);
    
    // Add component HTML
    const div = document.createElement('div');
    div.innerHTML = '<p>Styled component content</p>';
    this.shadowRoot.appendChild(div);
  }
}
```

### CSS Custom Properties

```javascript
class ThemedComponent extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this.shadowRoot.innerHTML = `
      <style>
        :host {
          --primary-color: blue;
          --secondary-color: gray;
        }
        .button {
          background: var(--primary-color, blue);
          color: white;
          border: none;
          padding: 8px 16px;
          border-radius: 4px;
        }
      </style>
      <button class="button">
        <slot>Themed Button</slot>
      </button>
    `;
  }
}

// Usage
// <themed-component style="--primary-color: red;"></themed-component>
```

## Communication Between Components

### Custom Events

```javascript
class TodoItem extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this.shadowRoot.innerHTML = `
      <li>
        <input type="checkbox">
        <span><slot></slot></span>
        <button class="delete">×</button>
      </li>
    `;
    
    this.checkbox = this.shadowRoot.querySelector('input');
    this.deleteBtn = this.shadowRoot.querySelector('.delete');
  }
  
  connectedCallback() {
    this.checkbox.addEventListener('change', this.handleToggle);
    this.deleteBtn.addEventListener('click', this.handleDelete);
  }
  
  handleToggle = () => {
    const event = new CustomEvent('todo-toggle', {
      detail: { completed: this.checkbox.checked },
      bubbles: true
    });
    this.dispatchEvent(event);
  }
  
  handleDelete = () => {
    const event = new CustomEvent('todo-delete', {
      bubbles: true
    });
    this.dispatchEvent(event);
  }
}

customElements.define('todo-item', TodoItem);
```

### Parent-Child Communication

```javascript
class TodoList extends HTMLElement {
  constructor() {
    super();
    this.todos = [];
  }
  
  connectedCallback() {
    this.addEventListener('todo-toggle', this.handleToggle);
    this.addEventListener('todo-delete', this.handleDelete);
  }
  
  addTodo(text) {
    const todoItem = document.createElement('todo-item');
    todoItem.textContent = text;
    this.appendChild(todoItem);
  }
  
  handleToggle(event) {
    console.log('Todo toggled:', event.detail.completed);
  }
  
  handleDelete(event) {
    event.target.remove();
  }
}

customElements.define('todo-list', TodoList);
```

## Browser Support and Polyfills

Web Components are supported in modern browsers, but for older browsers:

```html
<script src="https://unpkg.com/@webcomponents/webcomponentsjs@2.6.0/webcomponents-bundle.js"></script>
```

## Best Practices

### Naming Conventions

```javascript
// Use kebab-case for custom element names
// <my-component></my-component>
// <user-profile></user-profile>

// Use PascalCase for class names
class MyComponent extends HTMLElement { }
class UserProfile extends HTMLElement { }
```

### Encapsulation

- Use Shadow DOM to prevent style conflicts
- Keep component logic self-contained
- Use slots for flexible content projection

### Performance

- Avoid unnecessary DOM operations
- Use efficient selectors within shadow DOM
- Minimize style recalculations

### Accessibility

```javascript
class AccessibleButton extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this.shadowRoot.innerHTML = `
      <button role="button" tabindex="0">
        <slot>Button</slot>
      </button>
    `;
  }
  
  connectedCallback() {
    // Ensure proper ARIA attributes
    if (!this.hasAttribute('aria-label') && !this.textContent.trim()) {
      this.setAttribute('aria-label', 'Button');
    }
  }
}
```

## Integration with Frameworks

Web Components work with popular frameworks:

### React

```jsx
import React from 'react';

class WebComponentWrapper extends React.Component {
  componentDidMount() {
    this.element = this.refs.webComponent;
    this.element.addEventListener('custom-event', this.handleEvent);
  }
  
  render() {
    return <my-web-component ref="webComponent" {...this.props} />;
  }
}
```

### Vue

```vue
<template>
  <my-web-component @custom-event="handleEvent">
    <slot></slot>
  </my-web-component>
</template>

<script>
export default {
  mounted() {
    // Web component is ready
  }
}
</script>
```

## Future of Web Components

Web Components are part of the web platform and continue to evolve:

- **Declarative Shadow DOM**: Shadow DOM in HTML
- **CSS Modules**: Scoped styles
- **Form-associated custom elements**: Custom form controls
- **Element internals**: Better accessibility APIs

Web Components provide a standards-based way to create reusable UI components that work across frameworks and enhance the native web platform capabilities.
