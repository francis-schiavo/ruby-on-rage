# HTML Best Practices

Following best practices in HTML ensures your code is maintainable, accessible, performant, and future-proof. These guidelines help create professional, standards-compliant web pages.

## Document Structure

### Proper DOCTYPE

Always declare the HTML5 doctype:

```html
<!DOCTYPE html>
<html lang="en">
<!-- Your content here -->
</html>
```

### Language Attribute

Specify the document language:

```html
<html lang="en"> <!-- English -->
<html lang="es"> <!-- Spanish -->
<html lang="fr"> <!-- French -->
<html lang="zh-CN"> <!-- Chinese (Simplified) -->
```

### Meta Tags

Include essential meta tags:

```html
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Brief description of the page">
  <meta name="author" content="Your Name">
  <title>Page Title | Site Name</title>
</head>
```

## Semantic HTML

Use semantic elements for better accessibility and SEO:

```html
<!-- Good -->
<header>
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
    </ul>
  </nav>
</header>

<main>
  <article>
    <h1>Article Title</h1>
    <section>
      <h2>Section Heading</h2>
      <p>Content...</p>
    </section>
  </article>
</main>

<footer>
  <p>&copy; 2023 Your Site</p>
</footer>

<!-- Avoid -->
<div class="header">
  <div class="nav">
    <div>Home</div>
  </div>
</div>
```

## Heading Hierarchy

Maintain proper heading structure:

```html
<h1>Main Page Title</h1>
  <h2>Section Title</h2>
    <h3>Subsection Title</h3>
    <h3>Another Subsection</h3>
  <h2>Another Section</h2>
    <h3>Subsection Title</h3>
```

Avoid skipping heading levels (h1 → h3) unless appropriate.

## Links and Navigation

Create meaningful links:

```html
<!-- Good -->
<a href="/about" title="Learn more about our company">About Us</a>
<a href="/contact" aria-label="Contact us via email or phone">Get in Touch</a>

<!-- Avoid -->
<a href="#" onclick="doSomething()">Click here</a>
<a href="javascript:void(0)">Link</a>
```

## Images

Always provide alt text and optimize images:

```html
<!-- Good -->
<img src="portrait.jpg" alt="John Doe, CEO of TechCorp, smiling at the camera" width="300" height="400">

<!-- For decorative images -->
<img src="divider.png" alt="" role="presentation">

<!-- Avoid -->
<img src="portrait.jpg"> <!-- Missing alt -->
<img src="portrait.jpg" alt="portrait.jpg"> <!-- Meaningless alt -->
```

## Forms

Create accessible, user-friendly forms:

```html
<form action="/submit" method="POST">
  <fieldset>
    <legend>Contact Information</legend>
    
    <label for="name">Full Name:</label>
    <input type="text" id="name" name="name" required autocomplete="name">
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required autocomplete="email">
    
    <label for="message">Message:</label>
    <textarea id="message" name="message" rows="4" required></textarea>
    
    <button type="submit">Send Message</button>
  </fieldset>
</form>
```

## Tables

Use tables for tabular data only:

```html
<table>
  <caption>Monthly Sales Report</caption>
  <thead>
    <tr>
      <th scope="col">Month</th>
      <th scope="col">Sales</th>
      <th scope="col">Growth</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">January</th>
      <td>$10,000</td>
      <td>+5%</td>
    </tr>
  </tbody>
</table>
```

## Lists

Use appropriate list types:

```html
<!-- Unordered list -->
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
</ul>

<!-- Ordered list -->
<ol>
  <li>First step</li>
  <li>Second step</li>
</ol>

<!-- Description list -->
<dl>
  <dt>HTML</dt>
  <dd>HyperText Markup Language</dd>
  <dt>CSS</dt>
  <dd>Cascading Style Sheets</dd>
</dl>
```

## Code Quality

### Indentation and Formatting

Keep code clean and readable:

```html
<!-- Good -->
<article class="post">
  <header>
    <h1>Post Title</h1>
    <time datetime="2023-12-01">December 1, 2023</time>
  </header>
  <p>Post content...</p>
</article>

<!-- Avoid -->
<article class="post"><header><h1>Post Title</h1><time datetime="2023-12-01">December 1, 2023</time></header><p>Post content...</p></article>
```

### Comments

Use comments to explain complex sections:

```html
<!-- Main navigation -->
<nav>
  <!-- Skip link for accessibility -->
  <a href="#main" class="sr-only">Skip to main content</a>
  <ul>
    <li><a href="/">Home</a></li>
  </ul>
</nav>
```

## Performance

### Minimize HTTP Requests

Combine files and use CSS sprites when possible.

### Optimize Images

- Use appropriate formats (JPEG for photos, PNG for graphics, SVG for icons)
- Compress images
- Use responsive images

```html
<picture>
  <source media="(min-width: 800px)" srcset="large.jpg">
  <source media="(min-width: 400px)" srcset="medium.jpg">
  <img src="small.jpg" alt="Responsive image">
</picture>
```

### Lazy Loading

```html
<img src="image.jpg" alt="Description" loading="lazy">
```

## Validation

Always validate your HTML:

- Use the W3C HTML Validator
- Check for errors and warnings
- Fix validation issues

## Cross-Browser Compatibility

- Test in multiple browsers
- Use progressive enhancement
- Provide fallbacks for older browsers

## Mobile-First Approach

Design for mobile first, then enhance for larger screens:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

## Security

- Validate and sanitize user input
- Use HTTPS
- Avoid inline JavaScript event handlers
- Implement Content Security Policy

## Accessibility Checklist

- Use semantic HTML
- Provide alt text for images
- Ensure sufficient color contrast
- Make content keyboard accessible
- Test with screen readers
- Use ARIA when necessary

## Tools and Resources

- **Validators**: W3C HTML Validator, HTMLHint
- **Linters**: ESLint with HTML plugins
- **Accessibility**: WAVE, axe, Lighthouse
- **Performance**: PageSpeed Insights, WebPageTest
- **Cross-browser**: BrowserStack, Sauce Labs

## Common Mistakes to Avoid

1. Missing DOCTYPE
2. Not specifying charset
3. Using deprecated elements/attributes
4. Missing alt text on images
5. Poor heading hierarchy
6. Inaccessible forms
7. Overusing div elements
8. Not testing in multiple browsers
9. Ignoring mobile users
10. Not validating code

## Continuous Learning

HTML standards evolve, so stay updated:

- Follow W3C specifications
- Read web development blogs
- Participate in developer communities
- Take courses and certifications
- Experiment with new features

Following these best practices will help you create high-quality, maintainable, and accessible HTML documents that work well across all devices and browsers.
