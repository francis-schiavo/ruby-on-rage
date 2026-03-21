# Control Structures

Control structures allow you to control the flow of execution in your JavaScript programs. They enable decision-making, looping, and conditional execution of code blocks.

## Conditional Statements

### if Statement

Executes code if a condition is true:

```javascript
let age = 18;

if (age >= 18) {
  console.log('You are an adult');
}
```

### if-else Statement

Executes one block if condition is true, another if false:

```javascript
let temperature = 25;

if (temperature > 30) {
  console.log('It\'s hot outside');
} else {
  console.log('It\'s not too hot');
}
```

### if-else if-else Statement

Tests multiple conditions:

```javascript
let score = 85;

if (score >= 90) {
  console.log('Grade: A');
} else if (score >= 80) {
  console.log('Grade: B');
} else if (score >= 70) {
  console.log('Grade: C');
} else if (score >= 60) {
  console.log('Grade: D');
} else {
  console.log('Grade: F');
}
```

### Nested if Statements

```javascript
let age = 25;
let hasLicense = true;

if (age >= 18) {
  if (hasLicense) {
    console.log('You can drive');
  } else {
    console.log('You need a license to drive');
  }
} else {
  console.log('You are too young to drive');
}
```

## Switch Statement

Alternative to multiple if-else if statements:

```javascript
let day = 3;
let dayName;

switch (day) {
  case 1:
    dayName = 'Monday';
    break;
  case 2:
    dayName = 'Tuesday';
    break;
  case 3:
    dayName = 'Wednesday';
    break;
  case 4:
    dayName = 'Thursday';
    break;
  case 5:
    dayName = 'Friday';
    break;
  case 6:
    dayName = 'Saturday';
    break;
  case 7:
    dayName = 'Sunday';
    break;
  default:
    dayName = 'Invalid day';
}

console.log(dayName); // 'Wednesday'
```

### Switch with Multiple Cases

```javascript
let fruit = 'apple';
let color;

switch (fruit) {
  case 'banana':
  case 'lemon':
    color = 'yellow';
    break;
  case 'apple':
  case 'cherry':
    color = 'red';
    break;
  case 'orange':
    color = 'orange';
    break;
  default:
    color = 'unknown';
}

console.log(color); // 'red'
```

## Ternary Operator

Shorthand for simple if-else:

```javascript
let age = 20;
let status = age >= 18 ? 'adult' : 'minor';
console.log(status); // 'adult'

// Multiple conditions
let score = 85;
let grade = score >= 90 ? 'A' : score >= 80 ? 'B' : score >= 70 ? 'C' : 'F';
console.log(grade); // 'B'
```

## Loops

### for Loop

Executes code a specific number of times:

```javascript
// Basic for loop
for (let i = 0; i < 5; i++) {
  console.log('Iteration:', i);
}

// Output: Iteration: 0, 1, 2, 3, 4
```

### while Loop

Executes code while a condition is true:

```javascript
let count = 0;

while (count < 5) {
  console.log('Count:', count);
  count++;
}

// Output: Count: 0, 1, 2, 3, 4
```

### do-while Loop

Executes code at least once, then while condition is true:

```javascript
let number;

do {
  number = parseInt(prompt('Enter a number greater than 10:'));
} while (number <= 10);

console.log('You entered:', number);
```

### for-in Loop

Iterates over object properties:

```javascript
let person = {
  name: 'John',
  age: 30,
  city: 'New York'
};

for (let key in person) {
  console.log(key + ':', person[key]);
}

// Output:
// name: John
// age: 30
// city: New York
```

### for-of Loop (ES6)

Iterates over iterable objects (arrays, strings, etc.):

```javascript
let numbers = [1, 2, 3, 4, 5];

for (let number of numbers) {
  console.log(number);
}

// Output: 1, 2, 3, 4, 5

let name = 'JavaScript';

for (let char of name) {
  console.log(char);
}

// Output: J, a, v, a, S, c, r, i, p, t
```

## Loop Control Statements

### break

Exits the loop immediately:

```javascript
for (let i = 0; i < 10; i++) {
  if (i === 5) {
    break; // Exit loop when i equals 5
  }
  console.log(i);
}

// Output: 0, 1, 2, 3, 4
```

### continue

Skips the current iteration and continues with the next:

```javascript
for (let i = 0; i < 10; i++) {
  if (i % 2 === 0) {
    continue; // Skip even numbers
  }
  console.log(i);
}

// Output: 1, 3, 5, 7, 9
```

