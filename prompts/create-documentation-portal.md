# Create Documentation Portal - AI Assistant Prompt

**Purpose**: Guide an AI assistant to create a complete AWS-style documentation portal using the XML documentation system templates.

**Context Reference**: `context/xml/INDEX.md` - Complete documentation of the XML system

---

## Instructions for AI Assistant

I want to create a new documentation portal using the XML documentation system. Please help me set it up by asking me the following questions and then implementing the solution:

### Step 1: Gather Requirements

Ask me these questions one at a time:

1. **Landing Page Title**: What should the main title of the documentation portal be?
   - Example: "Product Documentation", "Developer Guides", "API Documentation Hub"

2. **Landing Page Subtitle**: What subtitle or tagline should appear on the landing page?
   - Example: "Everything you need to get started and succeed"

3. **Number of Guides**: How many documentation guides do you want to create?
   - Suggest: 2-5 guides is typical

4. **For each guide**, ask:
   - Guide name (lowercase-with-hyphens, e.g., "getting-started")
   - Guide title (e.g., "Getting Started Guide")
   - Guide subtitle (e.g., "Quick start for new users")
   - Difficulty level: beginner, intermediate, or advanced
   - Estimated reading time (e.g., "~10 min read", "~45 min read", "Reference")
   - Icon emoji (e.g., 🚀, 📖, ⚙️, 🎯, 📚)

5. **Company Information**:
   - Company/Product name for copyright and branding
   - Support email (optional)
   - Community forum URL (optional)

### Step 2: Reference the Context Documentation

Before implementing, please review:
- `context/xml/template-guide.xml` - Template structure
- `context/xml/xml-context.md` - Complete system documentation
- `context/xml/QUICK-START.md` - Quick reference

### Step 3: Implementation Tasks

Once you have the requirements, please:

1. **Create Guide XML Files**
   - Copy `context/xml/template-guide.xml` for each guide
   - Name files according to the guide names (e.g., `getting-started.xml`)
   - Customize the `<bookinfo>` section with the provided details
   - Add placeholder chapters appropriate for each guide type

2. **Update the Landing Page**
   - Edit `landing-page.html`
   - Update the header title and tagline
   - Create guide cards for each guide with:
     - Specified icon emoji
     - Guide title and description
     - Difficulty badge
     - Reading time estimate
     - Correct link to guide folder
   - Update company info and links in footer

3. **Update the Makefile**
   - Edit the `make docs` target
   - Add build commands for each guide following the pattern:
     ```makefile
     @echo "Building [Guide Name]..."
     @mkdir -p $(OUT_DIR)/guide-name
     @xsltproc --nonet \
         --stringparam base.dir $(OUT_DIR)/guide-name/ \
         custom-docbook.xsl guide-name.xml 2>/dev/null && \
     cp docs-style.css $(OUT_DIR)/guide-name/
     @echo "✓ [Guide Name] built"
     ```

4. **Create VS Code Task** (optional but recommended)
   - Add a task to `.vscode/tasks.json` for building the complete portal
   - Task should run `make docs`

5. **Test the Build**
   - Run `make docs`
   - Verify all guides build successfully
   - Check that landing page links work

6. **Provide Summary**
   - List all files created
   - Show the command to build: `make docs`
   - Show the command to view: `open build/index.html`
   - Provide next steps for adding content

### Step 4: Content Guidance

After setup, remind me that I can:
- Edit each XML file to add real content
- Reference `context/xml/template-guide.xml` for DocBook element examples
- See `context/xml/QUICK-START.md` for common elements cheatsheet
- Read `context/xml/xml-context.md` for comprehensive documentation

### Important Notes for AI Assistant

- Always reference the context documentation first
- Use the existing templates as the foundation
- Follow the naming conventions established in the context docs
- Ensure all guide IDs match their filenames (e.g., `<book id="getting-started">` for `getting-started.xml`)
- Test the build before declaring success
- Provide clear next steps for the user

### Expected Output Structure

After completion, the workspace should have:

```
workspace/
├── landing-page.html           # Updated with new guides
├── Makefile                    # Updated with new guide builds
├── [guide-1-name].xml         # First guide
├── [guide-2-name].xml         # Second guide
├── [guide-n-name].xml         # Additional guides
└── build/                      # After running make docs
    ├── index.html             # Landing page
    ├── [guide-1-name]/        # First guide built
    ├── [guide-2-name]/        # Second guide built
    └── [guide-n-name]/        # Additional guides built
```

---

## Example Usage

**User**: I want to create a documentation portal

**AI Assistant**: Great! I'll help you create a documentation portal using our XML documentation system. Let me ask you a few questions:

1. What should the main title of the documentation portal be?

[Continue with interactive questions...]

---

## Context Files Reference

Before starting, AI should review:
- 📖 `context/xml/INDEX.md` - Navigation hub
- 🚀 `context/xml/QUICK-START.md` - Quick tutorial
- 📚 `context/xml/xml-context.md` - Complete reference
- 📝 `context/xml/template-guide.xml` - Template to copy

---

## Success Criteria

✅ All guide XML files created with proper structure
✅ Landing page updated with correct guide cards
✅ Makefile updated to build all guides
✅ `make docs` builds successfully without errors
✅ All links on landing page work correctly
✅ Each guide has sidebar navigation
✅ User provided with clear next steps

---

**Last Updated**: 2025-11-08
**System Version**: 1.0
**Compatible With**: XML Documentation System v1.0
