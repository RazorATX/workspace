# XML Documentation - Quick Start Guide

**Goal**: Create a new documentation guide in 5 minutes.

## Prerequisites ✅

```bash
# Check if tools are installed
which xsltproc  # Should return a path
which xmlto     # Should return a path

# If not installed:
make install
```

## Create a New Guide (3 Steps)

### 1. Copy Template

```bash
cp context/xml/template-guide.xml your-guide-name.xml
```

### 2. Edit the Guide

Open `your-guide-name.xml` and update:

```xml
<book id="your-guide-name">  <!-- Change this ID -->
  <bookinfo>
    <title>Your Guide Title</title>        <!-- Change title -->
    <subtitle>Your Subtitle</subtitle>     <!-- Change subtitle -->
    ...
  </bookinfo>
```

Then add your content in the chapters.

### 3. Build & View

```bash
# Build
make site FILE=your-guide-name.xml

# View
open build/your-guide-name/index.html
```

Done! 🎉

## VS Code Method

1. Press `Cmd+Shift+P`
2. Type "Tasks: Run Task"
3. Select "Build Documentation Site (with Sidebar)"
4. Enter your filename when prompted

## Common Elements Cheatsheet

```xml
<!-- Paragraph -->
<para>Text here</para>

<!-- Bullet list -->
<itemizedlist>
  <listitem><para>Item</para></listitem>
</itemizedlist>

<!-- Numbered list -->
<orderedlist>
  <listitem><para>Step</para></listitem>
</orderedlist>

<!-- Code block -->
<programlisting><![CDATA[
code here
]]></programlisting>

<!-- Inline code -->
<code>code</code>

<!-- Note -->
<note>
  <para>Important info</para>
</note>

<!-- Table -->
<table>
  <title>Table Title</title>
  <tgroup cols="2">
    <thead>
      <row>
        <entry>Col 1</entry>
        <entry>Col 2</entry>
      </row>
    </thead>
    <tbody>
      <row>
        <entry>Data 1</entry>
        <entry>Data 2</entry>
      </row>
    </tbody>
  </tgroup>
</table>
```

## Build Complete Portal

If you have multiple guides and want to build a landing page:

1. Create multiple XML files
2. Edit `Makefile` → `make docs` target
3. Edit `landing-page.html` to add guide cards
4. Run: `make docs`
5. Open: `build/index.html`

## Need More Help?

📖 Full documentation: [xml-context.md](xml-context.md)

🎯 Template with examples: [template-guide.xml](template-guide.xml)

## Troubleshooting

**Build fails?**
- Check XML is valid (all tags closed)
- Ensure `id` attributes are unique
- Verify required files exist: `custom-docbook.xsl`, `docs-style.css`

**Sidebar not showing?**
- Use `make site` not `make build`
- Check `docs-style.css` was copied to output folder

**DTD warnings?**
- Safe to ignore - build will still succeed
