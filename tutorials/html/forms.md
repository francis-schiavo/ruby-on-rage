# HTML Forms

HTML forms are used to collect user input. They allow users to enter data that can be sent to a server for processing. Forms are essential for user interaction on websites.

## Basic Form Structure

A basic HTML form looks like this:

```html
<form action="/submit-form" method="POST">
  <!-- Form elements go here -->
  <input type="submit" value="Submit">
</form>
```

- `<form>`: Container for form elements
- `action`: URL where form data is sent
- `method`: HTTP method (GET or POST)

## Input Types

HTML5 provides various input types for different kinds of data:

### Text Inputs

```html
<input type="text" name="username" placeholder="Enter username">
<input type="password" name="password" placeholder="Enter password">
<input type="email" name="email" placeholder="Enter email">
<input type="url" name="website" placeholder="Enter website URL">
<input type="tel" name="phone" placeholder="Enter phone number">
```

### Number and Date Inputs

```html
<input type="number" name="age" min="1" max="120">
<input type="range" name="volume" min="0" max="100">
<input type="date" name="birthdate">
<input type="datetime-local" name="appointment">
<input type="time" name="meeting-time">
```

### Choice Inputs

```html
<input type="checkbox" name="subscribe" value="yes"> Subscribe to newsletter
<input type="radio" name="gender" value="male"> Male
<input type="radio" name="gender" value="female"> Female
```

### File Upload

```html
<input type="file" name="avatar" accept="image/*">
```

### Hidden Input

```html
<input type="hidden" name="user_id" value="123">
```

## Select Dropdowns

```html
<select name="country">
  <option value="">Select a country</option>
  <option value="us">United States</option>
  <option value="ca">Canada</option>
  <option value="uk">United Kingdom</option>
</select>
```

For multiple selections:

```html
<select name="hobbies" multiple>
  <option value="reading">Reading</option>
  <option value="sports">Sports</option>
  <option value="music">Music</option>
</select>
```

## Textarea

For multi-line text input:

```html
<textarea name="message" rows="4" cols="50" placeholder="Enter your message"></textarea>
```

## Buttons

```html
<button type="submit">Submit</button>
<button type="reset">Reset</button>
<button type="button" onclick="alert('Hello!')">Click me</button>
```

## Form Validation

HTML5 provides built-in form validation:

```html
<input type="email" name="email" required>
<input type="password" name="password" minlength="8" required>
<input type="number" name="age" min="18" max="99">
```

## Form Groups and Labels

Use `<fieldset>` and `<legend>` to group related form elements:

```html
<fieldset>
  <legend>Personal Information</legend>
  <label for="firstname">First Name:</label>
  <input type="text" id="firstname" name="firstname">
  
  <label for="lastname">Last Name:</label>
  <input type="text" id="lastname" name="lastname">
</fieldset>
```

Always use `<label>` elements for accessibility:

```html
<label for="email">Email Address:</label>
<input type="email" id="email" name="email">
```

## Form Submission

### GET Method
Data is appended to the URL as query parameters. Suitable for non-sensitive data and bookmarks.

### POST Method
Data is sent in the request body. Suitable for sensitive data and large amounts of data.

## File Upload Forms

For file uploads, use `enctype="multipart/form-data"`:

```html
<form action="/upload" method="POST" enctype="multipart/form-data">
  <input type="file" name="document">
  <input type="submit" value="Upload">
</form>
```

## Form Styling Considerations

While forms can be styled with CSS, remember:
- Use consistent spacing and alignment
- Provide clear visual feedback for focus, validation states
- Ensure sufficient contrast for accessibility
- Make buttons and interactive elements clearly clickable

## JavaScript Integration

Forms often work with JavaScript for enhanced functionality:
- Client-side validation
- Dynamic form elements
- AJAX submission
- Real-time feedback

## Security Considerations

- Always validate input on the server side
- Use HTTPS for sensitive forms
- Implement CSRF protection
- Sanitize user input to prevent XSS attacks

## Best Practices

1. Use semantic form elements
2. Provide clear labels for all inputs
3. Group related fields with `<fieldset>`
4. Use appropriate input types for better UX
5. Implement both client and server-side validation
6. Test forms across different devices and browsers
7. Ensure accessibility with proper labeling and keyboard navigation
