# Context Folder

This folder contains templates, documentation, and reusable components for various workflows and tools used in this workspace.

## Purpose

The context folder serves as a knowledge base and template repository, making it easy to:
- Reproduce successful setups in new projects
- Share working configurations with team members
- Document "how we did it" for future reference
- Maintain consistency across projects

## Structure

```
context/
├── README.md          # This file
└── xml/               # XML documentation system templates
    ├── template-guide.xml      # DocBook XML template
    └── xml-context.md          # Complete documentation system guide
```

## Available Templates

### XML Documentation System

**Location**: `context/xml/`

A complete AWS-style documentation portal system with:
- Multi-page guides with sidebar navigation
- Professional landing page
- Make-based build system
- VS Code integration

**Quick Start**:
```bash
# Copy the template
cp context/xml/template-guide.xml my-new-guide.xml

# Build it
make site FILE=my-new-guide.xml
```

**Full Documentation**: See [xml/xml-context.md](xml/xml-context.md)

## Using Templates

1. **Browse** the relevant subfolder (`xml/`, etc.)
2. **Read** the context markdown file for instructions
3. **Copy** the template to your workspace
4. **Customize** for your specific needs
5. **Build** using the provided commands

## Adding New Templates

When you create a reusable workflow or tool:

1. Create a subfolder: `context/your-template-name/`
2. Add the template files
3. Create a `your-template-name-context.md` with:
   - What problem it solves
   - Prerequisites
   - Step-by-step reproduction guide
   - Customization options
   - Troubleshooting tips
4. Update this README with a link

## Best Practices

- **Document thoroughly** - Future you will thank you
- **Include examples** - Show how it's used
- **Keep it simple** - Templates should be easy to understand
- **Version context docs** - Note tool versions, dependencies
- **Add screenshots** - Visual references help

## Contributing

When you discover a better way or add improvements:
1. Update the relevant context documentation
2. Update templates with improvements
3. Note changes and rationale

---

*This context system helps us work smarter by preserving knowledge and accelerating future projects.*
