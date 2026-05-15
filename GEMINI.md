# Tutor Skills for Gemini CLI

Transform any knowledge source into a **Notion StudyVault** and quiz yourself to discover blind spots.

## Available Skills

- **tutor-setup**: Generates a StudyVault in Notion from documents (PDF, text, web) or source code.
- **tutor**: Interactive quiz session with proficiency tracking and concept-level analysis via Notion API.

## System Requirements

The `tutor-setup` skill requires **poppler** (specifically `pdftotext`) for high-efficiency PDF parsing.

- **Windows**: `choco install poppler`
- **macOS**: `brew install poppler`
- **Linux**: `sudo apt-get install poppler-utils`

## Installation

### Local Installation (Workspace Scope)

```bash
gemini skills install ./skills/tutor-setup --scope workspace --consent
gemini skills install ./skills/tutor --scope workspace --consent
```

### Global Installation (User Scope)

```bash
gemini skills install ./skills/tutor-setup --scope user --consent
gemini skills install ./skills/tutor --scope user --consent
```

## Usage

After installation, reload the skills in your session:
```bash
/skills reload
```

- `/tutor-setup` — Initialize or update your StudyVault.
- `/tutor` — Start an interactive learning session.
