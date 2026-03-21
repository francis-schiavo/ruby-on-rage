# Functions

Functions are reusable blocks of code that perform specific tasks. They allow you to organize code, avoid repetition, and create modular programs.

## Function Declaration

### Basic Function Declaration

```javascript
function greet(name) {
  return `Hello, ${name}!`;
}

console.log(greet('John')); // 'Hello, John!'
```

### Function Expression

```javascript
const greet = function(name) {
  return `Hello, ${name}!`;
};

console.log(greet('Jane')); // 'Hello, Jane!'
```

### Arrow Functions (ES6)

```javascript
const greet = (name) => `Hello, ${name}!`;

const add = (a, b) => a + b;

const getUser = () => ({
  name: 'John',
  age: 30
});
```

## Parameters and Arguments

### Default Parameters

```javascript
function greet(name = 'Guest') {
  return `Hello, ${name}!`;
}

console.log(greet()); // 'Hello, Guest!'
console.log(greet('John')); // 'Hello, John!'
```

### Rest Parameters

```javascript
function sum(...numbers) {
  return numbers.reduce((total, num) => total + num, 0);
}

console.log(sum(1, 2, 3)); // 6
console.log(sum(1, 2, 3, 4, 5)); // 15
```

### Arguments Object

```javascript
function oldStyleSum() {
  let total = 0;
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }
  return total;
}

console.log(oldStyleSum(1, 2, 3)); // 6
```

## Function Scope

### Local Scope

```javascript
function myFunction() {
  let localVar = 'I am local';
  console.log(localVar); // Works
}

myFunction();
console.log(localVar); // ReferenceError
```

### Global Scope

```javascript
let globalVar = 'I am global';

function accessGlobal() {
  console.log(globalVar); // Works
}

accessGlobal();
```

### Lexical Scope (Closures)

```javascript
function outerFunction() {
  let outerVar = 'I am outer';
  
  function innerFunction() {
    console.log(outerVar); // Can access outer scope
  }
  
  return innerFunction;
}

const closure = outerFunction();
closure(); // 'I am outer'
```

## Return Statement

### Returning Values

```javascript
function calculateArea(width, height) {
  return width * height;
}

let area = calculateArea(10, 5);
console.log(area); // 50
```

### Early Return

```javascript
function isPositive(number) {
  if (number > 0) {
    return true;
  }
  return false;
}

// Or more concisely:
function isPositive(number) {
  return number > 0;
}
```

### Returning Multiple Values

```javascript
function getUserInfo() {
  return {
    name: 'John',
    age: 30,
    email: 'john@example.com'
  };
}

let user = getUserInfo();
console.log(user.name); // 'John'
```

## Function Types

### Anonymous Functions

```javascript
setTimeout(function() {
  console.log('This runs after 1 second');
}, 1000);
```

### Immediately Invoked Function Expressions (IIFE)

```javascript
(function() {
  let privateVar = 'I am private';
  console.log(privateVar);
})();

// With arrow function
(() => {
  console.log('IIFE with arrow function');
})();
```

### Constructor Functions

```javascript
function Person(name, age) {
  this.name = name;
  this.age = age;
  
  this.greet = function() {
    return `Hello, my name is ${this.name}`;
  };
}

let john = new Person('John', 30);
console.log(john.greet()); // 'Hello, my name is John'
```

## Higher-Order Functions

Functions that take other functions as arguments or return functions:

```javascript
function calculator(operation, a, b) {
  return operation(a, b);
}

function add(a, b) { return a + b; }
function multiply(a, b) { return a * b; }

console.log(calculator(add, 5, 3)); // 8
console.log(calculator(multiply, 5, 3)); // 15
```

## Callback Functions

```javascript
function fetchData(callback) {
  setTimeout(() => {
    const data = { name: 'John', age: 30 };
    callback(data);
  }, 1000);
}

fetchData((user) => {
  console.log('User data:', user);
});
```

## Function Methods

### call() and apply()