### labeled Statements

Used with break or continue for nested loops:

```javascript
outerLoop: for (let i = 0; i < 3; i++) {
  for (let j = 0; j < 3; j++) {
    if (i === 1 && j === 1) {
      break outerLoop; // Exit both loops
    }
    console.log(`i: ${i}, j: ${j}`);
  }
}

// Output:
// i: 0, j: 0
// i: 0, j: 1
// i: 0, j: 2
// i: 1, j: 0
```

## Error Handling

### try-catch Statement

Handles runtime errors:

```javascript
try {
  let result = riskyOperation();
  console.log('Success:', result);
} catch (error) {
  console.log('Error occurred:', error.message);
} finally {
  console.log('This always executes');
}
```

### throw Statement

Creates custom errors:

```javascript
function divide(a, b) {
  if (b === 0) {
    throw new Error('Division by zero is not allowed');
  }
  return a / b;
}

try {
  let result = divide(10, 0);
} catch (error) {
  console.log(error.message); // 'Division by zero is not allowed'
}
```

## Practical Examples

### FizzBuzz

```javascript
for (let i = 1; i <= 100; i++) {
  if (i % 3 === 0 && i % 5 === 0) {
    console.log('FizzBuzz');
  } else if (i % 3 === 0) {
    console.log('Fizz');
  } else if (i % 5 === 0) {
    console.log('Buzz');
  } else {
    console.log(i);
  }
}
```

### Finding Maximum in Array

```javascript
let numbers = [3, 7, 2, 9, 5];
let max = numbers[0];

for (let i = 1; i < numbers.length; i++) {
  if (numbers[i] > max) {
    max = numbers[i];
  }
}

console.log('Maximum:', max); // 9
```

### User Authentication

```javascript
let users = [
  { username: 'admin', password: '12345' },
  { username: 'user', password: 'password' }
];

function authenticate(username, password) {
  for (let user of users) {
    if (user.username === username && user.password === password) {
      return true;
    }
  }
  return false;
}

let isAuthenticated = authenticate('admin', '12345');
console.log('Authenticated:', isAuthenticated); // true
```

### Safe Division with Error Handling

```javascript
function safeDivide(a, b) {
  try {
    if (typeof a !== 'number' || typeof b !== 'number') {
      throw new TypeError('Both arguments must be numbers');
    }
    if (b === 0) {
      throw new RangeError('Division by zero');
    }
    return a / b;
  } catch (error) {
    console.error('Error:', error.message);
    return null;
  }
}

console.log(safeDivide(10, 2));  // 5
console.log(safeDivide(10, 0));  // Error: Division by zero, returns null
console.log(safeDivide('10', 2)); // Error: Both arguments must be numbers, returns null
```

## Best Practices

### Use Appropriate Loop Types

- `for`: When you know the number of iterations
- `while`: When condition determines loop continuation
- `do-while`: When code must execute at least once
- `for-of`: For iterating arrays and iterables
- `for-in`: For object properties (be careful with arrays)

### Avoid Infinite Loops

```javascript
// Bad - infinite loop
while (true) {
  console.log('This will run forever');
}

// Good - controlled loop
let count = 0;
while (count < 10) {
  console.log(count);
  count++;
}
```

### Use Descriptive Variable Names

```javascript
// Good
for (let studentIndex = 0; studentIndex < students.length; studentIndex++) {
  let currentStudent = students[studentIndex];
  // ...
}

// Avoid
for (let i = 0; i < arr.length; i++) {
  let x = arr[i];
  // ...
}
```

### Handle Edge Cases

```javascript
function processArray(arr) {
  if (!Array.isArray(arr)) {
    throw new TypeError('Argument must be an array');
  }
  
  if (arr.length === 0) {
    console.log('Array is empty');
    return;
  }
  
  // Process array...
}
```

### Use Early Returns

```javascript
function validateUser(user) {
  if (!user) {
    return { valid: false, error: 'User is required' };
  }
  
  if (!user.name) {
    return { valid: false, error: 'Name is required' };
  }
  
  if (!user.email) {
    return { valid: false, error: 'Email is required' };
  }
  
  return { valid: true };
}
```

Control structures are fundamental to programming logic. Mastering them allows you to create dynamic, responsive JavaScript applications that can handle various scenarios and user interactions.
