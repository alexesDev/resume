# Alexey Yurchenko — Resume

Maintained HTML/CSS resumes, published on GitHub Pages:

| Audience | HTML | PDF |
| --- | --- | --- |
| CTO / founding engineer, English | [en.html](en.html) | [en.pdf](en.pdf) |
| AI agent infrastructure, English | [en-ai.html](en-ai.html) | [en-ai.pdf](en-ai.pdf) |
| CTO / founding engineer, Russian | [index.html](index.html) | [ru.pdf](ru.pdf) |

Edit the relevant HTML files directly and keep shared career facts consistent.
All versions use `styles.css`, system fonts, and a single-column layout. Print
styles produce two A4 pages. Vietnam is the location; UTC+6 is the preferred
working time zone, not Vietnam's local time.

## Build PDFs

```sh
./scripts/prepare.sh
```

Requires Chromium or Google Chrome. Set `CHROMIUM_BIN` to override the executable.
The build works locally without an API key and does not alter HTML.
`scripts/translate.py` is a legacy, optional tool that overwrites `en.html`;
it is deliberately excluded from the build.

## Publish

Review the HTML and PDFs, then run:

```sh
./scripts/deploy.sh
```

This stages the resume files, commits any staged changes, and pushes the current
branch to its configured remote. Publishing is separate from building PDFs.