```javascript
function greet(greeting) {
  return `${greeting}, my name is ${this.name}`;
}

let person = { name: 'John' };

console.log(greet.call(person, 'Hello')); // 'Hello, my name is John'
console.log(greet.apply(person, ['Hi'])); // 'Hi, my name is John'
```

### bind()

```javascript
let person = { name: 'John' };
let greetJohn = greet.bind(person);

console.log(greetJohn('Hello')); // 'Hello, my name is John'
```

## Recursion

Functions that call themselves:

```javascript
function factorial(n) {
  if (n <= 1) {
    return 1;
  }
  return n * factorial(n - 1);
}

console.log(factorial(5)); // 120
```

### Recursive Array Sum

```javascript
function sumArray(arr) {
  if (arr.length === 0) {
    return 0;
  }
  return arr[0] + sumArray(arr.slice(1));
}

console.log(sumArray([1, 2, 3, 4, 5])); // 15
```

## Pure Functions

Functions that don't have side effects and always return the same result for the same inputs:

```javascript
// Pure function
function add(a, b) {
  return a + b;
}

// Impure function (has side effect)
let total = 0;
function addToTotal(value) {
  total += value;
  return total;
}
```

## Function Composition

Combining multiple functions:

```javascript
const compose = (f, g) => (x) => f(g(x));

const add1 = (x) => x + 1;
const multiply2 = (x) => x * 2;

const add1ThenMultiply2 = compose(multiply2, add1);
console.log(add1ThenMultiply2(5)); // 12 ( (5 + 1) * 2 )
```

## Practical Examples

### Calculator

```javascript
function calculator(operation) {
  return function(a, b) {
    switch(operation) {
      case 'add': return a + b;
      case 'subtract': return a - b;
      case 'multiply': return a * b;
      case 'divide': return b !== 0 ? a / b : 'Cannot divide by zero';
      default: return 'Invalid operation';
    }
  };
}

const add = calculator('add');
const multiply = calculator('multiply');

console.log(add(5, 3)); // 8
console.log(multiply(5, 3)); // 15
```

### Debounce Function

```javascript
function debounce(func, delay) {
  let timeoutId;
  return function(...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => func.apply(this, args), delay);
  };
}

const debouncedLog = debounce(() => console.log('Debounced!'), 1000);

// This will only log once, 1 second after the last call
debouncedLog();
debouncedLog();
debouncedLog();
```

### Memoization

```javascript
function memoize(func) {
  const cache = new Map();
  
  return function(...args) {
    const key = JSON.stringify(args);
    
    if (cache.has(key)) {
      return cache.get(key);
    }
    
    const result = func.apply(this, args);
    cache.set(key, result);
    return result;
  };
}

const fibonacci = memoize(function(n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
});

console.log(fibonacci(10)); // Much faster on subsequent calls
```

## Best Practices

### Use Descriptive Names

```javascript
// Good
function calculateTotalPrice(items, taxRate) {
  // ...
}

// Avoid
function calc(items, rate) {
  // ...
}
```

### Keep Functions Small

```javascript
// Good
function validateEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function validatePassword(password) {
  return password.length >= 8;
}

// Avoid
function validateUser(user) {
  // 50 lines of validation code...
}
```

### Use Arrow Functions Appropriately

```javascript
// Good for simple expressions
const square = x => x * x;

// Good for callbacks
array.map(item => item * 2);

// Avoid for complex functions
const complexFunction = (a, b, c) => {
  // Complex logic here
  return result;
};
```

### Handle Errors Properly

```javascript
function divide(a, b) {
  if (typeof a !== 'number' || typeof b !== 'number') {
    throw new TypeError('Both arguments must be numbers');
  }
  
  if (b === 0) {
    throw new Error('Division by zero');
  }
  
  return a / b;
}
```

### Document Functions

```javascript
/**
 * Calculates the area of a rectangle
 * @param {number} width - The width of the rectangle
 * @param {number} height - The height of the rectangle
 * @returns {number} The calculated area
 */
function calculateArea(width, height) {
  return width * height;
}
```

Functions are the building blocks of JavaScript programs. Mastering functions allows you to write clean, modular, and reusable code.
