# XML Documentation System - Files Overview

Quick reference for all files in the XML documentation system.

## Template Files (in context/xml/)

| File | Purpose | When to Use |
|------|---------|-------------|
| `template-guide.xml` | DocBook XML template with examples | Copy this when creating a new guide |
| `xml-context.md` | Complete documentation of the system | Read for full understanding and troubleshooting |
| `QUICK-START.md` | 5-minute quick start guide | Start here if you're in a hurry |
| `FILES-OVERVIEW.md` | This file - quick file reference | Quick lookup of file purposes |

## System Files (in workspace root)

| File | Purpose | Modify? |
|------|---------|---------|
| `Makefile` | Build automation | ✅ Yes - to add new guides to `make docs` |
| `custom-docbook.xsl` | XSL transformation with sidebar | ⚠️ Rarely - only for sidebar customization |
| `docs-style.css` | Guide page styling | ✅ Yes - to customize colors/fonts |
| `landing-page.html` | Portal homepage | ✅ Yes - to add/remove guide cards |
| `landing-style.css` | Landing page styling | ✅ Yes - to customize landing page |

## Generated Files (in build/)

| Location | Contains |
|----------|----------|
| `build/index.html` | Landing page (copy of landing-page.html) |
| `build/landing-style.css` | Landing styles |
| `build/your-guide/` | Generated guide with sidebar |
| `build/your-guide/index.html` | Guide homepage |
| `build/your-guide/docs-style.css` | Guide styles |
| `build/your-guide/*.html` | Individual chapter/section pages |

## VS Code Configuration

| File | Purpose |
|------|---------|
| `.vscode/tasks.json` | Build tasks for VS Code |

## Workflow: Creating a New Guide

1. **Copy** `context/xml/template-guide.xml` → `my-guide.xml`
2. **Edit** `my-guide.xml` content
3. **Build** `make site FILE=my-guide.xml`
4. **View** `build/my-guide/index.html`

## Workflow: Adding to Portal

1. Create guide XML file
2. **Edit** `Makefile` → add guide to `make docs` target
3. **Edit** `landing-page.html` → add guide card
4. **Build** `make docs`
5. **View** `build/index.html`

## File Dependencies

```
template-guide.xml (your copy)
    ↓
make site (build command)
    ↓
uses: custom-docbook.xsl
    ↓
generates: HTML files
    ↓
copies: docs-style.css
    ↓
result: build/your-guide/
```

## Don't Modify These Files

Unless you know what you're doing:
- `custom-docbook.xsl` - XSL transformation logic
- Template files in `context/` - These are reference copies

## Safe to Modify

- Your own `.xml` guide files
- `landing-page.html` - Add guide cards
- `*.css` files - Customize styling
- `Makefile` - Add new guides to build

## Quick Reference: File Extensions

- `.xml` - DocBook source files (your content)
- `.xsl` - XSL transformation templates (how XML becomes HTML)
- `.css` - Stylesheets (how pages look)
- `.html` - Generated output or templates
- `.md` - Documentation (Markdown)

## Getting Help

- Quick start: `QUICK-START.md`
- Full docs: `xml-context.md`
- Template: `template-guide.xml`
- This file: Quick file reference
