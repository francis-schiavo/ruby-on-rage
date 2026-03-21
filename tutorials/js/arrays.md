# Arrays

Arrays are ordered collections of values that can hold different data types. They are one of the most fundamental data structures in JavaScript.

## Creating Arrays

### Array Literal

```javascript
let emptyArray = [];
let numbers = [1, 2, 3, 4, 5];
let mixed = ['hello', 42, true, null, { name: 'John' }];
let nested = [[1, 2], [3, 4], [5, 6]];
```

### Array Constructor

```javascript
let array1 = new Array(); // Empty array
let array2 = new Array(5); // Array with 5 empty slots
let array3 = new Array(1, 2, 3); // [1, 2, 3]
```

### Array.of() and Array.from()

```javascript
let array1 = Array.of(1, 2, 3); // [1, 2, 3]
let array2 = Array.from('hello'); // ['h', 'e', 'l', 'l', 'o']
let array3 = Array.from({ length: 5 }, (_, i) => i + 1); // [1, 2, 3, 4, 5]
```

## Accessing Elements

### By Index

```javascript
let fruits = ['apple', 'banana', 'orange'];

console.log(fruits[0]); // 'apple'
console.log(fruits[1]); // 'banana'
console.log(fruits[2]); // 'orange'
console.log(fruits[3]); // undefined
```

### Negative Indices (ES2022)

```javascript
let fruits = ['apple', 'banana', 'orange'];

console.log(fruits.at(-1)); // 'orange' (last element)
console.log(fruits.at(-2)); // 'banana' (second to last)
```

## Modifying Arrays

### Adding Elements

```javascript
let fruits = ['apple', 'banana'];

fruits.push('orange'); // Add to end: ['apple', 'banana', 'orange']
fruits.unshift('grape'); // Add to beginning: ['grape', 'apple', 'banana', 'orange']

fruits[fruits.length] = 'pear'; // Add to end using index
fruits[10] = 'melon'; // Creates empty slots: ['grape', 'apple', 'banana', 'orange', 'pear', empty × 5, 'melon']
```

### Removing Elements

```javascript
let fruits = ['apple', 'banana', 'orange', 'grape'];

fruits.pop(); // Remove from end: ['apple', 'banana', 'orange']
fruits.shift(); // Remove from beginning: ['banana', 'orange']

delete fruits[1]; // Creates hole: ['banana', empty, 'orange']
```

### Splicing

```javascript
let fruits = ['apple', 'banana', 'orange', 'grape'];

fruits.splice(1, 2); // Remove 2 elements starting at index 1: ['apple', 'grape']
fruits.splice(1, 0, 'kiwi', 'melon'); // Insert at index 1: ['apple', 'kiwi', 'melon', 'grape']
fruits.splice(1, 1, 'pear'); // Replace: ['apple', 'pear', 'melon', 'grape']
```

## Array Properties

### Length

```javascript
let fruits = ['apple', 'banana', 'orange'];
console.log(fruits.length); // 3

fruits.length = 2; // Truncate array: ['apple', 'banana']
fruits.length = 5; // Extend array: ['apple', 'banana', empty × 3]
```

## Array Methods

### Iteration Methods

#### forEach

```javascript
let numbers = [1, 2, 3, 4, 5];

numbers.forEach(function(number, index) {
  console.log(`Index ${index}: ${number}`);
});

// With arrow function
numbers.forEach((number, index) => {
  console.log(`Index ${index}: ${number}`);
});
```

#### map

```javascript
let numbers = [1, 2, 3, 4, 5];
let doubled = numbers.map(num => num * 2); // [2, 4, 6, 8, 10]

let fruits = ['apple', 'banana', 'orange'];
let upperFruits = fruits.map(fruit => fruit.toUpperCase()); // ['APPLE', 'BANANA', 'ORANGE']
```

#### filter

```javascript
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let evenNumbers = numbers.filter(num => num % 2 === 0); // [2, 4, 6, 8, 10]

let fruits = ['apple', 'banana', 'orange', 'grape'];
let longFruits = fruits.filter(fruit => fruit.length > 5); // ['banana', 'orange']
```

#### find and findIndex

```javascript
let numbers = [1, 2, 3, 4, 5];
let firstEven = numbers.find(num => num % 2 === 0); // 2
let firstEvenIndex = numbers.findIndex(num => num % 2 === 0); // 1

let users = [
  { id: 1, name: 'John' },
  { id: 2, name: 'Jane' },
  { id: 3, name: 'Bob' }
];

let user = users.find(user => user.id === 2); // { id: 2, name: 'Jane' }
```

#### some and every

```javascript
let numbers = [1, 2, 3, 4, 5];

let hasEven = numbers.some(num => num % 2 === 0); // true
let allEven = numbers.every(num => num % 2 === 0); // false
let allPositive = numbers.every(num => num > 0); // true
```

### Transformation Methods

#### reduce

```javascript
let numbers = [1, 2, 3, 4, 5];
let sum = numbers.reduce((accumulator, current) => accumulator + current, 0); // 15

let max = numbers.reduce((max, current) => current > max ? current : max); // 5

let words = ['Hello', 'world', 'from', 'JavaScript'];
let sentence = words.reduce((sentence, word) => sentence + ' ' + word); // 'Hello world from JavaScript'
```

#### flat and flatMap

