# Tutor Skills for Gemini CLI

This repository contains two skills that turn any knowledge source into an **Obsidian StudyVault** and then quiz you on it.

## Available Skills

- **tutor-setup**: Transforms knowledge sources into an Obsidian StudyVault.
- **tutor**: Interactive quiz tutor for Obsidian StudyVault learning.

## Installation for Gemini CLI

To use these skills in Gemini CLI, you can install them locally or globally.

### Local Installation (Current Workspace)

1. Package the skills:
   ```bash
   node <path-to-skill-creator>/scripts/package_skill.cjs ./skills/tutor-setup
   node <path-to-skill-creator>/scripts/package_skill.cjs ./skills/tutor
   ```
2. Install the `.skill` files:
   ```bash
   gemini skills install ./tutor-setup.skill --scope workspace
   gemini skills install ./tutor.skill --scope workspace
   ```
3. Reload skills in your Gemini CLI session:
   ```
   /skills reload
   ```

### Global Installation

```bash
gemini skills install ./tutor-setup.skill --scope user
gemini skills install ./tutor.skill --scope user
```

## Usage

- `/tutor-setup` — Generate a StudyVault from documents or code
- `/tutor` — Start an interactive quiz session
