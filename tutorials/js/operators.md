# Operators

Operators are symbols that perform operations on operands (variables or values). JavaScript provides various types of operators for different purposes.

## Arithmetic Operators

Perform mathematical calculations:

```javascript
let a = 10;
let b = 3;

console.log(a + b); // 13 (Addition)
console.log(a - b); // 7 (Subtraction)
console.log(a * b); // 30 (Multiplication)
console.log(a / b); // 3.333... (Division)
console.log(a % b); // 1 (Modulus/Remainder)
console.log(a ** b); // 1000 (Exponentiation)
```

### Increment/Decrement

```javascript
let x = 5;

x++; // x = 6 (Post-increment)
++x; // x = 7 (Pre-increment)

x--; // x = 6 (Post-decrement)
--x; // x = 5 (Pre-decrement)
```

## Assignment Operators

Assign values to variables:

```javascript
let x = 10; // Basic assignment

x += 5; // x = x + 5 (15)
x -= 3; // x = x - 3 (12)
x *= 2; // x = x * 2 (24)
x /= 4; // x = x / 4 (6)
x %= 5; // x = x % 5 (1)
x **= 3; // x = x ** 3 (1)
```

## Comparison Operators

Compare values and return boolean:

```javascript
let a = 5;
let b = '5';

console.log(a == b);  // true (loose equality)
console.log(a === b); // false (strict equality)
console.log(a != b);  // false (loose inequality)
console.log(a !== b); // true (strict inequality)

console.log(a > 3);   // true
console.log(a < 10);  // true
console.log(a >= 5);  // true
console.log(a <= 4);  // false
```

## Logical Operators

Work with boolean values:

```javascript
let x = true;
let y = false;

console.log(x && y); // false (AND)
console.log(x || y); // true (OR)
console.log(!x);     // false (NOT)
console.log(!y);     // true (NOT)
```

### Short-Circuit Evaluation

```javascript
// AND (&&) - returns first falsy value or last truthy value
console.log(false && 'hello'); // false
console.log(true && 'hello');  // 'hello'
console.log('hello' && 'world'); // 'world'

// OR (||) - returns first truthy value or last falsy value
console.log(false || 'hello'); // 'hello'
console.log(true || 'hello');  // true
console.log('hello' || 'world'); // 'hello'
```

## String Operators

```javascript
let str1 = 'Hello';
let str2 = 'World';

console.log(str1 + ' ' + str2); // 'Hello World' (Concatenation)
console.log(str1 += str2);      // 'HelloWorld' (Compound assignment)
```

## Ternary Operator

Conditional operator (shorthand for if-else):

```javascript
// Syntax: condition ? valueIfTrue : valueIfFalse

let age = 18;
let canVote = age >= 18 ? 'Yes' : 'No';
console.log(canVote); // 'Yes'

let max = a > b ? a : b;
console.log(max); // Larger value
```

## Type Operators

### typeof

Returns the type of a value:

```javascript
console.log(typeof 42);        // 'number'
console.log(typeof 'hello');   // 'string'
console.log(typeof true);      // 'boolean'
console.log(typeof undefined); // 'undefined'
console.log(typeof null);      // 'object' (historical quirk)
console.log(typeof {});        // 'object'
console.log(typeof []);        // 'object'
console.log(typeof function(){}); // 'function'
```

### instanceof

Checks if an object is an instance of a constructor:

```javascript
let arr = [1, 2, 3];
console.log(arr instanceof Array);  // true
console.log(arr instanceof Object); // true

let date = new Date();
console.log(date instanceof Date);  // true
```

## Bitwise Operators

Work with binary representations of numbers:

```javascript
let a = 5;  // Binary: 101
let b = 3;  // Binary: 011

console.log(a & b);  // 1 (AND: 001)
console.log(a | b);  // 7 (OR: 111)
console.log(a ^ b);  // 6 (XOR: 110)
console.log(~a);     // -6 (NOT)
console.log(a << 1); // 10 (Left shift: 1010)
console.log(a >> 1); // 2 (Right shift: 10)
console.log(a >>> 1); // 2 (Unsigned right shift)
```

