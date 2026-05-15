# Tutor Skills for Gemini CLI

This repository contains two skills that turn any knowledge source into an **Obsidian StudyVault** and then quiz you on it.

## Available Skills

- **tutor-setup**: Transforms knowledge sources into an Obsidian StudyVault.
- **tutor**: Interactive quiz tutor for Obsidian StudyVault learning.

## Installation

Gemini CLI users can install these skills directly from the source directories. No packaging or global scripts are required.

### Local Installation (Current Workspace)

Run these commands in your terminal:

```bash
gemini skills install ./skills/tutor-setup --scope workspace --consent
gemini skills install ./skills/tutor --scope workspace --consent
```

### Global Installation

```bash
gemini skills install ./skills/tutor-setup --scope user --consent
gemini skills install ./skills/tutor --scope user --consent
```

## After Installation

After installing, you must reload the skills in your active Gemini CLI session:

```bash
/skills reload
```

## Usage

- `/tutor-setup` — Generate a StudyVault from documents or code
- `/tutor` — Start an interactive quiz session
