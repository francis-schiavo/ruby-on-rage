# HTML Attributes

HTML attributes provide additional information about HTML elements. They are always specified in the opening tag and usually come in name/value pairs like `name="value"`.

## Attribute Syntax

Attributes are added to the opening tag of an element:

```html
<element attribute="value">Content</element>
```

Multiple attributes can be added:

```html
<element attribute1="value1" attribute2="value2">Content</element>
```

## Global Attributes

Global attributes can be used on any HTML element:

- `id`: Unique identifier for the element
- `class`: Class name for styling (can be multiple classes separated by spaces)
- `style`: Inline CSS styles
- `title`: Extra information about the element (shown as tooltip)
- `lang`: Language of the element's content
- `data-*`: Custom data attributes (e.g., `data-user-id="123"`)

## Common Element-Specific Attributes

### Links (`<a>`)

- `href`: URL of the link
- `target`: Where to open the link (`_blank`, `_self`, `_parent`, `_top`)
- `rel`: Relationship between current document and linked document

```html
<a href="https://example.com" target="_blank" rel="noopener">Visit Example</a>
```

### Images (`<img>`)

- `src`: Source URL of the image
- `alt`: Alternative text for the image (important for accessibility)
- `width` and `height`: Dimensions of the image
- `loading`: Loading behavior (`lazy` or `eager`)

```html
<img src="image.jpg" alt="A beautiful landscape" width="300" height="200" loading="lazy">
```

### Forms (`<form>`)

- `action`: URL where form data is sent
- `method`: HTTP method (`GET` or `POST`)
- `enctype`: Encoding type for form data

```html
<form action="/submit" method="POST" enctype="multipart/form-data">
```

### Input Fields (`<input>`)

- `type`: Type of input (text, password, email, number, etc.)
- `name`: Name of the input field
- `value`: Default value
- `placeholder`: Hint text shown when field is empty
- `required`: Makes the field required
- `disabled`: Disables the input field
- `readonly`: Makes the field read-only

```html
<input type="email" name="user_email" placeholder="Enter your email" required>
```

### Buttons (`<button>`)

- `type`: Type of button (`submit`, `reset`, `button`)
- `disabled`: Disables the button

```html
<button type="submit" disabled>Submit Form</button>
```

### Select Elements (`<select>`)

- `name`: Name of the select field
- `multiple`: Allows multiple selections
- `size`: Number of visible options

```html
<select name="country" multiple size="3">
  <option value="us">United States</option>
  <option value="ca">Canada</option>
</select>
```

### Textarea (`<textarea>`)

- `name`: Name of the textarea
- `rows` and `cols`: Visible dimensions
- `placeholder`: Hint text
- `maxlength`: Maximum number of characters

```html
<textarea name="message" rows="4" cols="50" placeholder="Enter your message" maxlength="500"></textarea>
```

## Boolean Attributes

Some attributes are boolean - they don't need a value. Their presence indicates `true`, absence indicates `false`:

```html
<input type="checkbox" checked>
<input type="text" disabled>
```

## Custom Data Attributes

HTML5 allows custom data attributes using the `data-` prefix:

```html
<div data-user-id="123" data-role="admin">User Info</div>
```

These can be accessed in JavaScript using `element.dataset.userId`.

## Best Practices

1. Always use lowercase for attribute names
2. Always quote attribute values
3. Use meaningful `id` and `class` names
4. Provide `alt` text for images
5. Use semantic attributes appropriately
6. Avoid inline styles when possible (prefer CSS classes)

## Accessibility Considerations

- Use `alt` attributes on images
- Provide `title` attributes for additional context
- Use `lang` attribute for content in different languages
- Ensure sufficient color contrast for `title` tooltips
