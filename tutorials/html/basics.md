# HTML Basics

HTML (HyperText Markup Language) is the standard markup language for creating web pages. It provides the structure and content of a webpage, defining elements like headings, paragraphs, links, images, and more.

## What is HTML?

HTML is not a programming language; it's a markup language that tells web browsers how to display content. It uses tags to mark up different parts of the content.

## Basic Structure

Every HTML document has a basic structure:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
</head>
<body>
    <h1>My First Heading</h1>
    <p>My first paragraph.</p>
</body>
</html>
```

- `<!DOCTYPE html>`: Declares the document type and version of HTML
- `<html>`: The root element of the HTML document
- `<head>`: Contains meta-information about the document
- `<body>`: Contains the visible page content

## Common HTML Elements

### Headings
Headings are defined with `<h1>` to `<h6>` tags:

```html
<h1>Main Heading</h1>
<h2>Subheading</h2>
<h3>Sub-subheading</h3>
```

### Paragraphs
Paragraphs are created with the `<p>` tag:

```html
<p>This is a paragraph of text.</p>
```

### Links
Links are created with the `<a>` tag:

```html
<a href="https://www.example.com">Visit Example</a>
```

### Images
Images are embedded with the `<img>` tag:

```html
<img src="image.jpg" alt="Description of image">
```

## HTML Attributes

Attributes provide additional information about HTML elements. They are always specified in the start tag and usually come in name/value pairs like `name="value"`.

Common attributes include:
- `href` for links
- `src` for images
- `alt` for image descriptions
- `class` and `id` for CSS and JavaScript targeting

## Comments

Comments in HTML are written like this:

```html
<!-- This is a comment -->
```

Comments are not displayed in the browser but can help document your code.

## Next Steps

Now that you understand the basics, you can learn about more advanced HTML elements, forms, and how HTML integrates with CSS and JavaScript to create modern web pages.
