---
name: gok-latex-generator
description: Generates LaTeX reports, presentations, and documents matching the specific style and arrangement of the Government of Kenya (GoK) State Department for Devolution templates. Use this skill WHENEVER the user asks you to create, draft, or format a report, presentation, brief, or document in LaTeX, particularly if it relates to government, devolution, public service, surveys, or requires a formal, professional, monochromatic/minimalist design.
---

# GoK LaTeX Generator Skill

## Purpose
This skill helps you generate highly structured, professional LaTeX reports and presentations that match the specific styling used by the Government of Kenya's State Department for Devolution.

## When to use
Trigger this skill when the user asks for a report, analytical document, or presentation to be written in LaTeX, especially for formal or government contexts, or when mentioning Devolution, public service, or survey reports.

## Document Types

### 1. Reports
When creating a **Report**, strictly follow this directory structure and template usage:

```
project_name/
├── main.tex
├── chapters/
│   ├── 01-introduction.tex
│   ├── 02-methodology.tex
│   └── (additional chapters).tex
├── images/
├── structure.tex  (copy from assets/structure.tex)
├── titlepage.tex  (copy from assets/titlepage.tex)
└── frontmatter.tex (copy from assets/frontmatter.tex)
```

**Instructions:**
- **Preamble**: `main.tex` must start with `\documentclass[12pt, a4paper]{report}` and `\input{structure}`.
- **Sections**: Structure the document into front matter (roman numerals, title page, TOC, list of figures/tables), main chapters (arabic numerals, separate files in `chapters/`), and optionally appendices/references.
- **Assets**: If `structure.tex`, `titlepage.tex`, or `frontmatter.tex` are missing from the destination directory, copy them from this skill's `assets/` directory.
- **Key Visuals**: In `structure.tex`, there is a `\newtcolorbox{inference}` macro. Use this to highlight major analytical deductions or recommendations:
  ```latex
  \begin{inference}
  "Supportive but Unequipped": Leadership is empathetic, but lacks formal infrastructure.
  \end{inference}
  ```
- **Branding**: Ensure `\brandingheader` is used in the title page or front matter.

### 2. Presentations
When creating a **Presentation** (slide deck), strictly follow this setup:

```
project_name/
├── presentation.tex
├── assets/
├── beamerthemesintef.sty (copy from assets/beamerthemesintef.sty)
└── sintefcolor.sty       (copy from assets/sintefcolor.sty)
```

**Instructions:**
- **Preamble**: `presentation.tex` must start with `\documentclass{beamer}` and `\usetheme{sintef}`.
- **Typography Setup**: Ensure fonts are explicitly set to Helvetica/sans-serif in the preamble:
  ```latex
  \usepackage[T1]{fontenc}
  \usepackage{helvet}
  \renewcommand{\familydefault}{\sfdefault}
  \usefonttheme{default}
  ```
- **Assets**: If the `sintef` styles are not present, copy them from this skill's `assets/` directory to the same directory as the presentation file.
- **Layout & Structure**: 
  - Use `\begin{frame}{Title}\framesubtitle{Subtitle}` for slides. 
  - Use `\begin{columns}` with `\begin{column}{0.5\textwidth}` for side-by-side text and visuals.
  - Emphasize important metrics using standard `\begin{block}{Title}` or `\begin{colorblock}[white]{maincolor}{Title}`.
- **Visuals**: Add `\titlebackground*{assets/background}` before `\begin{document}` to set the background image (the user will provide the image).

## General Writing Style
Adopt a formal, bureaucratic, yet highly analytical and objective tone. Use precise language, avoiding colloquialisms. Focus on structured arguments, clear data presentation, and actionable recommendations. Provide structured sections like "Executive Summary," "Context & Background," "Methodology," "Findings," and "Strategic Recommendations."
