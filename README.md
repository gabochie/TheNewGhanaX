# TheNewGhanaX

> **Unshackling the Ghanaian Mind**

A thought leadership blog exploring the 10 psychological traps holding Ghanaian youth back—and how to break free from them.

## The 10 Systemic Traps

1. **The Survival Mindset Trap** — Trained to focus on daily survival, not legacy
2. **Authority Worship & Fear of Questioning** — Power is untouchable
3. **Scarcity Mentality** — Belief that wealth and opportunity are limited
4. **Inherited Colonial Logic** — Foreign = better
5. **Short-Termism (Sakawa Planning)** — Everything is about quick gain
6. **Religious Over-Spiritualization** — Praying for what requires planning
7. **Inferiority Complex** — Shrinking potential to avoid seeming proud
8. **Dependency Programming** — Salvation must come from "above"
9. **Status Symbol Syndrome** — Prioritizing image over impact
10. **The "It's Not That Deep" Delusion** — Avoiding serious issues with humor

## Tech Stack

- **Jekyll** — Static site generator
- **GitHub Pages** — Free hosting
- **Custom CSS** — No frameworks, pure performance

## Local Development

### Prerequisites

- Ruby 2.5+ installed
- Bundler gem: `gem install bundler`

### Setup

```bash
# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve

# View at http://localhost:4000
```

## Deployment

This site is configured for **GitHub Pages** automatic deployment:

1. Push to the `main` branch
2. GitHub Actions builds and deploys automatically
3. Site appears at `https://[username].github.io/TheNewGhanaX`

Or use a custom domain by adding a `CNAME` file.

## Project Structure

```
TheNewGhanaX/
├── _config.yml          # Site configuration
├── _layouts/            # HTML templates
│   ├── default.html
│   ├── home.html
│   ├── trap.html
│   └── post.html
├── _traps/              # The 10 trap articles
│   ├── survival-mindset.md
│   ├── authority-worship.md
│   └── ...
├── assets/css/          # Stylesheets
│   └── style.css
├── index.md             # Homepage / Manifesto
├── traps.html           # Traps index page
├── about.md             # About page
└── Gemfile              # Ruby dependencies
```

## Contributing Content

To add a new essay or expansion piece:

1. Create a new `.md` file in the root or `_posts/` directory
2. Add YAML frontmatter:
   ```yaml
   ---
   layout: post
   title: "Your Title"
   date: 2024-01-15
   ---
   ```
3. Write in Markdown
4. Commit and push

## Style Guide

- See `STYLE_GUIDE.md` for writing, formatting, and design conventions.

## License

Content: All rights reserved  
Code: MIT License

---

*Built for Ghanaian youth who refuse to let these traps define their future.*
