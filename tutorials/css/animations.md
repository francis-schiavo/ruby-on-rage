# CSS Animations and Transitions

CSS animations and transitions add life and interactivity to web pages. They allow you to create smooth changes between different states without JavaScript.

## CSS Transitions

Transitions provide smooth changes between property values over a specified duration.

### Basic Transition

```css
.button {
  background-color: blue;
  transition: background-color 0.3s ease;
}

.button:hover {
  background-color: red;
}
```

### Transition Properties

```css
.element {
  /* Property to transition */
  transition-property: background-color, transform;
  
  /* Duration of transition */
  transition-duration: 0.3s;
  
  /* Timing function */
  transition-timing-function: ease;
  
  /* Delay before transition starts */
  transition-delay: 0.1s;
  
  /* Shorthand */
  transition: background-color 0.3s ease 0.1s;
}
```

### Multiple Properties

```css
.box {
  transition: all 0.3s ease;
}

.box:hover {
  background-color: red;
  transform: scale(1.1);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
```

### Timing Functions

```css
.element {
  transition-timing-function: ease;        /* Default */
  transition-timing-function: linear;      /* Constant speed */
  transition-timing-function: ease-in;     /* Slow start */
  transition-timing-function: ease-out;    /* Slow end */
  transition-timing-function: ease-in-out; /* Slow start and end */
  transition-timing-function: cubic-bezier(0.25, 0.46, 0.45, 0.94); /* Custom */
}
```

## CSS Animations

Animations allow you to create more complex sequences of changes.

### Keyframe Animation

```css
@keyframes slideIn {
  0% {
    transform: translateX(-100%);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

.element {
  animation: slideIn 0.5s ease-out;
}
```

### Animation Properties

```css
.element {
  /* Name of the animation */
  animation-name: slideIn;
  
  /* Duration */
  animation-duration: 0.5s;
  
  /* Timing function */
  animation-timing-function: ease-out;
  
  /* Delay */
  animation-delay: 0.2s;
  
  /* Number of iterations */
  animation-iteration-count: 1; /* or infinite */
  
  /* Direction */
  animation-direction: normal; /* or reverse, alternate, alternate-reverse */
  
  /* Fill mode */
  animation-fill-mode: forwards; /* or backwards, both, none */
  
  /* Play state */
  animation-play-state: running; /* or paused */
  
  /* Shorthand */
  animation: slideIn 0.5s ease-out 0.2s infinite alternate forwards;
}
```

### Complex Keyframes

```css
@keyframes bounce {
  0%, 20%, 50%, 80%, 100% {
    transform: translateY(0);
  }
  40% {
    transform: translateY(-30px);
  }
  60% {
    transform: translateY(-15px);
  }
}

.bounce {
  animation: bounce 2s infinite;
}
```

## Transform Property

Transforms allow you to modify the coordinate space of elements.

### 2D Transforms

```css
.element {
  transform: translate(50px, 100px);    /* Move */
  transform: rotate(45deg);             /* Rotate */
  transform: scale(1.5);                /* Scale */
  transform: scale(1.5, 0.5);           /* Scale X and Y */
  transform: skew(10deg, 20deg);        /* Skew */
  transform: matrix(1, 0, 0, 1, 50, 0); /* Matrix transformation */
}
```

### 3D Transforms

```css
.element {
  transform: translate3d(50px, 100px, 20px);
  transform: rotateX(45deg);
  transform: rotateY(45deg);
  transform: rotateZ(45deg);
  transform: scale3d(1.5, 1.5, 2);
  transform: perspective(1000px) rotateY(45deg);
}
```

### Transform Origin

```css
.element {
  transform-origin: center center; /* Default */
  transform-origin: top left;
  transform-origin: 50px 50px;
}
```

## Performance Considerations

### GPU Acceleration

Use transforms and opacity for smooth animations:

```css
/* Good for performance */
.element {
  transform: translateX(100px);
  opacity: 0.5;
}

/* Avoid for animation */
.element {
  margin-left: 100px;
  width: 200px;
}
```

### Will-Change Property

```css
.element {
  will-change: transform, opacity;
}

/* Reset after animation */
.element:not(:hover) {
  will-change: auto;
}
```

## Animation Libraries

While CSS animations are powerful, libraries can help with complex animations:

### Animate.css

```html
<div class="animate__animated animate__bounce">Content</div>
```

### Custom Animation Classes

```css
.fade-in {
  animation: fadeIn 0.5s ease-out;
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
```

## Practical Examples

### Button Hover Effects

```css
.button {
  background: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.button:hover {
  background: #0056b3;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.button:active {
  transform: translateY(0);
}
```

### Loading Spinner

```css
.spinner {
  width: 40px;
  height: 40px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #3498db;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
```

### Slide-in Navigation

```css
.nav {
  position: fixed;
  top: 0;
  left: -250px;
  width: 250px;
  height: 100vh;
  background: white;
  transition: left 0.3s ease;
}

.nav.open {
  left: 0;
}
```

### Card Flip Animation

```css
.card {
  perspective: 1000px;
}

.card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  transition: transform 0.6s;
  transform-style: preserve-3d;
}

.card.flipped .card-inner {
  transform: rotateY(180deg);
}

.card-front,
.card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
}

.card-back {
  transform: rotateY(180deg);
}
```

## Accessibility Considerations

### Reduced Motion

Respect user preferences for reduced motion:

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Animation Triggers

Use appropriate triggers for animations:

```css
/* Hover for desktop */
@media (hover: hover) {
  .button:hover {
    transform: scale(1.05);
  }
}

/* Focus for keyboard navigation */
.button:focus {
  outline: 2px solid blue;
  outline-offset: 2px;
}
```

## Browser Support and Fallbacks

### Vendor Prefixes

```css
.element {
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transform: rotate(45deg);
}
```

### Feature Detection

```javascript
const supportsTransform = 'transform' in document.documentElement.style;
```

## Best Practices

1. **Use transitions** for simple state changes
2. **Use animations** for complex sequences
3. **Optimize performance** with transforms and opacity
4. **Respect user preferences** for reduced motion
5. **Test across browsers** and provide fallbacks
6. **Use meaningful animations** that enhance UX
7. **Keep animations subtle** and not distracting
8. **Document animation timings** for consistency

CSS animations and transitions provide powerful ways to create engaging, interactive user experiences without relying on JavaScript.
