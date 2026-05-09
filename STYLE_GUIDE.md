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
- Text light: `#666`
- Accent: `#d4a574` (gold)
- Accent dark: `#b8935f`
- Trap color: `#c41e3a` (red)
- Border: `#e5e5e5`

### Layout
- Keep content centered and narrow: `max-width: 720px`.
- Use consistent spacing: `0.5rem`, `1rem`, `1.5rem`, `2.5rem`, `4rem`.
- Break long sections with headings, quotes, or lists.

### Links
- Link color: dark text with accent underline.
- Hover state: trap color.
- Use clear link text, not "click here."

## Homepage Components (from index.md)

### Hero Section
```html
<div class="manifesto-hero">
  <p class="tagline">All Things Are Possible In Ghana. God Lives Here!</p>
  <h1 class="manifesto-title">10 Traps Keeping Ghana Stuck</h1>
  <p class="manifesto-lead">[Main hook statement]</p>
  <p class="manifesto-subtitle">[Secondary context]</p>
  <a href="/traps/" class="cta-button">Explore the 10 Traps</a>
</div>
```

### Standard Sections
```html
<section class="section">
  <h2>[Section Title]</h2>
  <ul>
    <li>[Bullet point]</li>
  </ul>
</section>
```

### Call-to-Action Section
```html
<section class="cta-section">
  <div class="cta-content">
    <h2>[CTA Title]</h2>
    <p>[CTA description]</p>
    <a href="/traps/" class="cta-button">[Button text]</a>
  </div>
</section>
```

## CSS Classes Reference

### Typography Classes
- `.tagline` - Uppercase, bold, accent color
- `.manifesto-title` - Large heading (3.5rem)
- `.manifesto-lead` - Large lead text (1.375rem)
- `.manifesto-subtitle` - Secondary text, lighter color

### Component Classes
- `.manifesto-hero` - Centered hero section
- `.section` - Standard content section
- `.cta-section` - Dark background call-to-action
- `.cta-content` - Centered CTA container
- `.cta-button` - Primary button style

### Button Styles
- Background: accent color (`#d4a574`)
- Text: dark (`#1a1a1a`)
- Hover: accent dark (`#b8935f`)
- Transform: translateY(-2px) on hover

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
