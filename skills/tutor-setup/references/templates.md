# Notion Templates Reference

## Concepts Database Schema

```json
{
  "title": [ { "type": "text", "text": { "content": "Concepts" } } ],
  "properties": {
    "Name": { "title": {} },
    "Area": { "select": { "options": [ { "name": "Topic 1", "color": "blue" } ] } },
    "Importance": { "select": { "options": [ { "name": "★", "color": "gray" }, { "name": "★★", "color": "orange" }, { "name": "★★★", "color": "red" } ] } },
    "Status": { "select": { "options": [ { "name": "⬜", "color": "default" }, { "name": "🟥", "color": "red" }, { "name": "🟨", "color": "yellow" }, { "name": "🟩", "color": "green" }, { "name": "🟦", "color": "blue" } ] } },
    "Attempts": { "number": { "format": "number" } },
    "Correct": { "number": { "format": "number" } },
    "Error Notes": { "rich_text": {} }
  }
}
```

## Concept Page Content Template

Use `notion-create-pages` with the following content structure in the page body:

```markdown
# <Title>

## Overview Table
| Item | Key Point |
|------|-----------|
| A    | ...       |

## Core Concepts
Concise explanation.
- Bullet points for key facts.

## Exam Patterns
- **Scenario X**: Solution Y.

## Visualization
[ASCII Diagram here]
```

## Practice Question Template

Include these within the Notion page body of the corresponding concept or as separate pages in a "Practice Banks" database.

```markdown
# <Topic> Practice

## Question 1 [recall]
> Scenario summary

<details>
<summary>Answer</summary>
Explanation here.
</details>
```
