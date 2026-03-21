# HTML Accessibility

Web accessibility ensures that websites are usable by people with disabilities. HTML provides many built-in features to make content accessible to users with visual, motor, auditory, or cognitive impairments.

## Why Accessibility Matters

- **Legal Requirements**: Many countries have laws requiring accessible websites
- **Inclusive Design**: Benefits all users, not just those with disabilities
- **SEO Benefits**: Accessible sites often rank better in search engines
- **Better UX**: Clear, well-structured content improves user experience for everyone

## Semantic HTML

Using semantic elements provides meaning and structure:

```html
<!-- Good: Semantic structure -->
<header>
  <nav>
    <ul>
      <li><a href="#home">Home</a></li>
      <li><a href="#about">About</a></li>
    </ul>
  </nav>
</header>

<main>
  <article>
    <h1>Article Title</h1>
    <p>Article content...</p>
  </article>
</main>

<footer>
  <p>&copy; 2023 Your Site</p>
</footer>

<!-- Bad: Non-semantic structure -->
<div class="header">
  <div class="nav">
    <div class="nav-list">
      <div class="nav-item"><a href="#home">Home</a></div>
    </div>
  </div>
</div>
```

## Alternative Text for Images

Always provide meaningful alt text for images:

```html
<!-- Good -->
<img src="chart.png" alt="Sales growth from 2020 to 2023 showing 150% increase">

<!-- Bad -->
<img src="chart.png" alt="chart">
<img src="chart.png" alt=""> <!-- Empty alt text -->

<!-- Decorative images -->
<img src="divider.png" alt=""> <!-- Empty alt for decorative images -->
```

## Form Accessibility

Properly label form elements:

```html
<!-- Explicit labeling -->
<label for="email">Email Address:</label>
<input type="email" id="email" name="email">

<!-- Implicit labeling -->
<label>
  Email Address:
  <input type="email" name="email">
</label>

<!-- Fieldsets for grouped controls -->
<fieldset>
  <legend>Personal Information</legend>
  <label for="firstname">First Name:</label>
  <input type="text" id="firstname" name="firstname">
  
  <label for="lastname">Last Name:</label>
  <input type="text" id="lastname" name="lastname">
</fieldset>
```

## Keyboard Navigation

Ensure all interactive elements are keyboard accessible:

```html
<!-- Good: Natural tab order -->
<button>Submit</button>
<a href="#skip">Skip to main content</a>

<!-- Avoid: tabindex over 0 -->
<button tabindex="5">Bad button</button>

<!-- Use tabindex="0" for custom controls -->
<div tabindex="0" role="button" onclick="doSomething()">Custom Button</div>
```

## ARIA Attributes

ARIA (Accessible Rich Internet Applications) attributes enhance accessibility:

### Roles

```html
<div role="banner">Site header</div>
<div role="navigation">Main navigation</div>
<div role="main">Main content</div>
<div role="complementary">Sidebar</div>
<div role="contentinfo">Footer</div>
```

### States and Properties

```html
<button aria-expanded="false" aria-controls="menu">Menu</button>
<div id="menu" aria-hidden="true">
  <!-- Menu content -->
</div>

<!-- For custom checkboxes -->
<div role="checkbox" aria-checked="false" tabindex="0">Option 1</div>
```

### Labels and Descriptions

```html
<button aria-label="Close dialog">×</button>
<input type="text" aria-describedby="help-text">
<div id="help-text">Enter your full name as it appears on your ID</div>
```

## Color and Contrast

Ensure sufficient color contrast:

```html
<!-- Good contrast -->
<p style="color: #000; background: #fff;">Black text on white background</p>

<!-- Bad contrast -->
<p style="color: #888; background: #fff;">Gray text on white background</p>
```

Use tools to check contrast ratios (should be at least 4.5:1 for normal text).

## Media Accessibility

Provide alternatives for multimedia:

```html
<!-- Video with captions -->
<video controls>
  <source src="video.mp4" type="video/mp4">
  <track src="captions.vtt" kind="captions" srclang="en" label="English">
</video>

<!-- Audio with transcript -->
<audio controls>
  <source src="audio.mp3" type="audio/mpeg">
</audio>
<p><a href="transcript.html">Read transcript</a></p>
```

## Focus Management

Ensure visible focus indicators:

```css
/* Visible focus outline */
button:focus {
  outline: 2px solid blue;
  outline-offset: 2px;
}

/* High contrast focus */
button:focus {
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.5);
}
```

## Language and Text Direction

Specify language and text direction:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Accessible Page</title>
</head>
<body>
  <p>This is English content.</p>
  <p lang="es">Este es contenido en español.</p>
  <p dir="rtl" lang="ar">محتوى باللغة العربية</p>
</body>
</html>
```

## Skip Links

Provide ways to skip repetitive content:

```html
<body>
  <a href="#main-content" class="skip-link">Skip to main content</a>
  <header>
    <!-- Navigation content -->
  </header>
  <main id="main-content">
    <!-- Main content -->
  </main>
</body>
```

```css
.skip-link {
  position: absolute;
  top: -40px;
  left: 6px;
  background: #000;
  color: #fff;
  padding: 8px;
  text-decoration: none;
}

.skip-link:focus {
  top: 6px;
}
```

## Testing Accessibility

### Automated Tools

- WAVE Web Accessibility Evaluation Tool
- axe DevTools
- Lighthouse Accessibility Audit
- HTML Validators

### Manual Testing

- Keyboard navigation only
- Screen reader testing (NVDA, JAWS, VoiceOver)
- Color blindness simulation
- Zoom testing (200%+)

### User Testing

- Test with actual users with disabilities
- Get feedback from accessibility experts

## Common Accessibility Mistakes

1. Missing alt text on images
2. Poor color contrast
3. Missing form labels
4. Inaccessible custom controls
5. Missing heading hierarchy
6. Tables without proper headers
7. Auto-playing media without controls
8. Small touch targets
9. Missing focus indicators
10. Poor error messaging

## WCAG Guidelines

Follow Web Content Accessibility Guidelines (WCAG):

- **Perceivable**: Information must be presentable in ways users can perceive
- **Operable**: Interface components must be operable
- **Understandable**: Information and operation must be understandable
- **Robust**: Content must be robust enough for different user agents

## Best Practices

1. Start with semantic HTML
2. Test early and often
3. Use ARIA as enhancement, not replacement
4. Provide multiple ways to access content
5. Ensure keyboard accessibility
6. Use sufficient color contrast
7. Provide clear, concise content
8. Test with real users
9. Stay updated with accessibility standards
10. Make accessibility part of your development process

Accessibility is not a feature—it's a fundamental aspect of good web development that benefits everyone.
