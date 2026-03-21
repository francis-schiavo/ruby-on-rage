# Semantic HTML

Semantic HTML refers to the use of HTML markup to reinforce the semantics, or meaning, of the information in webpages rather than merely defining its presentation. Semantic elements clearly describe their meaning to both the browser and the developer.

## Why Semantic HTML Matters

1. **Accessibility**: Screen readers and other assistive technologies can better understand the content
2. **SEO**: Search engines can better understand the structure and content of the page
3. **Maintainability**: Code is easier to read and maintain
4. **Future-proofing**: Content remains meaningful even as presentation technologies change

## Semantic vs Non-Semantic Elements

### Non-Semantic Elements
These elements tell nothing about their content:

```html
<div id="header"></div>
<div class="article"></div>
<span class="footer"></span>
```

### Semantic Elements
These elements clearly define their content:

```html
<header></header>
<article></article>
<footer></footer>
```

## Main Semantic Elements

### Document Structure

- `<header>`: Introductory content or navigational links
- `<nav>`: Navigation links
- `<main>`: Main content of the document
- `<section>`: Thematic grouping of content
- `<article>`: Self-contained content (blog post, news article, etc.)
- `<aside>`: Content indirectly related to the main content (sidebars, pull quotes)
- `<footer>`: Footer of a document or section

### Text Content

- `<h1>` to `<h6>`: Headings with hierarchical importance
- `<p>`: Paragraph
- `<blockquote>`: Extended quotation
- `<cite>`: Title of a work
- `<q>`: Short inline quotation
- `<abbr>`: Abbreviation or acronym
- `<address>`: Contact information
- `<time>`: Date/time
- `<mark>`: Marked/highlighted text
- `<dfn>`: Defining instance of a term

### Lists

- `<ul>`: Unordered list
- `<ol>`: Ordered list
- `<li>`: List item
- `<dl>`: Description list
- `<dt>`: Description term
- `<dd>`: Description definition

## Example Semantic Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Semantic HTML Example</title>
</head>
<body>
    <header>
        <h1>My Website</h1>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section>
            <h2>Welcome</h2>
            <p>This is the main content of the page.</p>
        </section>

        <article>
            <h3>Blog Post Title</h3>
            <p>Article content goes here...</p>
            <footer>
                <p>Posted on <time datetime="2023-12-01">December 1, 2023</time></p>
            </footer>
        </article>

        <aside>
            <h3>Related Links</h3>
            <ul>
                <li><a href="#">Link 1</a></li>
                <li><a href="#">Link 2</a></li>
            </ul>
        </aside>
    </main>

    <footer>
        <p>&copy; 2023 My Website</p>
    </footer>
</body>
</html>
```

## Benefits for Screen Readers

Semantic HTML helps screen readers navigate content:

- `<nav>` elements can be quickly jumped to
- `<main>` identifies the primary content
- `<article>` and `<section>` provide content hierarchy
- `<header>` and `<footer>` distinguish different page regions

## SEO Advantages

Search engines use semantic markup to:
- Understand page structure
- Identify main content vs. navigation/ads
- Determine content relationships
- Improve search result snippets

## Microdata and Schema.org

For even richer semantics, you can use microdata attributes:

```html
<article itemscope itemtype="https://schema.org/Article">
    <h1 itemprop="headline">Article Title</h1>
    <p itemprop="description">Article description...</p>
    <time itemprop="datePublished" datetime="2023-12-01">December 1, 2023</time>
</article>
```

## Common Mistakes to Avoid

1. Using `<div>` when a semantic element would be more appropriate
2. Using headings for styling rather than structure
3. Skipping `<main>` and using multiple `<section>` elements at the root level
4. Not using `<nav>` for navigation menus
5. Using `<blockquote>` for indentation instead of actual quotations

## Semantic HTML in Frameworks

Many modern frameworks encourage semantic HTML:
- React: Use semantic elements in JSX
- Vue: Semantic elements in templates
- Angular: Semantic elements in component templates

## Validation and Testing

- Use HTML validators to check semantic correctness
- Test with screen readers (NVDA, JAWS, VoiceOver)
- Use browser developer tools to inspect the document outline
- Check accessibility with tools like WAVE or axe

## Best Practices

1. Use the correct semantic element for the content's purpose
2. Maintain a logical heading hierarchy (h1 → h2 → h3, etc.)
3. Use `<main>` for the primary content of each page
4. Group navigation in `<nav>` elements
5. Use `<section>` for thematic grouping, not just styling
6. Provide meaningful text alternatives for images and media
7. Use `<time>` for dates and times
8. Consider the document outline when structuring content

Remember: Semantic HTML is about meaning, not appearance. Use CSS for styling, HTML for structure and meaning.
