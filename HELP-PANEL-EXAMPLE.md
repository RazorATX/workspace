# Help Panel Feature - Usage Guide

The documentation system now supports **Help/Info panels** that slide in from the right side of the page.

## Features Added

### 1. Help Panel System
- ✅ Slide-in panel from the right side
- ✅ Overlay background when open
- ✅ Close button and ESC key support
- ✅ Responsive design

### 2. AWS-Style Navigation
- ✅ Simple text-based navigation (like AWS documentation)
- ✅ Shows actual page titles dynamically
- ✅ Format: "Next topic: [Page Title]" and "Previous topic: [Page Title]"
- ✅ Properly positioned at bottom of each page
- ✅ Automatically updates if document structure changes

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

## Important: How Help Buttons Work

Help buttons must be added using the `<?dbhtml-include href="filename.html"?>` processing instruction method shown above. The content is embedded in the XSL stylesheet and rendered as proper HTML.

**Note:** You cannot use CDATA sections directly in XML para elements as they will be escaped. Always use external HTML files with the processing instruction method.

### Adding New Help Buttons

To add a help button to a new chapter/section:

1. Add the processing instruction to your XML:
   ```xml
   <?dbhtml-include href="my-help-button.html"?>
   ```

2. Update [custom-docbook.xsl](custom-docbook.xsl) to handle the new file:
   ```xml
   <xsl:when test="$href = 'my-help-button.html'">
     <xsl:text disable-output-escaping="yes"><![CDATA[
     <button class="help-button" onclick="openHelpPanel('My Help', `
       <h4>Your help content here</h4>
       <p>More content...</p>
     `)">Help</button>
     ]]></xsl:text>
   </xsl:when>
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

The navigation system has been updated to AWS documentation style:

### Format:
```
Next topic: Installation and Setup
Previous topic: About This Guide
```

### Features:
- ✅ Simple text-based links (like AWS docs)
- ✅ Shows actual page titles dynamically
- ✅ Automatically updates if document structure/order changes
- ✅ Properly positioned at bottom of each page
- ✅ Clean, minimalist styling
- ✅ No tables or complex layouts

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
   - Verify format: "Next topic: [Page Title]"
   - Verify format: "Previous topic: [Page Title]"
   - Verify navigation is positioned below content (not on right side)

## Example Implementation

See the updated documentation guides for examples of help panels in action. Each guide now includes:
- Page-level help buttons
- Section-specific help
- Improved navigation

---

**Created**: 2025-11-08
**System Version**: 1.1
**New Features**: Help Panels + Navigation Improvements
