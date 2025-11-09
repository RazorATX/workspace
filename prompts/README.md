# AI Assistant Prompts

This folder contains structured prompts for AI assistants (like Claude Code) to help with common workflows and tasks in this workspace.

## Purpose

These prompts provide:
- Clear instructions for AI assistants
- Reference to context documentation
- Interactive workflows with user input
- Consistent, reproducible results

## Available Prompts

### 📚 Documentation Workflows

| Prompt | Purpose | Context Reference |
|--------|---------|-------------------|
| [create-documentation-portal.md](create-documentation-portal.md) | Create a new AWS-style documentation portal | `context/xml/` |

## How to Use These Prompts

### Method 1: Direct Copy-Paste (Recommended)

1. Open the prompt file (e.g., `create-documentation-portal.md`)
2. Copy the entire content
3. Paste into your AI assistant chat
4. Answer the questions the AI asks
5. Let the AI implement the solution

### Method 2: Reference in Conversation

Simply tell your AI assistant:

```
Please follow the instructions in prompts/create-documentation-portal.md
to help me create a new documentation portal
```

### Method 3: Custom Modification

1. Copy the prompt to a new file
2. Modify questions or requirements
3. Use the customized version with your AI assistant

## Prompt Structure

Each prompt includes:

1. **Purpose** - What the prompt helps you accomplish
2. **Context Reference** - Links to relevant documentation
3. **Interactive Questions** - What the AI should ask you
4. **Implementation Tasks** - Steps the AI should follow
5. **Success Criteria** - How to verify completion
6. **Example Usage** - Sample conversation flow

## Creating New Prompts

When you develop a new workflow, create a prompt by:

1. **Create the file**: `prompts/your-workflow-name.md`
2. **Include these sections**:
   - Purpose and overview
   - Context documentation references
   - Interactive questions to gather requirements
   - Step-by-step implementation instructions
   - Expected output structure
   - Success criteria
   - Example usage
3. **Test it**: Have an AI assistant follow the prompt
4. **Update this README**: Add entry to the table above

### Prompt Template

```markdown
# [Workflow Name] - AI Assistant Prompt

**Purpose**: [One sentence description]

**Context Reference**: [Link to relevant context docs]

---

## Instructions for AI Assistant

[Clear, step-by-step instructions...]

### Step 1: Gather Requirements
[Questions to ask the user...]

### Step 2: Reference Documentation
[Context files to review...]

### Step 3: Implementation Tasks
[Specific tasks to complete...]

### Step 4: Verification
[How to verify success...]

---

## Example Usage
[Sample conversation...]

---

## Success Criteria
✅ [Checklist of outcomes...]
```

## Benefits of Using Prompts

✅ **Consistency** - Same high-quality results every time
✅ **Documentation** - Built-in reference to context docs
✅ **Efficiency** - No need to re-explain complex workflows
✅ **Sharing** - Team members can use the same prompts
✅ **Version Control** - Prompts evolve with your workflows

## Best Practices

### For Prompt Users

- Read the entire prompt before starting
- Have required information ready (names, configurations, etc.)
- Review context documentation referenced in the prompt
- Verify success criteria after AI completes tasks

### For Prompt Authors

- Make prompts conversational and interactive
- Always reference context documentation
- Include concrete examples
- Provide clear success criteria
- Test prompts with AI assistants before committing

## Relationship to Context Folder

```
workspace/
├── context/           # Templates and documentation
│   └── xml/          # XML documentation system
│       ├── template-guide.xml
│       └── xml-context.md
└── prompts/          # AI assistant instructions
    └── create-documentation-portal.md  # References context/xml/
```

- **Context**: WHAT to do (templates, documentation, examples)
- **Prompts**: HOW to do it (AI instructions, interactive workflows)

Think of it this way:
- Context = Reference manual
- Prompts = Interactive guided tutorial

## Contributing

When you discover a repeatable workflow:

1. Document it as a prompt
2. Reference relevant context documentation
3. Test with an AI assistant
4. Commit to this folder
5. Update this README

## Examples of Future Prompts

Ideas for additional prompts:

- `setup-new-project.md` - Initialize a new project structure
- `add-new-guide.md` - Add a single guide to existing portal
- `customize-theme.md` - Modify colors and styling
- `deploy-to-github-pages.md` - Deploy documentation to hosting

---

**Last Updated**: 2025-11-08
**Maintained By**: Your Team
