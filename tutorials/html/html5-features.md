# HTML5 Features

HTML5 is the latest version of HTML, introducing new elements, attributes, and APIs that make it easier to create modern, interactive web applications. It focuses on semantic markup, improved form handling, multimedia support, and better accessibility.

## New Semantic Elements

HTML5 introduced many semantic elements for better document structure:

### Structural Elements

- `<header>`: Header content
- `<nav>`: Navigation links
- `<main>`: Main content
- `<section>`: Thematic sections
- `<article>`: Self-contained content
- `<aside>`: Sidebar content
- `<footer>`: Footer content
- `<figure>` and `<figcaption>`: Figures with captions

### Text-Level Elements

- `<mark>`: Marked/highlighted text
- `<time>`: Date/time content
- `<wbr>`: Word break opportunity

## Enhanced Form Controls

HTML5 provides new input types and attributes for better form handling:

### New Input Types

```html
<input type="email" name="email">
<input type="url" name="website">
<input type="tel" name="phone">
<input type="number" name="quantity" min="1" max="10">
<input type="range" name="volume" min="0" max="100">
<input type="date" name="birthdate">
<input type="datetime-local" name="appointment">
<input type="time" name="meeting-time">
<input type="color" name="favorite-color">
<input type="search" name="query">
```

### New Form Attributes

- `placeholder`: Hint text for input fields
- `required`: Makes field mandatory
- `autofocus`: Automatically focuses the field
- `autocomplete`: Enables/disables autocomplete
- `pattern`: Regular expression for validation
- `min`, `max`, `step`: Constraints for numeric inputs

```html
<input type="email" placeholder="Enter your email" required autofocus>
<input type="password" minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
```

## Multimedia Elements

HTML5 introduced native support for audio and video:

### Audio Element

```html
<audio controls>
  <source src="audio.mp3" type="audio/mpeg">
  <source src="audio.ogg" type="audio/ogg">
  Your browser does not support the audio element.
</audio>
```

### Video Element

```html
<video controls width="640" height="360">
  <source src="video.mp4" type="video/mp4">
  <source src="video.webm" type="video/webm">
  Your browser does not support the video element.
</video>
```

Attributes for media elements:
- `controls`: Shows playback controls
- `autoplay`: Starts playing automatically
- `loop`: Loops the media
- `muted`: Starts muted
- `preload`: How to preload the media

## Canvas API

The `<canvas>` element provides a drawing surface for dynamic graphics:

```html
<canvas id="myCanvas" width="400" height="300">
  Your browser does not support the canvas element.
</canvas>

<script>
  const canvas = document.getElementById('myCanvas');
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(10, 10, 100, 100);
</script>
```

## SVG Support

HTML5 has native support for Scalable Vector Graphics:

```html
<svg width="100" height="100">
  <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />
</svg>
```

## Web Storage

HTML5 provides localStorage and sessionStorage for client-side data storage:

```javascript
// Store data
localStorage.setItem('username', 'john_doe');

// Retrieve data
const username = localStorage.getItem('username');

// Remove data
localStorage.removeItem('username');

// Clear all data
localStorage.clear();
```

## Geolocation API

Access user's geographical location:

```javascript
if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position) {
    console.log("Latitude: " + position.coords.latitude);
    console.log("Longitude: " + position.coords.longitude);
  });
}
```

## Drag and Drop API

Native drag and drop functionality:

```html
<div id="drop-zone" ondrop="drop(event)" ondragover="allowDrop(event)">
  Drop files here
</div>

<script>
  function allowDrop(ev) {
    ev.preventDefault();
  }

  function drop(ev) {
    ev.preventDefault();
    // Handle dropped files
  }
</script>
```

## Web Workers

Run JavaScript in background threads:

```javascript
// main.js
const worker = new Worker('worker.js');
worker.postMessage('Hello Worker');

worker.onmessage = function(e) {
  console.log('Message from worker:', e.data);
};

// worker.js
onmessage = function(e) {
  console.log('Message from main:', e.data);
  postMessage('Hello Main');
};
```

## History API

Manipulate browser history:

```javascript
// Add a new history entry
history.pushState({page: 1}, "Page 1", "?page=1");

// Replace current history entry
history.replaceState({page: 2}, "Page 2", "?page=2");

// Listen for popstate events
window.addEventListener('popstate', function(e) {
  console.log('State changed:', e.state);
});
```

## Microdata and Custom Data Attributes

Add machine-readable data to HTML:

```html
<div itemscope itemtype="https://schema.org/Person">
  <span itemprop="name">John Doe</span>
  <span itemprop="jobTitle">Software Engineer</span>
</div>
```

Custom data attributes:

```html
<div data-user-id="123" data-role="admin">User Info</div>
```

## Accessibility Improvements

HTML5 includes better accessibility features:

- ARIA attributes for enhanced screen reader support
- Better form labeling
- Media elements with captions and descriptions

## Browser Support

Most modern browsers support HTML5 features, but always check compatibility:

- Use feature detection rather than browser detection
- Provide fallbacks for older browsers
- Use polyfills when necessary

## Best Practices

1. Use semantic elements for better accessibility and SEO
2. Provide fallbacks for media elements
3. Use appropriate input types for better UX
4. Implement proper form validation
5. Use ARIA attributes when semantic elements aren't sufficient
6. Test across different browsers and devices
7. Keep performance in mind with large canvas or video elements

HTML5 continues to evolve, with new features being added regularly. Stay updated with the latest specifications and browser support.
