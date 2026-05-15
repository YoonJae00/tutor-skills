---
name: tutor-setup
description: Transforms knowledge sources (PDF, text, web, code) into a Notion StudyVault. Use when the user wants to set up a new StudyVault, convert documents to notes, or says "/tutor-setup", "setup vault", "vault 생성".
---

# Tutor Setup — Knowledge to Notion StudyVault

## CWD Boundary Rule
**NEVER access files outside the current working directory (CWD).** All source scanning and reading MUST stay within CWD and its subdirectories.

## Workflow

### Phase 1: Mode Detection
1. Check for project markers (e.g., `package.json`, `Cargo.toml`, `go.mod`, `pyproject.toml`) in CWD.
2. If markers found → **Codebase Mode**; otherwise → **Document Mode**.
3. Announce detected mode and ask for user confirmation.

### Phase 2: Source Discovery & Extraction (Document Mode)
1. Scan CWD for `*.pdf`, `*.txt`, `*.md`, `*.html` (exclude build artifacts and `.git`).
2. **PDF Extraction (MANDATORY)**:
   - Use `pdftotext` CLI ONLY. Run via `run_shell_command`.
   - **Windows**: `pdftotext "source.pdf" "$env:TEMP\source.txt"`
   - **macOS/Linux**: `pdftotext "source.pdf" "/tmp/source.txt"`
   - If `pdftotext` is missing, instruct the user to install `poppler` according to their OS:
     - **Windows**: `choco install poppler`
     - **macOS**: `brew install poppler`
     - **Linux**: `sudo apt-get install poppler-utils`
3. Read the extracted `.txt` files to understand scope and structure.

### Phase 3: Content Analysis
1. Map topic hierarchy and identify key concepts vs. practice questions.
2. Verify source-to-concept mapping.

### Phase 4: Notion Vault Construction
1. **Create Parent Page**: Use `notion-create-pages` to create a parent page named "StudyVault - {Subject}".
2. **Create Concepts Database**: Use `notion-create-database` as a child of the parent page. 
   - Name: "Concepts"
   - Properties: Area (select), Importance (select), Status (select), Attempts (number), Correct (number), Error Notes (rich_text).
3. **Populate Concepts**: Use `notion-create-pages` to add rows to the "Concepts" database. Use templates in `references/templates.md` for page content (Concept Notes and Practice Questions).

### Phase 5: Codebase Onboarding (Codebase Mode)
1. Map directory layout and identify tech stack.
2. Follow detailed workflow in `references/codebase-workflow.md`, adapting the output to the Notion Concepts Database.

## Quality Standards
- Match source material language for content; use English for property names.
- Use ASCII diagrams for flows and processes within Notion page blocks.
- Verify against `references/quality-checklist.md` before completion.
