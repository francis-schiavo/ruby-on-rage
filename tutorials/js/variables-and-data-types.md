# Variables and Data Types

Variables are containers for storing data values. JavaScript variables can hold different types of data, and the language is dynamically typed, meaning you don't need to specify the data type when declaring a variable.

## Variable Declaration

### var (Legacy)

```javascript
var name = 'John';
var age = 25;
var isStudent = true;
```

### let (Modern)

```javascript
let name = 'John';
let age = 25;
let isStudent = true;
```

### const (Constant)

```javascript
const PI = 3.14159;
const MAX_USERS = 100;
const CONFIG = { theme: 'dark' };
```

## Variable Naming Rules

- Must start with a letter, underscore (_), or dollar sign ($)
- Can contain letters, numbers, underscores, and dollar signs
- Case-sensitive (myVar ≠ myvar)
- Cannot use reserved keywords

```javascript
// Valid names
let userName = 'John';
let _private = 'secret';
let $element = document.getElementById('myDiv');
let camelCase = 'convention';

// Invalid names
// let 123invalid; // Cannot start with number
// let var; // Reserved keyword
// let my-var; // Hyphens not allowed
```

## Data Types

JavaScript has primitive and reference data types.

### Primitive Data Types

#### String

Represents text data:

```javascript
let singleQuotes = 'Hello';
let doubleQuotes = "World";
let templateLiteral = `Hello ${name}!`; // Template literal
let escaped = 'It\'s a beautiful day'; // Escaped quote
```

#### Number

Represents numeric values:

```javascript
let integer = 42;
let float = 3.14;
let negative = -10;
let scientific = 1.23e5; // 123000
let infinity = Infinity;
let notANumber = NaN;
```

#### Boolean

Represents true/false values:

```javascript
let isLoggedIn = true;
let hasPermission = false;
let isGreater = 5 > 3; // true
let isEqual = 5 === '5'; // false (strict equality)
```

#### Undefined

Represents uninitialized variables:

```javascript
let undefinedVar;
console.log(undefinedVar); // undefined
```

#### Null

Represents intentional absence of value:

```javascript
let emptyValue = null;
let user = null; // User not found
```

#### Symbol (ES6)

Represents unique identifiers:

```javascript
let symbol1 = Symbol('description');
let symbol2 = Symbol('description');
console.log(symbol1 === symbol2); // false
```

#### BigInt (ES2020)

Represents large integers:

```javascript
let bigInt = 123456789012345678901234567890n;
let bigInt2 = BigInt('123456789012345678901234567890');
```

### Reference Data Types

#### Object

Collections of key-value pairs:

```javascript
let person = {
  name: 'John',
  age: 30,
  isStudent: false,
  hobbies: ['reading', 'coding']
};
```

#### Array

Ordered collections of values:

```javascript
let numbers = [1, 2, 3, 4, 5];
let mixed = ['hello', 42, true, null];
let empty = [];
```

#### Function

Blocks of reusable code:

```javascript
function greet(name) {
  return `Hello, ${name}!`;
}

let arrowFunction = (name) => `Hello, ${name}!`;
```

## Type Checking

### typeof Operator

```javascript
console.log(typeof 'hello'); // 'string'
console.log(typeof 42); // 'number'
console.log(typeof true); // 'boolean'
console.log(typeof undefined); // 'undefined'
console.log(typeof null); // 'object' (historical bug)
console.log(typeof {}); // 'object'
console.log(typeof []); // 'object'
console.log(typeof function(){}); // 'function'
```

### instanceof Operator

```javascript
let arr = [1, 2, 3];
console.log(arr instanceof Array); // true
console.log(arr instanceof Object); // true

let date = new Date();
console.log(date instanceof Date); // true
```

## Type Conversion

### Implicit Conversion (Type Coercion)

JavaScript automatically converts types in certain contexts:

```javascript
console.log(5 + '5'); // '55' (number to string)
console.log('5' - 2); // 3 (string to number)
console.log(5 * '2'); // 10 (string to number)
console.log('5' == 5); // true (loose equality)
console.log('5' === 5); // false (strict equality)
```

### Explicit Conversion

#### String Conversion

```javascript
let num = 42;
let str1 = String(num); // '42'
let str2 = num.toString(); // '42'
let str3 = num + ''; // '42'
```

#### Number Conversion

```javascript
let str = '42';
let num1 = Number(str); // 42
let num2 = parseInt(str); // 42
let num3 = parseFloat('3.14'); // 3.14
let num4 = +'42'; // 42 (unary plus)
```

#### Boolean Conversion

```javascript
let truthy = Boolean(1); // true
let falsy = Boolean(0); // false

// Truthy values: non-zero numbers, non-empty strings, objects, arrays
// Falsy values: 0, '', null, undefined, NaN, false
```

## Variable Scope

### Global Scope

```javascript
var globalVar = 'I am global'; // Accessible everywhere
let globalLet = 'I am also global';

function test() {
  console.log(globalVar); // Works
  console.log(globalLet); // Works
}
```

### Function Scope

```javascript
function testScope() {
  var functionVar = 'local to function';
  let functionLet = 'also local';
  
  if (true) {
    var blockVar = 'available in function';
    let blockLet = 'local to block';
  }
  
  console.log(blockVar); // Works
  console.log(blockLet); // ReferenceError
}

console.log(functionVar); // ReferenceError
```

### Block Scope (ES6)

```javascript
if (true) {
  var varVariable = 'function scoped';
  let letVariable = 'block scoped';
  const constVariable = 'also block scoped';
}

console.log(varVariable); // Works
console.log(letVariable); // ReferenceError
console.log(constVariable); // ReferenceError
```

## Hoisting

Variables declared with `var` are hoisted to the top of their scope:

```javascript
console.log(hoistedVar); // undefined (not error)
var hoistedVar = 'I am hoisted';

console.log(notHoisted); // ReferenceError
let notHoisted = 'I am not hoisted';
```

## Best Practices

### Use const by Default

```javascript
// Good
const PI = 3.14159;
const CONFIG = { theme: 'dark' };

// Use let only when reassignment is needed
let counter = 0;
counter++;

// Avoid var
// var oldWay = 'avoid this';
```

### Descriptive Naming

```javascript
// Good
let userName = 'john_doe';
let isAuthenticated = true;
let userPreferences = { theme: 'dark' };

// Avoid
let n = 'john_doe';
let auth = true;
let prefs = { theme: 'dark' };
```

### Consistent Declaration

```javascript
// Group related declarations
let name, age, email;
name = 'John';
age = 25;
email = 'john@example.com';

// Or declare and assign together
let userName = 'John',
    userAge = 25,
    userEmail = 'john@example.com';
```

### Avoid Global Variables

```javascript
// Bad
globalVar = 'avoid this';

// Good
(function() {
  let localVar = 'contained';
})();
```

## Practice Exercises

1. Declare variables of different data types
2. Experiment with type conversion
3. Test variable scope in different contexts
4. Create objects and arrays with various data types
5. Use typeof and instanceof operators

Understanding variables and data types is fundamental to JavaScript programming. These concepts form the basis for all JavaScript applications.
