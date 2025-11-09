# Help Panel Feature - Usage Guide

The documentation system now supports **Help/Info panels** that slide in from the right side of the page.

## Features Added

### 1. Help Panel System
- ✅ Slide-in panel from the right side
- ✅ Overlay background when open
- ✅ Close button and ESC key support
- ✅ Responsive design

### 2. Fixed Navigation
- ✅ Navigation links now show actual page titles instead of "Prev/Next"
- ✅ Navigation buttons properly positioned (not hidden by sidebar)
- ✅ Arrow indicators (← and →)

## How to Add Help Buttons

### Page-Level Help Button

Add this at the beginning of any chapter or section to create a sticky help button at the top:

```xml
<chapter id="my-chapter">
  <title>My Chapter</title>

  <!-- Page-level help button -->
  <?dbhtml-include href="page-help-button.html"?>

  <para>Chapter content...</para>
</chapter>
```

Create `page-help-button.html`:

```html
<button class="help-button page-help-button" onclick="openHelpPanel('Page Help', `
  <h4>About This Page</h4>
  <p>This page covers the main features of our product.</p>

  <div class='tip'>
    <strong>Tip:</strong> Use the sidebar to navigate between sections.
  </div>

  <h4>Quick Links</h4>
  <ul>
    <li><a href='#section1'>Jump to Section 1</a></li>
    <li><a href='#section2'>Jump to Section 2</a></li>
  </ul>
`)">Help</button>
```

### Section-Level Help Button

Add help next to specific headings using processing instructions and HTML:

```xml
<section id="installation">
  <title>Installation
    <?dbhtml-include href="install-help-button.html"?>
  </title>

  <para>Installation instructions...</para>
</section>
```

Create `install-help-button.html`:

```html
<button class="help-button" onclick="openHelpPanel('Installation Help', `
  <h4>Installation Requirements</h4>
  <p>Before installing, ensure you have:</p>
  <ul>
    <li>Administrator access</li>
    <li>4GB free disk space</li>
    <li>Internet connection</li>
  </ul>

  <div class='note'>
    <strong>Note:</strong> Installation takes approximately 10 minutes.
  </div>

  <h4>Troubleshooting</h4>
  <p>If installation fails:</p>
  <ol>
    <li>Check firewall settings</li>
    <li>Verify disk space</li>
    <li>Contact support</li>
  </ol>
`)">More Info</button>
```

## Alternative: Inline JavaScript Method

You can also add help buttons directly in the XML using inline HTML:

```xml
<section id="configuration">
  <title>Configuration</title>

  <para>
    <![CDATA[
    <button class="help-button" onclick="openHelpPanel('Configuration Help', `
      <h4>Configuration Options</h4>
      <p>Available configuration parameters:</p>
      <ul>
        <li><code>api_key</code> - Your API key</li>
        <li><code>timeout</code> - Request timeout in seconds</li>
        <li><code>retry_count</code> - Number of retries</li>
      </ul>
    `)">Help</button>
    ]]>
  </para>

  <para>Configuration content goes here...</para>
</section>
```

## Help Panel Content Structure

Help panel content supports HTML and can include:

### Headings
```html
<h4>Section Title</h4>
```

### Paragraphs
```html
<p>Help text goes here.</p>
```

### Lists
```html
<ul>
  <li>Item one</li>
  <li>Item two</li>
</ul>

<ol>
  <li>Step one</li>
  <li>Step two</li>
</ol>
```

### Code
```html
<code>inline code</code>
```

### Callouts
```html
<div class='note'>
  <strong>Note:</strong> Important information.
</div>

<div class='tip'>
  <strong>Tip:</strong> Helpful suggestion.
</div>
```

### Links
```html
<a href='#section-id'>Internal link</a>
<a href='https://example.com'>External link</a>
```

## JavaScript API

The help panel system provides these functions:

### Open Help Panel
```javascript
openHelpPanel(title, htmlContent)
```

**Parameters:**
- `title` (string) - Title shown in panel header
- `htmlContent` (string) - HTML content to display

**Example:**
```javascript
openHelpPanel('Custom Help', `
  <p>Your help content here</p>
`)
```

### Close Help Panel
```javascript
closeHelpPanel()
```

Also closes when:
- User clicks overlay
- User clicks X button
- User presses ESC key

## Styling Customization

Help panel styles are in `docs-style.css`. You can customize:

### Panel Width
```css
.help-panel {
  width: 400px;  /* Change this */
}
```

### Colors
```css
.help-button {
  background: #f6f8fa;  /* Button background */
  color: #0969da;       /* Button text */
}

.help-button:hover {
  background: #0969da;  /* Hover background */
  color: #ffffff;       /* Hover text */
}
```

### Position
```css
.help-panel {
  right: -400px;  /* Hidden position */
}

.help-panel.open {
  right: 0;  /* Visible position */
}
```

## Best Practices

### 1. Use Page-Level Help for Overview
- Explain what the page covers
- Provide quick navigation links
- List prerequisites

### 2. Use Section-Level Help for Details
- Explain complex concepts
- Provide examples
- Link to related sections
- Troubleshooting tips

### 3. Keep Help Content Focused
- ✅ Short, scannable content
- ✅ Bullet points and numbered lists
- ✅ Code examples where relevant
- ❌ Avoid long paragraphs
- ❌ Don't duplicate main content

### 4. Use Callouts Effectively
- **Notes** for important information
- **Tips** for helpful suggestions
- **Warnings** for critical information

## Navigation Improvements

The navigation system has been updated:

### Before:
```
[Prev] | [Up] | [Next]
```

### After:
```
← Installation Guide | [Up] | Getting Started →
```

- Shows actual page titles
- Includes arrow indicators
- Better positioned (not hidden by sidebar)
- Improved hover states

## Testing

To test the help panel feature:

1. **Rebuild documentation**:
   ```bash
   make clean && make docs
   ```

2. **Open a page** with help buttons

3. **Test interactions**:
   - Click help button → Panel should slide in
   - Click overlay → Panel should close
   - Press ESC → Panel should close
   - Click X button → Panel should close

4. **Test navigation**:
   - Scroll to bottom of page
   - Verify "Previous" shows actual page title
   - Verify "Next" shows actual page title
   - Verify navigation is not hidden by sidebar

## Example Implementation

See the updated documentation guides for examples of help panels in action. Each guide now includes:
- Page-level help buttons
- Section-specific help
- Improved navigation

---

**Created**: 2025-11-08
**System Version**: 1.1
**New Features**: Help Panels + Navigation Improvements