## Operator Precedence

Operators have different precedence levels:

```javascript
// High precedence to low:
// 1. Grouping: ()
// 2. Member access: . []
// 3. Function call: ()
// 4. Logical NOT: !
// 5. Multiplication/Division/Modulus: * / %
// 6. Addition/Subtraction: + -
// 7. Comparison: < <= > >=
// 8. Equality: == != === !==
// 9. Logical AND: &&
// 10. Logical OR: ||
// 11. Ternary: ?:
// 12. Assignment: = += -= etc.
```

Use parentheses to clarify precedence:

```javascript
let result = (a + b) * c; // Clear precedence
let complex = a + (b * c) - (d / e);
```

## Truthy and Falsy Values

Understanding truthy/falsy is crucial for conditional statements:

### Falsy Values (evaluate to false)

```javascript
console.log(Boolean(0));        // false
console.log(Boolean(''));       // false
console.log(Boolean(null));     // false
console.log(Boolean(undefined)); // false
console.log(Boolean(NaN));      // false
console.log(Boolean(false));    // false
```

### Truthy Values (evaluate to true)

```javascript
console.log(Boolean(1));        // true
console.log(Boolean('hello'));  // true
console.log(Boolean([]));       // true
console.log(Boolean({}));       // true
console.log(Boolean(function(){})); // true
```

## Nullish Coalescing Operator (ES2020)

```javascript
let user = null;
let defaultName = user ?? 'Anonymous'; // 'Anonymous'

let count = 0;
let displayCount = count ?? 42; // 0 (not null/undefined)
```

## Optional Chaining Operator (ES2020)

```javascript
let user = {
  profile: {
    name: 'John'
  }
};

console.log(user.profile?.name);    // 'John'
console.log(user.address?.street); // undefined (no error)
console.log(user.profile?.age ?? 25); // 25
```

## Practice Examples

### Calculator

```javascript
function calculate(a, b, operator) {
  switch(operator) {
    case '+': return a + b;
    case '-': return a - b;
    case '*': return a * b;
    case '/': return b !== 0 ? a / b : 'Division by zero';
    default: return 'Invalid operator';
  }
}

console.log(calculate(10, 5, '+')); // 15
```

### Age Verification

```javascript
let age = 20;
let status = age >= 18 ? 'Adult' : 'Minor';
console.log(status); // 'Adult'
```

### Safe Property Access

```javascript
let user = {
  profile: {
    settings: {
      theme: 'dark'
    }
  }
};

// Traditional way (error-prone)
let theme1 = user && user.profile && user.profile.settings && user.profile.settings.theme;

// Modern way (safe)
let theme2 = user?.profile?.settings?.theme ?? 'light';

console.log(theme2); // 'dark'
```

## Common Mistakes

### Assignment vs Comparison

```javascript
// Wrong
if (x = 5) { // Assignment, not comparison
  console.log('Always true');
}

// Correct
if (x === 5) {
  console.log('x equals 5');
}
```

### Loose vs Strict Equality

```javascript
console.log(5 == '5');  // true (type coercion)
console.log(5 === '5'); // false (strict comparison)
console.log(null == undefined);  // true
console.log(null === undefined); // false
```

### Operator Precedence Issues

```javascript
// Unexpected result
let result = 3 + 4 * 5; // 23, not 35

// Clear intention
let result2 = 3 + (4 * 5); // 23
let result3 = (3 + 4) * 5; // 35
```

## Best Practices

1. Use strict equality (`===`) instead of loose equality (`==`)
2. Use parentheses to clarify complex expressions
3. Avoid relying on type coercion in comparisons
4. Use descriptive variable names in complex expressions
5. Consider readability when chaining operators
6. Use modern operators like nullish coalescing when appropriate

Understanding operators is essential for writing effective JavaScript code. They form the building blocks for calculations, comparisons, and logical operations in your programs.
