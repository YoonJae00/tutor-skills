# Quality Checklist — Self-Review

Before reporting completion, verify every item in the relevant mode's section. Fix and re-verify if any check fails.

---

## Document Mode

### Source Traceability
- [ ] Every source file's content verified (not filename-based assumption)
- [ ] Source content mapping table built and verified in Phase D1
- [ ] Every `source_pdf` frontmatter matches verified mapping
- [ ] Non-academic files excluded and documented
- [ ] Missing sources marked as `원문 미보유`

### Coverage
- [ ] Every topic from Content Analysis has a concept page in Notion
- [ ] Every enumerated category member has its own page
- [ ] No source topic missing or underrepresented

### Tags
- [ ] All tags: English kebab-case, from registry only
- [ ] Tag Index includes hierarchy rules

### Structure & Formatting
- [ ] Every concept page has comparison table + exam/test patterns section
- [ ] Process/flow topics have ASCII diagrams
- [ ] Content is concise (tables > prose)
- [ ] Simplified statements include exception caveats

### Notion Setup
- [ ] Parent page created for the Subject
- [ ] Concepts Database created with Area, Importance, Status, Attempts, Correct, Error Notes properties
- [ ] All pages successfully added to the database

### Practice — Active Recall
- [ ] Minimum 8 questions per topic
- [ ] All answers use `<details><summary>Answer</summary>...</details>` blocks — never immediately visible
- [ ] Question type diversity: ≥60% recall, ≥20% application, ≥2 analysis per domain

### Interlinking
- [ ] Every concept page has "Related" section
- [ ] Use Notion internal linking for all cross-references

### CWD Boundary
- [ ] No source files accessed outside CWD
- [ ] External URLs accessed only via WebFetch, not file paths

---

## Codebase Mode

### Project Coverage
- [ ] All major modules/domains identified and documented
- [ ] Architecture pattern documented with ASCII diagram
- [ ] Request flow traced end-to-end
- [ ] Data flow documented (input → processing → persistence → output)
- [ ] External dependencies and integrations listed

### Module Completeness
- [ ] Every module has a dedicated page in the Concepts Database
- [ ] Every module page includes: Purpose, Key Files, Public Interface, Internal Flow, Dependencies
- [ ] Configuration section lists relevant env vars / config keys
- [ ] Testing section includes commands and patterns

### Notion Setup
- [ ] Parent page created for the Project
- [ ] Concepts Database created with Area, Importance, Status, Attempts, Correct, Error Notes properties
- [ ] Pages tagged with correct Area (e.g., Architecture, Module: X, Exercises)

### Onboarding Exercises
- [ ] Minimum 5 exercises per major module
- [ ] Exercise types: code reading (trace), configuration, debugging, extension
- [ ] All answers use `<details><summary>Answer</summary>...</details>` blocks
- [ ] Exercises link back to the modules they cover

### Interlinking
- [ ] Use Notion internal linking for all cross-references
- [ ] Dependent modules cross-linked bidirectionally
- [ ] Architecture notes reference specific module implementations

### CWD Boundary
- [ ] No references to files outside the project directory
- [ ] All file paths in pages are relative to project root
