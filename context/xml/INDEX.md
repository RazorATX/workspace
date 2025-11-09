# XML Documentation System - Documentation Index

**Start here** to navigate the XML documentation system resources.

## 🚀 Getting Started (Pick One)

### I'm in a Hurry (5 minutes)
👉 **[QUICK-START.md](QUICK-START.md)** - Copy template, edit, build, done!

### I Want to Understand the System (30 minutes)
👉 **[xml-context.md](xml-context.md)** - Complete guide with all details

### I Need a Quick File Reference
👉 **[FILES-OVERVIEW.md](FILES-OVERVIEW.md)** - What each file does

## 📦 What's Included

### Documentation Files

| File | Purpose | Read When... |
|------|---------|--------------|
| **INDEX.md** (this file) | Navigation hub | Starting out or lost |
| **QUICK-START.md** | Fast tutorial | You need results now |
| **xml-context.md** | Complete reference | You want to understand everything |
| **FILES-OVERVIEW.md** | File reference | You need to know what a file does |

### Template Files

| File | Purpose | Use When... |
|------|---------|-------------|
| **template-guide.xml** | DocBook template | Creating a new guide |

## 🎯 Common Tasks

### Task 1: Create a Single Guide
1. Copy [template-guide.xml](template-guide.xml) → `my-guide.xml`
2. Edit content
3. Run: `make site FILE=my-guide.xml`
4. Open: `build/my-guide/index.html`

**Details**: [QUICK-START.md](QUICK-START.md)

### Task 2: Create a Complete Portal
1. Create multiple XML guides
2. Edit `Makefile` (add to `make docs`)
3. Edit `landing-page.html` (add guide cards)
4. Run: `make docs`
5. Open: `build/index.html`

**Details**: [xml-context.md](xml-context.md) → "Creating a Complete Documentation Portal"

### Task 3: Customize Styling
- **Guide colors**: Edit `docs-style.css`
- **Landing page**: Edit `landing-style.css`
- **Sidebar structure**: Edit `custom-docbook.xsl`

**Details**: [xml-context.md](xml-context.md) → "Customization"

### Task 4: Add DocBook Elements
- See examples in [template-guide.xml](template-guide.xml)
- Check cheat sheet in [xml-context.md](xml-context.md) → "DocBook XML Cheat Sheet"
- Reference [QUICK-START.md](QUICK-START.md) → "Common Elements Cheatsheet"

## 🔍 Finding Answers

### "How do I...?"

| Question | Answer Location |
|----------|----------------|
| ...create a new guide quickly? | [QUICK-START.md](QUICK-START.md) |
| ...add a table/list/code block? | [QUICK-START.md](QUICK-START.md) → Cheatsheet |
| ...build multiple guides? | [xml-context.md](xml-context.md) → "Complete Portal" |
| ...customize colors? | [xml-context.md](xml-context.md) → "Customization" |
| ...deploy to production? | [xml-context.md](xml-context.md) → "Production Deployment" |
| ...add search functionality? | [xml-context.md](xml-context.md) → "Extending the System" |

### "What is...?"

| Question | Answer Location |
|----------|----------------|
| ...this file for? | [FILES-OVERVIEW.md](FILES-OVERVIEW.md) |
| ...DocBook? | [xml-context.md](xml-context.md) → Overview |
| ...XSL? | [xml-context.md](xml-context.md) → "System Architecture" |

### "Why isn't...?"

| Question | Answer Location |
|----------|----------------|
| ...my build working? | [xml-context.md](xml-context.md) → "Troubleshooting" |
| ...the sidebar showing? | [QUICK-START.md](QUICK-START.md) → "Troubleshooting" |
| ...my guide appearing? | [xml-context.md](xml-context.md) → "Troubleshooting" |

## 📚 Documentation Structure

```
context/xml/
├── INDEX.md                 ← You are here
├── QUICK-START.md          ← Fast tutorial
├── xml-context.md          ← Complete reference
├── FILES-OVERVIEW.md       ← File reference
└── template-guide.xml      ← Template to copy
```

## 🎓 Learning Path

### Beginner
1. Read [QUICK-START.md](QUICK-START.md)
2. Copy and build the template
3. Experiment with adding content

### Intermediate
1. Read [xml-context.md](xml-context.md) → Sections 1-5
2. Create multiple guides
3. Build a complete portal
4. Customize styling

### Advanced
1. Read [xml-context.md](xml-context.md) → Full document
2. Modify XSL transformations
3. Add custom features (search, versioning)
4. Set up CI/CD pipeline

## 🆘 Getting Help

1. **Check this INDEX** for where to look
2. **Search the docs** - All markdown files are searchable
3. **Check troubleshooting** - Common issues in QUICK-START and xml-context
4. **Review the template** - template-guide.xml has inline examples

## 🚀 Next Steps

**New to the system?**
→ Start with [QUICK-START.md](QUICK-START.md)

**Ready to build a portal?**
→ Read [xml-context.md](xml-context.md) → "Creating a Complete Documentation Portal"

**Want to customize?**
→ Read [xml-context.md](xml-context.md) → "Customization"

**Looking for a specific file?**
→ Check [FILES-OVERVIEW.md](FILES-OVERVIEW.md)

---

**Last Updated**: 2025-11-08
**System Version**: 1.0
**Maintained By**: Your Team
