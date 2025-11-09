# XML Documentation Build System - Context & Guide

This document explains the complete XML documentation system we built, how it works, and how to reproduce it for new projects.

## Overview

We created an AWS-style documentation portal with:
- **Landing page** with cards linking to multiple guides
- **Multi-page guides** with persistent left sidebar navigation
- **AWS-style navigation** - "Next topic:" and "Previous topic:" links at page bottom
- **Help panel system** - Slide-in panels from the right for contextual help
- **DocBook XML** as the source format
- **Make-based build system** integrated with VS Code tasks
- **Professional styling** with dark sidebar theme

## System Architecture

### Components

1. **DocBook XML Files** (`.xml`) - Source documentation in DocBook format
2. **Custom XSL Stylesheet** (`custom-docbook.xsl`) - Transforms XML to HTML with sidebar
3. **CSS Stylesheets**:
   - `docs-style.css` - Styles for individual guide pages
   - `landing-style.css` - Styles for the landing page
4. **Makefile** - Build automation
5. **Landing Page** (`landing-page.html`) - Portal homepage
6. **VS Code Tasks** (`.vscode/tasks.json`) - IDE integration

### Build Flow

```
XML Files → XSL Transform → HTML Pages → Copy CSS → Complete Site
                ↓
         custom-docbook.xsl
         (adds sidebar to every page)
```

## Prerequisites

### Required Software

Install on macOS using Homebrew:

```bash
brew install xmlto docbook-xsl
```

Or use the Makefile:

```bash
make install
```

### File Structure

Your project needs these files in the workspace root:

```
workspace/
├── Makefile                    # Build system
├── custom-docbook.xsl          # XSL transformation template
├── docs-style.css              # Guide page styling
├── landing-page.html           # Landing page template
├── landing-style.css           # Landing page styling
├── your-guide.xml              # Your XML documentation
├── .vscode/
│   └── tasks.json             # VS Code build tasks
└── build/                      # Generated output (ignored by git)
```

## Quick Start - Creating a New Guide

### Step 1: Copy the Template

Copy the template to your workspace:

```bash
cp context/xml/template-guide.xml my-new-guide.xml
```

### Step 2: Customize the Guide

Edit `my-new-guide.xml`:

1. Update `<bookinfo>` section:
   - Change `<title>` and `<subtitle>`
   - Update author information
   - Set the `id` attribute on the `<book>` tag (use lowercase-with-hyphens)

2. Add your content:
   - Edit chapters and sections
   - Add code examples, tables, lists, etc.
   - See template comments for all available elements

### Step 3: Build the Guide

Build a single guide with sidebar:

```bash
make site FILE=my-new-guide.xml
```

Output will be in `build/my-new-guide/index.html`

### Step 4: View the Guide

```bash
open build/my-new-guide/index.html
```

## Creating a Complete Documentation Portal

### Step 1: Create Multiple Guides

Create separate XML files for each guide:

```bash
getting-started-guide.xml
user-guide.xml
api-reference.xml
admin-guide.xml
```

### Step 2: Update the Makefile

Edit the `make docs` target in the Makefile to include your guides:

```makefile
.PHONY: docs
docs:
	@echo "Building complete documentation portal..."
	@mkdir -p $(OUT_DIR)

	# Build Guide 1
	@echo "Building Getting Started Guide..."
	@mkdir -p $(OUT_DIR)/getting-started-guide
	@xsltproc --nonet \
		--stringparam base.dir $(OUT_DIR)/getting-started-guide/ \
		custom-docbook.xsl getting-started-guide.xml 2>/dev/null && \
	cp docs-style.css $(OUT_DIR)/getting-started-guide/
	@echo "✓ Getting Started Guide built"

	# Add more guides here following the same pattern...

	# Copy landing page
	@echo "Copying landing page..."
	@cp landing-page.html $(OUT_DIR)/index.html
	@cp landing-style.css $(OUT_DIR)/
	@echo "✓ Landing page copied"
	@echo "✅ Documentation portal built successfully!"
	@echo "Open: $(OUT_DIR)/index.html"
```

### Step 3: Update the Landing Page

Edit `landing-page.html` to add cards for your guides:

```html
<div class="guide-card">
    <div class="guide-icon">🚀</div>
    <h3>Your Guide Title</h3>
    <p>Description of your guide.</p>
    <div class="guide-meta">
        <span class="badge badge-beginner">Beginner</span>
        <span class="time">~10 min read</span>
    </div>
    <a href="your-guide/index.html" class="guide-link">
        Read the guide →
    </a>
</div>
```

Badge styles available:
- `badge-beginner` (green)
- `badge-intermediate` (blue)
- `badge-advanced` (orange)

### Step 4: Build the Complete Portal

```bash
make docs
```

This builds all guides and the landing page.

### Step 5: View the Portal

```bash
open build/index.html
```

## DocBook XML Cheat Sheet

