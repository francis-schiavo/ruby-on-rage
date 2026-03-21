# HTML Elements and Tags

HTML elements are the building blocks of HTML pages. An HTML element is defined by a start tag, some content, and an end tag. Tags are not case sensitive, but lowercase is recommended.

## Element Structure

Most HTML elements have the following structure:

```html
<tagname>Content goes here...</tagname>
```

Some elements are self-closing (empty elements):

```html
<tagname />
```

## Common HTML Elements

### Text Elements

- `<h1>` to `<h6>`: Headings (h1 is most important, h6 is least)
- `<p>`: Paragraph
- `<br>`: Line break (self-closing)
- `<hr>`: Horizontal rule (self-closing)

### Formatting Elements

- `<strong>` or `<b>`: Bold text
- `<em>` or `<i>`: Italic text
- `<u>`: Underlined text
- `<mark>`: Marked/highlighted text
- `<small>`: Smaller text
- `<del>`: Deleted text
- `<ins>`: Inserted text
- `<sub>`: Subscript text
- `<sup>`: Superscript text

### Link and Navigation

- `<a>`: Hyperlink
- `<nav>`: Navigation links

### Lists

- `<ul>`: Unordered list
- `<ol>`: Ordered list
- `<li>`: List item
- `<dl>`: Description list
- `<dt>`: Description term
- `<dd>`: Description definition

### Tables

- `<table>`: Table
- `<tr>`: Table row
- `<td>`: Table data cell
- `<th>`: Table header cell
- `<thead>`: Table head
- `<tbody>`: Table body
- `<tfoot>`: Table foot

### Forms

- `<form>`: Form
- `<input>`: Input field (self-closing)
- `<textarea>`: Multi-line text input
- `<button>`: Button
- `<select>`: Drop-down list
- `<option>`: Option in a drop-down list

### Media Elements

- `<img>`: Image (self-closing)
- `<audio>`: Audio content
- `<video>`: Video content
- `<source>`: Media source (self-closing)

### Structural Elements

- `<div>`: Division or section
- `<span>`: Inline container
- `<header>`: Header
- `<footer>`: Footer
- `<main>`: Main content
- `<section>`: Section
- `<article>`: Article
- `<aside>`: Sidebar
- `<details>`: Collapsible content
- `<summary>`: Summary for details

## Block vs Inline Elements

- **Block elements** start on a new line and take up the full width available. Examples: `<div>`, `<p>`, `<h1>`, `<ul>`
- **Inline elements** do not start on a new line and only take up as much width as necessary. Examples: `<span>`, `<a>`, `<strong>`, `<img>`

## Nesting Elements

HTML elements can be nested inside each other, but you must close them in the reverse order of how they were opened:

```html
<p>This is a <strong>bold</strong> paragraph.</p>
```

## Semantic HTML

Semantic elements clearly describe their meaning to both the browser and the developer. Examples include `<header>`, `<footer>`, `<article>`, `<section>`, etc. Using semantic HTML improves accessibility and SEO.

## HTML5 New Elements

HTML5 introduced many new semantic elements:
- `<article>`
- `<aside>`
- `<details>`
- `<figcaption>`
- `<figure>`
- `<footer>`
- `<header>`
- `<main>`
- `<mark>`
- `<nav>`
- `<section>`
- `<summary>`
- `<time>`

These elements provide better structure and meaning to web documents.
