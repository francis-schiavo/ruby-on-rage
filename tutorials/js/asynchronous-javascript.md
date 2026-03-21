# Asynchronous JavaScript

Asynchronous programming allows JavaScript to handle operations that take time to complete without blocking the execution of other code. This is crucial for web applications that need to fetch data, handle user interactions, and perform time-consuming tasks.

## Synchronous vs Asynchronous

### Synchronous Code

```javascript
console.log('Start');
console.log('Middle');
console.log('End');

// Output:
// Start
// Middle
// End
```

### Asynchronous Code

```javascript
console.log('Start');

setTimeout(() => {
  console.log('Async operation completed');
}, 1000);

console.log('End');

// Output:
// Start
// End
// Async operation completed (after 1 second)
```

## Callbacks

Callbacks are functions passed as arguments to other functions:

```javascript
function fetchData(callback) {
  setTimeout(() => {
    const data = { name: 'John', age: 30 };
    callback(data);
  }, 1000);
}

fetchData((data) => {
  console.log('Data received:', data);
});

console.log('Fetching data...');
```

### Callback Hell

Nested callbacks can become hard to read:

```javascript
fetchUser(1, (user) => {
  console.log('User:', user);
  fetchPosts(user.id, (posts) => {
    console.log('Posts:', posts);
    fetchComments(posts[0].id, (comments) => {
      console.log('Comments:', comments);
      // More nesting...
    });
  });
});
```

## Promises

Promises represent the eventual completion (or failure) of an asynchronous operation:

```javascript
function fetchData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const success = Math.random() > 0.5;
      
      if (success) {
        resolve({ name: 'John', age: 30 });
      } else {
        reject(new Error('Failed to fetch data'));
      }
    }, 1000);
  });
}

// Using promises
fetchData()
  .then((data) => {
    console.log('Success:', data);
    return data.name;
  })
  .then((name) => {
    console.log('Name:', name);
  })
  .catch((error) => {
    console.log('Error:', error.message);
  })
  .finally(() => {
    console.log('Operation completed');
  });
```

### Promise Methods

#### Promise.all()

Waits for all promises to resolve:

```javascript
let promise1 = fetch('/api/user');
let promise2 = fetch('/api/posts');
let promise3 = fetch('/api/comments');

Promise.all([promise1, promise2, promise3])
  .then((results) => {
    console.log('All data loaded:', results);
  })
  .catch((error) => {
    console.log('One request failed:', error);
  });
```

#### Promise.race()

Resolves/rejects as soon as any promise settles:

```javascript
let promise1 = new Promise(resolve => setTimeout(() => resolve('Fast'), 100));
let promise2 = new Promise(resolve => setTimeout(() => resolve('Slow'), 1000));

Promise.race([promise1, promise2])
  .then(result => console.log(result)); // 'Fast'
```

#### Promise.allSettled()

Waits for all promises to settle (resolve or reject):

```javascript
Promise.allSettled([promise1, promise2, promise3])
  .then(results => {
    results.forEach(result => {
      if (result.status === 'fulfilled') {
        console.log('Success:', result.value);
      } else {
        console.log('Error:', result.reason);
      }
    });
  });
```

## Async/Await

Async/await is syntactic sugar over promises, making asynchronous code look synchronous:

```javascript
async function fetchUserData() {
  try {
    console.log('Fetching user...');
    let user = await fetchData();
    console.log('User:', user);
    
    console.log('Fetching posts...');
    let posts = await fetchPosts(user.id);
    console.log('Posts:', posts);
    
    return { user, posts };
  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

// Usage
fetchUserData()
  .then(result => console.log('All data:', result))
  .catch(error => console.error('Failed:', error));

// Or with top-level await (ES2022)
let result = await fetchUserData();
console.log(result);
```

### Error Handling with Async/Await

```javascript
async function processData() {
  try {
    let data1 = await fetch('/api/data1');
    let data2 = await fetch('/api/data2');
    let result = await process(data1, data2);
    return result;
  } catch (error) {
    // Handle any error that occurred
    console.error('Processing failed:', error);
    throw new Error('Data processing failed');
  }
}
```

## Fetch API

Modern way to make HTTP requests:

```javascript
// GET request
fetch('/api/users')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    console.log('Users:', data);
  })
  .catch(error => {
    console.error('Fetch error:', error);
  });

// POST request
fetch('/api/users', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    name: 'John',
    email: 'john@example.com'
  })
})
.then(response => response.json())
.then(data => console.log('User created:', data))
.catch(error => console.error('Error:', error));

// With async/await
async function createUser(userData) {
  try {
    let response = await fetch('/api/users', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    
    let data = await response.json();
    return data;
  } catch (error) {
    console.error('Create user failed:', error);
    throw error;
  }
}
```

## XMLHttpRequest (Legacy)

Older way to make HTTP requests:

