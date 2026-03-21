# JavaScript Basics

JavaScript is a high-level, interpreted programming language that is one of the core technologies of the World Wide Web. It enables interactive web pages and is an essential part of web applications.

## What is JavaScript?

JavaScript (often abbreviated as JS) is a programming language that conforms to the ECMAScript specification. It is:

- **High-level**: Abstracts away low-level computer operations
- **Interpreted**: Code is executed directly without compilation
- **Dynamic**: Variables can hold different types of data
- **Prototype-based**: Uses prototypes instead of classes for inheritance
- **Multi-paradigm**: Supports object-oriented, imperative, and functional programming

## Where JavaScript Runs

JavaScript can run in multiple environments:

- **Browsers**: Client-side JavaScript for web pages
- **Servers**: Server-side JavaScript with Node.js
- **Desktop apps**: Using frameworks like Electron
- **Mobile apps**: Using frameworks like React Native

## Adding JavaScript to HTML

### Internal JavaScript

```html
<!DOCTYPE html>
<html>
<head>
    <title>JavaScript Basics</title>
</head>
<body>
    <h1>Hello, World!</h1>
    
    <script>
        console.log('Hello, JavaScript!');
        alert('Welcome to JavaScript!');
    </script>
</body>
</html>
```

### External JavaScript

```html
<!DOCTYPE html>
<html>
<head>
    <title>JavaScript Basics</title>
</head>
<body>
    <h1>Hello, World!</h1>
    
    <script src="script.js"></script>
</body>
</html>
```

```javascript
// script.js
console.log('Hello, JavaScript!');
alert('Welcome to JavaScript!');
```

## JavaScript Syntax Basics

### Statements

JavaScript code is composed of statements:

```javascript
console.log('This is a statement');
let x = 5; // Another statement
```

Statements are separated by semicolons (optional but recommended).

### Comments

```javascript
// Single-line comment

/*
Multi-line
comment
*/
```

### Case Sensitivity

JavaScript is case-sensitive:

```javascript
let myVariable = 'Hello';
let myvariable = 'World'; // Different variable
```

## Console Output

The `console.log()` function outputs to the browser console:

```javascript
console.log('Hello, World!');
console.log(42);
console.log(true);
```

Open browser developer tools (F12) to see console output.

## Basic Input/Output

### Alert Dialog

```javascript
alert('This is an alert message!');
```

### Confirm Dialog

```javascript
let result = confirm('Are you sure?');
console.log(result); // true or false
```

### Prompt Dialog

```javascript
let name = prompt('What is your name?');
console.log('Hello, ' + name + '!');
```

## JavaScript in Modern Web Development

### Frameworks and Libraries

- **React**: Component-based UI library
- **Vue.js**: Progressive framework for building UIs
- **Angular**: Full-featured framework
- **jQuery**: DOM manipulation library (legacy)

### Build Tools

- **Webpack**: Module bundler
- **Babel**: JavaScript transpiler
- **ESLint**: Code linting
- **npm/yarn**: Package managers

## JavaScript Versions

### ECMAScript Standards

- **ES5 (2009)**: Traditional JavaScript
- **ES6/ES2015 (2015)**: Major update with modern features
- **ES2016-ES2023**: Annual updates with new features

### Browser Support

Modern browsers support ES6+ features. For older browsers, use Babel to transpile code.

## Development Environment

### Browser Console

- Press F12 to open developer tools
- Go to Console tab
- Type JavaScript code directly

### Code Editors

- **Visual Studio Code**: Popular free editor
- **WebStorm**: Full-featured IDE
- **Sublime Text**: Lightweight editor

### Online Playgrounds

- **CodePen**: HTML/CSS/JS playground
- **JSFiddle**: JavaScript testing
- **Repl.it**: Online IDE

## Debugging JavaScript

### Console Methods

```javascript
console.log('Basic logging');
console.warn('Warning message');
console.error('Error message');
console.table([{name: 'John', age: 30}, {name: 'Jane', age: 25}]);
```

### Breakpoints

- Use `debugger;` statement in code
- Set breakpoints in browser developer tools
- Step through code execution

## Common JavaScript Errors

### Syntax Errors

```javascript
// Missing semicolon
console.log('Hello')

// Missing parenthesis
console.log('Hello';
```

### Reference Errors

```javascript
console.log(undefinedVariable); // ReferenceError
```

### Type Errors

```javascript
let num = 5;
num.toUpperCase(); // TypeError: num.toUpperCase is not a function
```

## Best Practices

### Code Style

- Use consistent indentation (2 or 4 spaces)
- Use descriptive variable names
- Follow camelCase convention
- Use semicolons consistently

### Performance

- Minimize DOM manipulation
- Use efficient algorithms
- Avoid global variables
- Use modern JavaScript features

### Security

- Validate user input
- Use HTTPS for sensitive data
- Avoid eval() function
- Sanitize data before use

## JavaScript Ecosystem

### Package Management

```bash
# Initialize project
npm init

# Install package
npm install lodash

# Install development dependency
npm install --save-dev eslint
```

### Module Systems

```javascript
// ES6 Modules
import { sum } from './math.js';
export function multiply(a, b) { return a * b; }

// CommonJS (Node.js)
const fs = require('fs');
module.exports = { myFunction };
```

## Next Steps

Understanding JavaScript basics is the foundation for web development. Next, you'll learn about variables, data types, and how to store and manipulate data in JavaScript programs.

## Practice Exercises

1. Create an HTML file with embedded JavaScript that displays an alert
2. Use console.log to output different types of data
3. Experiment with prompt() and confirm() dialogs
4. Try different console methods (log, warn, error, table)

Remember: Practice is key to mastering JavaScript. Start with simple programs and gradually build complexity.
