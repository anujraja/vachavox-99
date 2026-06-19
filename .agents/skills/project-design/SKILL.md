---
name: project-design
description: Build or review UI, responsive behavior, accessibility, interaction quality, and visual polish.
---

# Project Design

Use this for frontend work, product UI, responsive fixes, visual polish, empty
states, onboarding, dashboards, marketing surfaces, and accessibility review.

## Rules

- Build the actual user workflow first; avoid placeholder landing pages unless
  the product explicitly needs one.
- Match existing design tokens, components, and interaction patterns.
- Prefer icons for tool actions, labels for clarity, and tooltips for unfamiliar
  controls.
- Keep touch targets at least 44px on mobile-critical paths.
- Avoid nested cards, decorative clutter, and one-note palettes.
- Keep text readable and contained at common desktop and mobile widths.
- Respect reduced motion.
- Do not introduce external font, image, analytics, or tracking dependencies
  without explicit approval.

## Verification

- Check desktop and mobile viewports.
- Check focus, hover, selected, disabled, loading, empty, and error states.
- Confirm primary actions are visible and reachable without hover-only behavior.
- Run relevant browser or screenshot checks when practical.