```javascript
let nested = [[1, 2], [3, 4], [5, 6]];
let flat = nested.flat(); // [1, 2, 3, 4, 5, 6]

let deepNested = [[1, [2, 3]], [4, [5, 6]]];
let flatDeep = deepNested.flat(2); // [1, 2, 3, 4, 5, 6]

let words = ['Hello world', 'JavaScript is fun'];
let letters = words.flatMap(word => word.split('')); // ['H', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd', 'J', 'a', 'v', 'a', 'S', 'c', 'r', 'i', 'p', 't', ' ', 'i', 's', ' ', 'f', 'u', 'n']
```

### Searching and Sorting

#### indexOf and lastIndexOf

```javascript
let fruits = ['apple', 'banana', 'orange', 'banana', 'grape'];

console.log(fruits.indexOf('banana')); // 1
console.log(fruits.lastIndexOf('banana')); // 3
console.log(fruits.indexOf('pear')); // -1
```

#### includes

```javascript
let fruits = ['apple', 'banana', 'orange'];

console.log(fruits.includes('banana')); // true
console.log(fruits.includes('pear')); // false
```

#### sort

```javascript
let numbers = [3, 1, 4, 1, 5, 9, 2, 6];
numbers.sort(); // [1, 1, 2, 3, 4, 5, 6, 9] (lexicographic sort)

numbers.sort((a, b) => a - b); // [1, 1, 2, 3, 4, 5, 6, 9] (numeric sort)
numbers.sort((a, b) => b - a); // [9, 6, 5, 4, 3, 2, 1, 1] (descending)

let fruits = ['orange', 'apple', 'banana'];
fruits.sort(); // ['apple', 'banana', 'orange']

let users = [
  { name: 'John', age: 30 },
  { name: 'Jane', age: 25 },
  { name: 'Bob', age: 35 }
];

users.sort((a, b) => a.age - b.age); // Sort by age ascending
```

### Manipulation Methods

#### slice

```javascript
let fruits = ['apple', 'banana', 'orange', 'grape', 'pear'];

let firstTwo = fruits.slice(0, 2); // ['apple', 'banana']
let lastTwo = fruits.slice(-2); // ['grape', 'pear']
let middle = fruits.slice(1, 4); // ['banana', 'orange', 'grape']
let copy = fruits.slice(); // Shallow copy of entire array
```

#### concat

```javascript
let fruits1 = ['apple', 'banana'];
let fruits2 = ['orange', 'grape'];
let allFruits = fruits1.concat(fruits2); // ['apple', 'banana', 'orange', 'grape']

let moreFruits = fruits1.concat('pear', ['kiwi', 'melon']); // ['apple', 'banana', 'pear', 'kiwi', 'melon']
```

#### join

```javascript
let fruits = ['apple', 'banana', 'orange'];
let fruitString = fruits.join(); // 'apple,banana,orange'
let customJoin = fruits.join(' | '); // 'apple | banana | orange'
```

#### reverse

```javascript
let numbers = [1, 2, 3, 4, 5];
numbers.reverse(); // [5, 4, 3, 2, 1]
```

#### fill

```javascript
let numbers = [1, 2, 3, 4, 5];
numbers.fill(0); // [0, 0, 0, 0, 0]
numbers.fill(9, 2, 4); // [0, 0, 9, 9, 0]
```

## Array Destructuring

```javascript
let [first, second, ...rest] = [1, 2, 3, 4, 5];
console.log(first); // 1
console.log(second); // 2
console.log(rest); // [3, 4, 5]

let [a, , c] = [1, 2, 3]; // Skip second element
console.log(a, c); // 1, 3

let [x = 10, y = 20] = [5]; // Default values
console.log(x, y); // 5, 20
```

## Spread Operator

```javascript
let numbers = [1, 2, 3];
let moreNumbers = [...numbers, 4, 5]; // [1, 2, 3, 4, 5]

let copy = [...numbers]; // Shallow copy

function sum(a, b, c) {
  return a + b + c;
}

let nums = [1, 2, 3];
console.log(sum(...nums)); // 6
```

## Array-like Objects

```javascript
function sum() {
  let args = Array.from(arguments); // Convert arguments to array
  return args.reduce((sum, num) => sum + num, 0);
}

console.log(sum(1, 2, 3, 4)); // 10

// Or using spread
function sum2(...args) {
  return args.reduce((sum, num) => sum + num, 0);
}
```

## Multidimensional Arrays

```javascript
let matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

console.log(matrix[0][0]); // 1
console.log(matrix[1][2]); // 6

// Iterating over 2D array
for (let row of matrix) {
  for (let cell of row) {
    console.log(cell);
  }
}
```

## Performance Considerations

- Use `for` loops for performance-critical code
- `forEach` is slower than traditional loops
- `map`, `filter`, `reduce` create new arrays
- Consider array size for memory usage
- Use appropriate methods for the task

## Common Patterns

### Remove Duplicates

```javascript
let numbers = [1, 2, 2, 3, 4, 4, 5];
let unique = [...new Set(numbers)]; // [1, 2, 3, 4, 5]
```

### Shuffle Array

```javascript
function shuffle(array) {
  let shuffled = [...array];
  for (let i = shuffled.length - 1; i > 0; i--) {
    let j = Math.floor(Math.random() * (i + 1));
    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
  }
  return shuffled;
}
```

### Chunk Array

```javascript
function chunk(array, size) {
  let chunks = [];
  for (let i = 0; i < array.length; i += size) {
    chunks.push(array.slice(i, i + size));
  }
  return chunks;
}

chunk([1, 2, 3, 4, 5, 6, 7], 3); // [[1, 2, 3], [4, 5, 6], [7]]
```

Arrays are versatile and powerful data structures in JavaScript. Mastering array methods and patterns will greatly improve your coding efficiency and problem-solving abilities.
