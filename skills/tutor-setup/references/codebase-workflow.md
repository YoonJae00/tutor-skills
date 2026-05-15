# Codebase Mode — Onboarding Vault Workflow

> Generates a Notion StudyVault that helps new developers understand and navigate a source code project.
> All scanning and reading MUST stay within CWD.

## Phase C1: Project Exploration

1. **Scan project structure**: `glob` for source files, config files, test files. Build a file tree.
2. **Identify tech stack**: Detect languages, frameworks, build tools, package managers from config files.
3. **Read key files**: README, CONTRIBUTING, entry points (`main.*`, `index.*`, `app.*`), config files.
4. **Map project layout**: Record directory purposes (e.g., `src/`, `test/`, `config/`, `scripts/`).
5. **Present findings** to user for confirmation before proceeding.

## Phase C2: Architecture Analysis

1. **Identify architectural patterns**: layered, hexagonal, microservice, monolith, serverless, etc.
2. **Map module boundaries**: Which directories/packages form distinct modules or domains?
3. **Trace request flow**: For a typical request (HTTP, event, CLI), trace the path through the code.
4. **Identify key abstractions**: Interfaces, base classes, shared utilities, middleware, interceptors.
5. **Map dependencies**: Internal module dependencies + external service integrations.
6. **Document data flow**: How data enters, transforms, persists, and exits the system.
7. **Build architecture summary**: Create a concise diagram (ASCII) + description for the vault.

## Phase C3: Tag Standard

Define tag vocabulary before creating notes:
- **Format**: English, lowercase, kebab-case
- **Categories**: `#arch-*` (architecture), `#module-*` (modules), `#pattern-*` (patterns), `#config-*` (config), `#api-*` (API), `#test-*` (testing)
- **Registry**: Only registered tags allowed. Present registry to user for approval.

## Phase C4: Notion Vault Structure

Use `notion-create-pages` and `notion-create-database` to build the StudyVault:
- **Parent Page**: "StudyVault - {Project Name}"
- **Concepts Database**: Child database named "Concepts"
- **Categories (Area property)**: Architecture, Module: {Name}, DevOps, Exercises, Onboarding

## Phase C5: Dashboard & Architecture

Populate the Notion Concepts Database with:

### Architecture Summary (Page in Concepts Database)
- **Area**: Architecture
- **Importance**: ★★★
- **Content**: System overview, request flow, data flow (ASCII diagrams)

### Onboarding Guide (Page in Concepts Database)
- **Area**: Onboarding
- **Content**: Setup instructions, dev workflow, key commands, recommended reading order

## Phase C6: Module Notes

One page per module/domain in the Concepts Database. Key rules:

- **Area**: Module: {Name}
- **Properties**: `Path`, `Key Files` (rich_text)
- **Purpose**: What this module does (1-3 sentences)
- **Public Interface**: Exported functions/classes/endpoints
- **Internal Flow**: How data moves through this module (ASCII diagram)
- **Dependencies**: What this module depends on + what depends on it

## Phase C7: Onboarding Exercises

Create pages in the Concepts Database with **Area**: Exercises.

- **Code Reading**: "Trace what happens when X occurs" — answer in `<details>` block
- **Configuration**: "How would you change Y?" — answer with file paths + snippets
- **Debugging**: "Where would you look if Z breaks?" — answer with investigation steps
- **Extension**: "How would you add feature W?" — answer with architectural approach
- Minimum 5 exercises per major module
- All answers use `<details><summary>Answer</summary>...</details>` blocks

## Phase C8: Interlinking

1. Use Notion's internal linking (typing `[[` or `@` in the Notion UI, or using page IDs in the API) to cross-reference modules.
2. Ensure every module page links back to the Architecture summary and Onboarding guide.

## Phase C9: Self-Review (MANDATORY)

Verify against [quality-checklist.md](quality-checklist.md) **Codebase Mode** section. Fix and re-verify until all checks pass.
