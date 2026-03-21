# Objects

Objects are collections of key-value pairs that allow you to store and organize data. They are fundamental to JavaScript and form the basis of object-oriented programming.

## Creating Objects

### Object Literal

```javascript
let person = {
  name: 'John',
  age: 30,
  isStudent: false,
  hobbies: ['reading', 'coding']
};
```

### Constructor Function

```javascript
function Person(name, age) {
  this.name = name;
  this.age = age;
  this.greet = function() {
    return `Hello, my name is ${this.name}`;
  };
}

let john = new Person('John', 30);
```

### Object.create()

```javascript
let personPrototype = {
  greet: function() {
    return `Hello, my name is ${this.name}`;
  }
};

let john = Object.create(personPrototype);
john.name = 'John';
john.age = 30;
```

### ES6 Classes

```javascript
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  
  greet() {
    return `Hello, my name is ${this.name}`;
  }
}

let john = new Person('John', 30);
```

## Accessing Properties

### Dot Notation

```javascript
let person = { name: 'John', age: 30 };

console.log(person.name); // 'John'
console.log(person.age); // 30
person.age = 31; // Modify property
```

### Bracket Notation

```javascript
let person = { name: 'John', age: 30 };

console.log(person['name']); // 'John'
console.log(person['age']); // 30

let property = 'name';
console.log(person[property]); // 'John'

// Useful for dynamic property names
let key = 'age';
person[key] = 31;
```

## Adding and Modifying Properties

```javascript
let person = { name: 'John' };

// Add new property
person.age = 30;
person['isStudent'] = false;

// Modify existing property
person.name = 'Jane';

// Add method
person.greet = function() {
  return `Hello, I'm ${this.name}`;
};
```

## Deleting Properties

```javascript
let person = { name: 'John', age: 30, city: 'New York' };

delete person.city; // Remove property
console.log(person.city); // undefined

// Cannot delete inherited properties
delete person.toString; // Won't work
```

## Object Methods

### Object.keys()

```javascript
let person = { name: 'John', age: 30, city: 'New York' };
let keys = Object.keys(person); // ['name', 'age', 'city']
```

### Object.values()

```javascript
let person = { name: 'John', age: 30, city: 'New York' };
let values = Object.values(person); // ['John', 30, 'New York']
```

### Object.entries()

```javascript
let person = { name: 'John', age: 30, city: 'New York' };
let entries = Object.entries(person); // [['name', 'John'], ['age', 30], ['city', 'New York']]
```

### Object.assign()

```javascript
let person = { name: 'John', age: 30 };
let job = { title: 'Developer', company: 'Tech Corp' };

let employee = Object.assign({}, person, job);
// { name: 'John', age: 30, title: 'Developer', company: 'Tech Corp' }

// Shallow copy
let copy = Object.assign({}, person);
```

### Object.freeze()

```javascript
let person = { name: 'John', age: 30 };
Object.freeze(person);

person.age = 31; // Won't work in strict mode
delete person.name; // Won't work
person.city = 'New York'; // Won't work
```

### Object.seal()

```javascript
let person = { name: 'John', age: 30 };
Object.seal(person);

person.age = 31; // Works
delete person.name; // Won't work
person.city = 'New York'; // Won't work
```

## Iterating Over Objects

### for...in Loop

```javascript
let person = { name: 'John', age: 30, city: 'New York' };

for (let key in person) {
  console.log(`${key}: ${person[key]}`);
}

// Check if property is own property
for (let key in person) {
  if (person.hasOwnProperty(key)) {
    console.log(`${key}: ${person[key]}`);
  }
}
```

### Object.keys() with forEach

```javascript
let person = { name: 'John', age: 30, city: 'New York' };

Object.keys(person).forEach(key => {
  console.log(`${key}: ${person[key]}`);
});
```

### for...of with Object.entries()

```javascript
let person = { name: 'John', age: 30, city: 'New York' };

for (let [key, value] of Object.entries(person)) {
  console.log(`${key}: ${value}`);
}
```

## Object Destructuring

```javascript
let person = { name: 'John', age: 30, city: 'New York' };

// Extract properties
let { name, age } = person;
console.log(name, age); // 'John' 30

// With default values
let { name: personName, age: personAge, country = 'USA' } = person;
console.log(personName, personAge, country); // 'John' 30 'USA'

// Nested destructuring
let user = {
  name: 'John',
  address: {
    city: 'New York',
    zip: '10001'
  }
};