```javascript
function makeRequest(url, method = 'GET') {
  return new Promise((resolve, reject) => {
    let xhr = new XMLHttpRequest();
    
    xhr.open(method, url);
    xhr.onload = function() {
      if (xhr.status >= 200 && xhr.status < 300) {
        resolve(JSON.parse(xhr.responseText));
      } else {
        reject(new Error(`Request failed with status ${xhr.status}`));
      }
    };
    
    xhr.onerror = function() {
      reject(new Error('Network error'));
    };
    
    xhr.send();
  });
}

// Usage
makeRequest('/api/users')
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

## Web APIs

### setTimeout and setInterval

```javascript
// Execute once after delay
setTimeout(() => {
  console.log('Executed after 1 second');
}, 1000);

// Execute repeatedly
let intervalId = setInterval(() => {
  console.log('Executed every 2 seconds');
}, 2000);

// Stop interval
setTimeout(() => {
  clearInterval(intervalId);
  console.log('Interval stopped');
}, 10000);
```

### requestAnimationFrame

For smooth animations:

```javascript
function animate() {
  // Animation logic here
  element.style.transform = `translateX(${position}px)`;
  
  if (position < 500) {
    requestAnimationFrame(animate);
  }
}

requestAnimationFrame(animate);
```

## Async Patterns

### Sequential Execution

```javascript
async function processSequentially() {
  let user = await fetchUser();
  let posts = await fetchPosts(user.id);
  let comments = await fetchComments(posts[0].id);
  
  return { user, posts, comments };
}
```

### Parallel Execution

```javascript
async function processInParallel() {
  let [user, posts, comments] = await Promise.all([
    fetchUser(),
    fetchPosts(),
    fetchComments()
  ]);
  
  return { user, posts, comments };
}
```

### Race Condition Handling

```javascript
async function fetchWithTimeout(url, timeout = 5000) {
  let controller = new AbortController();
  
  let timeoutId = setTimeout(() => controller.abort(), timeout);
  
  try {
    let response = await fetch(url, { signal: controller.signal });
    clearTimeout(timeoutId);
    return response.json();
  } catch (error) {
    if (error.name === 'AbortError') {
      throw new Error('Request timed out');
    }
    throw error;
  }
}
```

## Error Handling

### Global Error Handling

```javascript
window.addEventListener('unhandledrejection', function(event) {
  console.error('Unhandled promise rejection:', event.reason);
});

window.addEventListener('error', function(event) {
  console.error('Global error:', event.error);
});
```

### Retry Logic

```javascript
async function fetchWithRetry(url, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      let response = await fetch(url);
      return response.json();
    } catch (error) {
      if (i === maxRetries - 1) throw error;
      console.log(`Attempt ${i + 1} failed, retrying...`);
      await new Promise(resolve => setTimeout(resolve, 1000 * (i + 1)));
    }
  }
}
```

## Modern JavaScript Features

### Top-level Await (ES2022)

```javascript
// In modules
let data = await fetch('/api/data').then(r => r.json());
console.log(data); // Available globally
```

### Optional Chaining with Async

```javascript
let user = await fetchUser();
let avatar = user?.profile?.avatar ?? 'default.png';
```

## Best Practices

### Use Async/Await Over Promises

```javascript
// Preferred
async function loadData() {
  try {
    let user = await fetchUser();
    let posts = await fetchPosts(user.id);
    return { user, posts };
  } catch (error) {
    console.error('Error loading data:', error);
  }
}

// Avoid callback hell
function badExample() {
  fetchUser(function(user) {
    fetchPosts(user.id, function(posts) {
      // More nesting...
    });
  });
}
```

### Handle Errors Properly

```javascript
async function robustFunction() {
  try {
    let data = await riskyOperation();
    return processData(data);
  } catch (error) {
    // Log error
    console.error('Operation failed:', error);
    
    // Handle specific errors
    if (error.code === 'NETWORK_ERROR') {
      return showOfflineMessage();
    }
    
    // Re-throw or return fallback
    throw error;
  }
}
```

### Use Appropriate Concurrency

```javascript
// When order matters
let results = [];
for (let item of items) {
  let result = await processItem(item);
  results.push(result);
}

// When order doesn't matter
let results = await Promise.all(items.map(processItem));
```

### Cancel Operations

```javascript
function createCancellablePromise(promise) {
  let cancel;
  
  let cancellablePromise = new Promise((resolve, reject) => {
    cancel = () => reject(new Error('Cancelled'));
    promise.then(resolve).catch(reject);
  });
  
  cancellablePromise.cancel = cancel;
  return cancellablePromise;
}

// Usage
let request = createCancellablePromise(fetch('/api/data'));
setTimeout(() => request.cancel(), 5000); // Cancel after 5 seconds
```

Asynchronous programming is essential for modern web development. Understanding promises, async/await, and proper error handling will help you build robust, responsive applications.
