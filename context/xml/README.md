# XML Documentation System

**Professional AWS-style documentation portal with sidebar navigation**

## What You Get

✅ Multi-page documentation with persistent left sidebar  
✅ Landing page linking to multiple guides  
✅ Professional dark theme styling  
✅ Make-based build system  
✅ VS Code integration  
✅ Complete templates and documentation  

## Quick Links

📖 **[INDEX.md](INDEX.md)** - Start here! Complete navigation guide  
🚀 **[QUICK-START.md](QUICK-START.md)** - 5-minute tutorial  
📚 **[xml-context.md](xml-context.md)** - Full documentation  
📁 **[FILES-OVERVIEW.md](FILES-OVERVIEW.md)** - File reference  
📝 **[template-guide.xml](template-guide.xml)** - DocBook template  

## Quick Start

```bash
# 1. Copy template
cp context/xml/template-guide.xml my-guide.xml

# 2. Edit content
# Edit my-guide.xml with your documentation

# 3. Build
make site FILE=my-guide.xml

# 4. View
open build/my-guide/index.html
```

That's it! You now have a professional documentation guide with sidebar navigation.

## Features

- **Sidebar Navigation**: Sticky left sidebar with dark theme
- **Multi-page**: Each chapter/section gets its own page
- **Responsive**: Works on desktop and mobile
- **Professional**: AWS-inspired design
- **Easy to Use**: Template-based workflow

## System Requirements

- macOS or Linux
- xsltproc (install: `brew install docbook-xsl`)
- xmlto (install: `brew install xmlto`)

Or just run: `make install`

## Documentation

All documentation is in this folder:

| Document | Purpose |
|----------|---------|
| [INDEX.md](INDEX.md) | Navigation hub - start here |
| [QUICK-START.md](QUICK-START.md) | Fast 5-minute tutorial |
| [xml-context.md](xml-context.md) | Complete reference guide |
| [FILES-OVERVIEW.md](FILES-OVERVIEW.md) | File purpose reference |

## Example Output

The system generates:
- Landing page with guide cards (like AWS docs)
- Individual guides with sidebar navigation
- Professional styling
- Cross-linking between pages

See `build/` folder after running `make docs`

## Support

Need help? Check the documentation:

1. **Quick question?** → [QUICK-START.md](QUICK-START.md) → Troubleshooting
2. **Detailed issue?** → [xml-context.md](xml-context.md) → Troubleshooting
3. **File question?** → [FILES-OVERVIEW.md](FILES-OVERVIEW.md)

## License

Templates and documentation provided as-is for your use.

---

**Ready to start?** → [INDEX.md](INDEX.md)
