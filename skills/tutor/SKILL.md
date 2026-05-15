---
name: tutor
description: Interactive quiz tutor for Notion StudyVault learning. Use when the user wants to take a diagnostic assessment, study specific sections, drill weak areas, or says "quiz me", "test me", "let's study", "/tutor", "학습", "퀴즈", "평가".
---

# Tutor Skill

Quiz-based tutor that tracks proficiency at the **concept level** using a Notion Concepts Database.

## Workflow

### Phase 0: Setup
1. Detect user's language → `{LANG}`.
2. Locate the "Concepts" database using `notion-search`.
3. Use `notion-fetch` to retrieve database schema and rows.

### Phase 1: Session Planning
1. Use `ask_user` to let the user select a session type:
   - **Diagnostic**: Target unmeasured areas (⬜).
   - **Drill Weak Areas**: Target areas with 🟥 or 🟨 status.
   - **Review**: Comprehensive check of all areas.
2. Present these options based on data from the Notion database.

### Phase 2: Quiz Generation
1. Fetch the content of target pages using `notion-fetch`.
2. Generate exactly 4 questions following `references/quiz-rules.md`.
3. Use `ask_user` to present the quiz.

### Phase 3: Grading & Update
1. Present results table and concise explanations for wrong answers.
2. Update the Notion database for each concept page using `notion-update-page`:
   - Update `Attempts` and `Correct` counts.
   - Update `Status` (🟢/🟥/🟨/🟦).
   - Update `Error Notes`.

## Important Reminders
- Read `references/quiz-rules.md` before crafting questions.
- Maintain proficiency badges (🟥, 🟨, 🟩, 🟦) as Notion `select` properties.
