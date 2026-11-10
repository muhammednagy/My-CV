# AGENTS.md

Guide for AI coding agents working in this repository.

## What this repo is

One person's one-page resume, written in LaTeX on top of the Awesome-CV template.

- `resume.tex`: the content (sections, jobs, dates, bullets).
- `awesome-cv.cls`: layout and styling.
- `fontawesome.sty` and `fonts/`: bundled Roboto, Source Sans Pro and FontAwesome.
- `resume.pdf`: the built output. It is committed on purpose.
- `README.md`: short usage note.

## Build

```
tectonic resume.tex
```

Tectonic uses the XeTeX engine, fetches packages on first run and leaves no aux files.
`xelatex resume.tex` also works if a TeX distribution is installed (it does leave `.aux`, `.log` and `.out` files).
Install on macOS: `brew install tectonic poppler`.

## Verify after every change

1. `pdfinfo resume.pdf | grep Pages` must report `Pages: 1`.
2. Render and look at it: `pdftoppm -png -r 110 resume.pdf /tmp/resume`, then open the PNG.
   Page count alone does not show overflow, clipped text or bad spacing, so always check the image.

## Hard rules

- The resume stays exactly one page, A4.
- Never invent or embellish content. No new accomplishments, metrics, skills, titles or dates.
  Every fact must come from the owner. If a detail is missing, ask instead of guessing.
- Keep reverse chronological order. Multiple roles at one company go under a single company block.
- Dates use a three-letter month, the year and an en dash, for example `Jul 2023 – Present`.
- Use only the bundled fonts. Do not add packages or fonts without need.
- If content does not fit, tighten the wording first, then the spacing.
  Do not drop body text below 9pt. Do not remove jobs without asking.
- Rebuild and commit `resume.pdf` together with any source change so the two never drift.
- Do not commit build byproducts: `*.log`, `*.aux`, `*.out`, `*.xdv`.

## Editing tips

- Content changes go in `resume.tex`. Styling changes go in `awesome-cv.cls`.
- Escape LaTeX special characters in content: `\&`, `\%`, `\#`, `\_`.
- Change one thing at a time and rebuild, so a layout break is easy to trace.

## Commits

Use a short imperative subject that describes the resume change, for example `Add Jul 2023 role at Acme` or `Tighten summary wording`.
