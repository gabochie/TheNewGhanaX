# TheNewGhanaX Style Guide

## Purpose
This style guide defines writing, formatting, and visual conventions for TheNewGhanaX website. Use it to keep content consistent, readable, and aligned with the brand voice.

## Brand Voice
- Tone: direct, candid, grounded, urgent.
- Personality: informed but accessible, challenging yet supportive.
- Audience: Ghanaian youth who want to escape limiting mindsets and build real momentum.
- Avoid jargon, academic distance, or passive advice.

## Writing Guidelines
- Use short paragraphs. Most paragraphs should be 1-3 sentences.
- Use simple, conversational language.
- Use bold for emphasis, not italics, unless you need subtle emphasis.
- Use active voice whenever possible.
- Avoid filler phrases like "very," "really," "definitely," and "to be honest."
- Use contractions naturally (e.g. "you're," "don't").
- Keep sentences focused and direct.

## Markdown & Front Matter
- All posts and pages use YAML front matter.
- Use `layout: post` for blog essays in `_posts/`.
- Recommended front matter fields for essays:
  - `layout`
  - `title`
  - `date`
  - `keywords`
  - `excerpt`
  - `featured` (optional)
  - `takeaways` (optional list)
  - `faq` (optional list of question/answer pairs)

Example:
```yaml
---
layout: post
title: "Your Title"
date: 2026-07-20
keywords: ["keyword one", "keyword two"]
excerpt: "Short summary under 160 characters."
featured: true
takeaways:
  - "Key point one"
  - "Key point two"
faq:
  - question: "Common question?"
    answer: "Short direct answer."
---
```

## Post Structure
- Start with a strong hook or claim.
- Use section headings to break content into clear ideas.
- Use lists for processes, examples, or comparisons.
- Use subheadings for major sections (`##`, `###`).
- Keep headings descriptive and action-oriented.
- Use bold to highlight key statements and takeaways.
- Include real-world examples or Ghana-specific details where possible.

## Headings
- `#` only for the page or post title in markdown source.
- Use `##` for main sections and `###` for subsections.
- Avoid more than 3 heading levels unless necessary.
- Headings should read like statements or mini-guides.

## Lists
- Use hyphens (`-`) for bullet lists.
- Use numbered lists for step-by-step instructions.
- Keep list items concise.
- For emphasis, use bold inside list items sparingly.

## Style and Grammar
- Use sentence case for headings and list items.
- Keep dates, numbers, and currency clear:
  - Ghana cedi: `₵2,500` or `₵4,500/month`
  - Years: `2026`
  - Percentages: `78%`
- Use US spelling for consistency (e.g. `organization`, `behavior`).
- Keep language inclusive and avoid unnecessary slang.
- Avoid passive constructions and academic phrasing.

## Visual Style
### Typography
- Heading font: `Playfair Display`, Georgia, serif.
- Body font: `Inter`, system sans-serif.
- Maintain strong contrast between text and background.

### Colors
- Background: `#fafafa`
- Text: `#1a1a1a`
- Accent: `#d4a574`
- Accent dark: `#b8935f`
- Trap color: `#c41e3a`
- Border: `#e5e5e5`

### Layout
- Keep content centered and narrow: `max-width: 720px`.
- Use consistent spacing: `1rem`, `1.5rem`, `2.5rem`, `4rem`.
- Break long sections with headings, quotes, or lists.

### Links
- Link color: dark text with accent underline.
- Hover state: accent or trap color.
- Use clear link text, not "click here."

## File Naming
- Use lowercase, hyphen-separated filenames for posts and pages.
- In `_posts/`, use the `YYYY-MM-DD-title.md` format.
- In `_traps/`, use descriptive names like `authority-worship.md`.

## SEO & Metadata
- Use `excerpt` for a short summary under 160 characters.
- Use `keywords` as a list of relevant search phrases.
- Keep titles clear, direct, and benefit-driven.
- Prefer headlines that speak to the reader's pain or a solution.

## Content Quality
- Every post should teach something practical, not just diagnose a problem.
- Use local examples or culturally relevant angles when possible.
- Keep the message hopeful but honest.
- Avoid preaching; focus on actionable insight.

## Contributing
- Add new essays in the root or `_posts/`.
- Use the site’s existing layouts and CSS conventions.
- Keep formatting clean and consistent.
- Review the current posts for tone and structure before writing.

## Maintenance
- Update this guide when new page types or visual patterns are added.
- Link to `STYLE_GUIDE.md` from the README so contributors can find it easily.