### Document Structure

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN"
"http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd">
<book id="unique-id">
  <bookinfo>
    <title>Book Title</title>
    <subtitle>Subtitle</subtitle>
  </bookinfo>

  <preface id="intro">...</preface>
  <chapter id="ch1">...</chapter>
  <chapter id="ch2">...</chapter>
  <appendix id="ref">...</appendix>
  <index id="idx">...</index>
</book>
```

### Common Elements

#### Paragraphs
```xml
<para>Your paragraph text here.</para>
```

#### Sections and Subsections
```xml
<section id="section-id">
  <title>Section Title</title>
  <para>Content...</para>

  <section id="subsection-id">
    <title>Subsection Title</title>
    <para>Nested content...</para>
  </section>
</section>
```

#### Bullet Lists
```xml
<itemizedlist>
  <listitem><para>Item one</para></listitem>
  <listitem><para>Item two</para></listitem>
</itemizedlist>
```

#### Numbered Lists
```xml
<orderedlist>
  <listitem><para>Step one</para></listitem>
  <listitem><para>Step two</para></listitem>
</orderedlist>
```

#### Code Blocks
```xml
<programlisting><![CDATA[
code here
can span multiple lines
special characters don't need escaping
]]></programlisting>
```

#### Inline Code
```xml
<para>Use the <code>function()</code> method.</para>
<para>Run the <command>make build</command> command.</para>
<para>The file is located at <literal>/path/to/file</literal>.</para>
```

#### Tables
```xml
<table>
  <title>Table Title</title>
  <tgroup cols="3">
    <thead>
      <row>
        <entry>Header 1</entry>
        <entry>Header 2</entry>
        <entry>Header 3</entry>
      </row>
    </thead>
    <tbody>
      <row>
        <entry>Data 1</entry>
        <entry>Data 2</entry>
        <entry>Data 3</entry>
      </row>
    </tbody>
  </tgroup>
</table>
```

#### Callouts (Notes, Warnings, Tips)
```xml
<note>
  <para>This is a note.</para>
</note>

<warning>
  <para>This is a warning.</para>
</warning>

<tip>
  <para>This is a tip.</para>
</tip>

<important>
  <para>This is important information.</para>
</important>
```

#### Links
```xml
<!-- External link -->
<ulink url="https://example.com">Link Text</ulink>

<!-- Internal cross-reference -->
<xref linkend="section-id"/>
```

#### Text Formatting
```xml
<emphasis role="bold">Bold text</emphasis>
<emphasis>Italic text</emphasis>
```

#### Variable Lists (Definition Lists)
```xml
<variablelist>
  <varlistentry>
    <term>Term</term>
    <listitem><para>Definition</para></listitem>
  </varlistentry>
</variablelist>
```

## Build Commands Reference

### Basic Commands

```bash
# Build a single guide with sidebar
make site FILE=guide-name.xml

# Build complete portal (all guides + landing page)
make docs

# Build single-page HTML (no sidebar)
make build FILE=guide-name.xml

# Clean build directory
make clean

# Clean and rebuild
make rebuild

# Install required tools
make install

# Show help
make help
```

### VS Code Integration

Available tasks in VS Code (Cmd+Shift+P → "Tasks: Run Task"):

1. **Build Complete Documentation Portal** - Builds everything (`make docs`)
2. **Build User Guide Site** - Builds user-guide.xml with sidebar
3. **Build Documentation Site (with Sidebar)** - Prompts for filename
4. **Build Specific XML File** - Prompts for filename (single page)
5. **Clean Build** - Removes build directory

Or press `Cmd+Shift+B` for the default build task.

## Customization

### Changing Sidebar Colors

Edit `docs-style.css`:

```css
.sidebar {
    background: #232f3e;  /* Dark blue-gray */
}

