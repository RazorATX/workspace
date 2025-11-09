# Add Single Guide to Existing Portal - AI Assistant Prompt

**Purpose**: Add a new documentation guide to an existing portal without rebuilding everything

**Context Reference**: `context/xml/xml-context.md` - Section: "Creating a Complete Documentation Portal"

---

## Instructions for AI Assistant

I want to add a new documentation guide to my existing documentation portal. Please help me by asking these questions and implementing the solution:

### Step 1: Gather Information

Ask me:

1. **Guide name** (lowercase-with-hyphens):
   - Example: "admin-guide", "developer-guide", "troubleshooting"

2. **Guide title**:
   - Example: "Administrator Guide", "Developer Guide"

3. **Guide subtitle**:
   - Example: "Complete admin configuration", "API and SDK documentation"

4. **Difficulty level**: beginner, intermediate, or advanced

5. **Estimated reading time**:
   - Example: "~15 min read", "~60 min read", "Reference"

6. **Icon emoji** for the landing page card:
   - Example: 🔧, 👨‍💻, 🐛, 📊, 🔐

7. **Brief description** (1-2 sentences for landing page card)

### Step 2: Implementation

Once you have the information:

#### 2.1 Create the Guide XML File

```bash
# Copy the template
cp context/xml/template-guide.xml [guide-name].xml
```

Edit the new file:
- Update `<book id="[guide-name]">`
- Update `<title>`, `<subtitle>` in `<bookinfo>`
- Customize placeholder content or leave template structure

#### 2.2 Update the Makefile

Add to the `make docs` target (before "Copying landing page..."):

```makefile
@echo "Building [Guide Title]..."
@mkdir -p $(OUT_DIR)/[guide-name]
@xsltproc --nonet \
    --stringparam base.dir $(OUT_DIR)/[guide-name]/ \
    custom-docbook.xsl [guide-name].xml 2>/dev/null && \
cp docs-style.css $(OUT_DIR)/[guide-name]/
@echo "✓ [Guide Title] built"
```

#### 2.3 Update the Landing Page

Add a new guide card to `landing-page.html` in the `<div class="guide-grid">` section:

```html
<div class="guide-card">
    <div class="guide-icon">[emoji]</div>
    <h3>[Guide Title]</h3>
    <p>[Description]</p>
    <div class="guide-meta">
        <span class="badge badge-[level]">[Level]</span>
        <span class="time">[Reading Time]</span>
    </div>
    <a href="[guide-name]/index.html" class="guide-link">
        Read the guide →
    </a>
</div>
```

Badge classes:
- `badge-beginner` - Green
- `badge-intermediate` - Blue
- `badge-advanced` - Orange

#### 2.4 Add VS Code Task (Optional)

Add to `.vscode/tasks.json`:

```json
{
    "label": "Build [Guide Title]",
    "type": "shell",
    "command": "make site FILE=[guide-name].xml",
    "group": "build",
    "presentation": {
        "reveal": "always",
        "panel": "shared"
    },
    "problemMatcher": []
}
```

### Step 3: Test the Build

```bash
# Build just the new guide
make site FILE=[guide-name].xml

# Or build the complete portal
make docs

# Open to verify
open build/[guide-name]/index.html
open build/index.html
```

### Step 4: Provide Summary

After implementation, provide:

1. **Files created/modified**:
   - Created: `[guide-name].xml`
   - Modified: `landing-page.html`
   - Modified: `Makefile`
   - Modified (optional): `.vscode/tasks.json`

2. **Build commands**:
   ```bash
   # Build just this guide
   make site FILE=[guide-name].xml

   # Build complete portal
   make docs
   ```

3. **Next steps**:
   - Edit `[guide-name].xml` to add content
   - Reference `context/xml/QUICK-START.md` for common elements
   - See `context/xml/template-guide.xml` for examples

### Important Notes

- Ensure the guide `id` attribute matches the filename
- Place the new guide card in a logical order on landing page
- Test that the landing page link works correctly
- Verify sidebar navigation appears in the guide

---

## Quick Example

**User**: I want to add a troubleshooting guide

**AI**: Great! I'll help you add a troubleshooting guide. Let me gather some information:

1. What should the guide name be? (lowercase-with-hyphens)

**User**: troubleshooting-guide

**AI**: 2. What's the guide title?

**User**: Troubleshooting Guide

[Continue with remaining questions...]

---

## Success Criteria

✅ New XML file created from template
✅ Makefile updated with new build target
✅ Landing page has new guide card
✅ `make docs` builds successfully
✅ Guide appears on landing page with working link
✅ Guide has sidebar navigation
✅ VS Code task added (if requested)

---

## Context Files Reference

- 📝 `context/xml/template-guide.xml` - Copy this
- 📚 `context/xml/xml-context.md` - Full documentation
- 🚀 `context/xml/QUICK-START.md` - Element reference

---

**Last Updated**: 2025-11-08
**System Version**: 1.0