let { name, address: { city, zip } } = user;
console.log(city, zip); // 'New York' '10001'
```

## Computed Property Names

```javascript
let prop = 'name';
let person = {
  [prop]: 'John',
  ['age']: 30,
  [`city_${prop}`]: 'New York'
};
// { name: 'John', age: 30, city_name: 'New York' }
```

## Getters and Setters

```javascript
let person = {
  firstName: 'John',
  lastName: 'Doe',
  
  get fullName() {
    return `${this.firstName} ${this.lastName}`;
  },
  
  set fullName(name) {
    let parts = name.split(' ');
    this.firstName = parts[0];
    this.lastName = parts[1];
  }
};

console.log(person.fullName); // 'John Doe'
person.fullName = 'Jane Smith';
console.log(person.firstName); // 'Jane'
console.log(person.lastName); // 'Smith'
```

## Prototypes and Inheritance

### Prototype Chain

```javascript
function Person(name) {
  this.name = name;
}

Person.prototype.greet = function() {
  return `Hello, I'm ${this.name}`;
};

let john = new Person('John');
console.log(john.greet()); // 'Hello, I'm John'

// Check prototype
console.log(john.__proto__ === Person.prototype); // true
console.log(Person.prototype.__proto__ === Object.prototype); // true
```

### Object.setPrototypeOf()

```javascript
let animal = {
  eats: true,
  walk: function() {
    console.log('Animal walks');
  }
};

let dog = {
  barks: true
};

Object.setPrototypeOf(dog, animal);

console.log(dog.eats); // true
dog.walk(); // 'Animal walks'
```

## JSON and Objects

### Converting to JSON

```javascript
let person = { name: 'John', age: 30 };
let jsonString = JSON.stringify(person); // '{"name":"John","age":30}'
```

### Parsing JSON

```javascript
let jsonString = '{"name":"John","age":30}';
let person = JSON.parse(jsonString); // { name: 'John', age: 30 }
```

## Object Comparison

```javascript
let obj1 = { name: 'John' };
let obj2 = { name: 'John' };
let obj3 = obj1;

console.log(obj1 === obj2); // false (different objects)
console.log(obj1 === obj3); // true (same reference)

// Deep comparison
function deepEqual(a, b) {
  if (a === b) return true;
  
  if (a == null || typeof a != "object" ||
      b == null || typeof b != "object") return false;
  
  let keysA = Object.keys(a), keysB = Object.keys(b);
  
  if (keysA.length != keysB.length) return false;
  
  for (let key of keysA) {
    if (!keysB.includes(key) || !deepEqual(a[key], b[key])) return false;
  }
  
  return true;
}

console.log(deepEqual(obj1, obj2)); // true
```

## Common Patterns

### Factory Function

```javascript
function createPerson(name, age) {
  return {
    name,
    age,
    greet() {
      return `Hello, I'm ${this.name}`;
    }
  };
}

let john = createPerson('John', 30);
```

### Module Pattern

```javascript
let counter = (function() {
  let count = 0;
  
  return {
    increment: function() {
      count++;
      return count;
    },
    decrement: function() {
      count--;
      return count;
    },
    getCount: function() {
      return count;
    }
  };
})();

console.log(counter.increment()); // 1
console.log(counter.getCount()); // 1
```

### Mixins

```javascript
let canEat = {
  eat: function(food) {
    return `${this.name} eats ${food}`;
  }
};

let canWalk = {
  walk: function() {
    return `${this.name} walks`;
  }
};

function Person(name) {
  this.name = name;
}

Object.assign(Person.prototype, canEat, canWalk);

let john = new Person('John');
console.log(john.eat('pizza')); // 'John eats pizza'
console.log(john.walk()); // 'John walks'
```

## Best Practices

### Use Object Literals for Simple Objects

```javascript
// Good
let config = {
  apiUrl: 'https://api.example.com',
  timeout: 5000,
  retries: 3
};
```

### Avoid Modifying Built-in Prototypes

```javascript
// Bad - Don't do this
Array.prototype.sum = function() {
  return this.reduce((a, b) => a + b, 0);
};

// Good - Create utility functions
function sumArray(arr) {
  return arr.reduce((a, b) => a + b, 0);
}
```

### Use Meaningful Property Names

```javascript
// Good
let user = {
  firstName: 'John',
  lastName: 'Doe',
  emailAddress: 'john@example.com'
};

// Avoid
let u = {
  fn: 'John',
  ln: 'Doe',
  e: 'john@example.com'
};
```

### Prefer const for Object References

```javascript
const person = { name: 'John' };
person.name = 'Jane'; // OK - modifying property
person = {}; // Error - reassigning reference
```

### Use Object Destructuring

```javascript
// Good
function processUser({ name, age, email }) {
  console.log(`${name} (${age}) - ${email}`);
}

// Avoid
function processUser(user) {
  console.log(`${user.name} (${user.age}) - ${user.email}`);
}
```

Objects are incredibly versatile in JavaScript. Understanding how to create, manipulate, and work with objects is essential for building complex applications.