.sidebar .toc a:hover {
    border-left-color: #ff9900;  /* Orange accent */
}
```

### Changing Landing Page Theme

Edit `landing-style.css`:

```css
.header {
    background: linear-gradient(135deg, #232f3e 0%, #1a252f 100%);
}
```

### Modifying Sidebar Structure

Edit `custom-docbook.xsl` to change what appears in the sidebar. Current setup shows:
- Preface
- All chapters with their top-level sections
- Appendices
- Index

### Adding More Guide Cards

Edit `landing-page.html` and duplicate the `.guide-card` div:

```html
<div class="guide-card">
    <div class="guide-icon">📘</div>
    <h3>New Guide Title</h3>
    <p>Guide description.</p>
    <div class="guide-meta">
        <span class="badge badge-intermediate">Intermediate</span>
        <span class="time">~30 min read</span>
    </div>
    <a href="new-guide/index.html" class="guide-link">
        Read the guide →
    </a>
</div>
```

## Troubleshooting

### Build Fails with "cannot parse custom-docbook.xsl"

**Issue**: XSL syntax error
**Fix**: Ensure `custom-docbook.xsl` is properly formatted. Check that all `<xsl:template>` tags are closed.

### DTD Loading Warnings

**Issue**: `I/O error: Attempt to load network entity`
**Fix**: This is a harmless warning. The `--nonet` flag prevents network access but warnings still appear. The build will succeed.

### Sidebar Not Showing

**Issue**: Sidebar doesn't appear in generated HTML
**Fix**:
1. Verify `custom-docbook.xsl` is being used (not the default DocBook XSL)
2. Check that `docs-style.css` was copied to the output directory
3. Ensure you're using `make site` not `make build`

### Broken Links on Landing Page

**Issue**: Guide cards link to non-existent pages
**Fix**: Ensure guide folder names in `landing-page.html` match the output directory names from your Makefile

### Missing Sections in Sidebar

**Issue**: Some sections don't appear in sidebar navigation
**Fix**:
1. Check that sections have an `id` attribute
2. Verify `chunk.section.depth` in `custom-docbook.xsl` (default is 2)
3. Deeply nested sections (>2 levels) won't appear unless you increase this value

## Best Practices

### ID Naming Convention

Use lowercase with hyphens for all IDs:
```xml
<book id="user-guide">
<chapter id="getting-started">
<section id="first-steps">
```

### Content Organization

- **Preface**: Introduction, scope, audience
- **Chapters**: Main content, organized by topic
- **Sections**: Subtopics within chapters (2-3 levels deep)
- **Appendix**: Reference material, glossaries, resources

### Writing Tips

1. **Keep sections focused** - One main topic per section
2. **Use descriptive titles** - Clear, scannable section names
3. **Add examples** - Code samples, tables, procedures
4. **Cross-reference** - Link related sections together
5. **Use callouts** - Highlight important information with notes/warnings

### File Naming

- Use descriptive names: `admin-guide.xml` not `guide2.xml`
- Match guide ID to filename: `<book id="admin-guide">` → `admin-guide.xml`
- Keep names short for clean URLs

## Advanced Features

### AWS-Style Navigation

The system includes automatic page-to-page navigation at the bottom of each page:

- **Format**: "Next topic: [Page Title]" and "Previous topic: [Page Title]"
- **Dynamic**: Automatically shows actual page titles using XSLT
- **Contextual**: Updates automatically if you reorganize document structure
- **Implementation**: Custom `footer.navigation` template in [custom-docbook.xsl](../../custom-docbook.xsl)

The navigation is positioned at the bottom of each page with proper spacing from the sidebar.

### Help Panel System

Slide-in contextual help panels from the right side of the page:

**Adding Help Buttons:**

1. Add processing instruction in your XML:
   ```xml
   <chapter id="my-chapter">
     <title>My Chapter</title>
     <?dbhtml-include href="my-help.html"?>
     <para>Content...</para>
   </chapter>
   ```

2. Add handler in [custom-docbook.xsl](../../custom-docbook.xsl):
   ```xml
   <xsl:when test="$href = 'my-help.html'">
     <xsl:text disable-output-escaping="yes"><![CDATA[
     <button class="help-button" onclick="openHelpPanel('Help Title', `
       <h4>Help Content</h4>
       <p>Your help text here...</p>
     `)">Help</button>
     ]]></xsl:text>
   </xsl:when>
   ```

**Features:**
- Slides in from right side
- Overlay background dims page
- Close with button, overlay click, or ESC key
- Supports HTML content (headings, lists, links, etc.)
- Responsive design

See [HELP-PANEL-EXAMPLE.md](../../HELP-PANEL-EXAMPLE.md) for complete usage guide.

## Production Deployment

### Static Hosting

The `build/` directory is a complete static website. Deploy to:

- **GitHub Pages**: Push build folder to gh-pages branch
- **Netlify**: Deploy build folder
- **AWS S3**: Upload build folder to S3 bucket
- **Any web server**: Serve build folder contents

### Build Automation

Add to CI/CD pipeline:

```yaml
# .github/workflows/docs.yml
name: Build Documentation

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Install dependencies
        run: |
          sudo apt-get update
          sudo apt-get install -y xsltproc docbook-xsl

      - name: Build docs
        run: make docs

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build
```

## Extending the System

### Adding Search Functionality

Consider adding [Lunr.js](https://lunrjs.com/) or [Algolia DocSearch](https://docsearch.algolia.com/) for search.

### Version Management

Create separate folders for different versions:

```
build/
├── v1.0/
├── v2.0/
└── latest/ → v2.0
```

### PDF Generation

Add PDF output using Apache FOP:

```bash
# Install FOP
brew install fop

# Add to Makefile
pdf:
	xsltproc --nonet \
		$(DOCBOOK_XSL)/fo/docbook.xsl \
		user-guide.xml > user-guide.fo
	fop user-guide.fo user-guide.pdf
```

## Summary

You now have a complete, reproducible documentation system:

1. ✅ Professional AWS-style documentation portal
2. ✅ Template-based workflow for new guides
3. ✅ Automated build system
4. ✅ VS Code integration
5. ✅ Easy deployment to static hosting

To create new documentation:
1. Copy `template-guide.xml`
2. Edit content
3. Add to Makefile `docs` target
4. Update landing page
5. Run `make docs`

Questions? Refer to this guide or check the template comments in `template-guide.xml`.
