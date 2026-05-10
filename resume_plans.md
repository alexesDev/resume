# Resume Plans

Replace the "edit one HTML" workflow with a composable system: resumes assembled from a library of small notes, each tagged with themes, metrics, keywords, and tools.

## Goal

Each new application takes ~30 minutes (assemble) instead of several hours (rewrite). The library grows with every iteration.

## Build it on trip2g

trip2g already has every piece needed:

- **Notes as bullets** — each achievement, role, project description is its own note
- **`![[link]]` embeds** — native composition; one resume = a note that embeds the right bullets
- **Jet templates** — programmatic conditional assembly (e.g. include AI-agent bullets only when the target has a matching tag)
- **Wiki-style rendering** — already there
- **PDF export** — TODO; render the resume page to PDF (likely via headless Chromium, same as current pipeline)

Bonus: assembly itself becomes a real-world demo of trip2g's composition story.

## Library structure (rough)

```
/library/
  /roles/
    company-a-role.md
    company-b-role.md
    ...
  /projects/
    project-a.md
    project-b.md
    ...
  /bullets/
    achievement-1.md
    achievement-2.md
    ...
  /skills/
    languages.md
    ai-llm.md
    backend-data.md
    cloud-infra.md
    frontend.md
  /about-me/
    base.md
    ...
  /templates/
    resume-default.md
    resume-ai-focused.md
    resume-backend-focused.md
```

Each bullet note carries frontmatter tags: `themes`, `metrics`, `keywords`, `tools`. A Jet template filters by tags and embeds the matching bullets.

## Three ideas worth borrowing from existing resume-tailoring tooling

1. **Confidence scoring** for matches: 90+ direct, 75+ transferable, 60+ adjacent, <60 gap. Make weak vs strong matches explicit so gaps are visible. Useful for cover-letter prep.

2. **Generation report** alongside each resume — an internal `.md` summarizing JD coverage %, reframings applied, remaining gaps, things to address in cover letter, and points to prepare for interview.

3. **Self-improving library** — after every resume, new bullets and reframings stay in the library. The next application starts from a richer base.

## What to skip

- External DOCX/PDF generators — current Chromium pipeline is sufficient.
- Auto-research via WebSearch — manual or in-conversation works better.
- Multi-job batch mode — only useful when applying to many roles at once.

## Order of work

1. Build minimal `library/` structure.
2. Convert one role and 5-10 bullets to notes as proof-of-concept.
3. Write one Jet template that composes a resume from tagged notes.
4. Add an HTML → PDF endpoint in trip2g (or keep external Chromium for now).
5. Migrate the rest of the content.
6. Use it end-to-end for the next real application.
