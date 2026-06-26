---
name: frontend-browser-qa
description: Verify frontend changes through browser checks, responsive layout review, DOM inspection, screenshots, and interaction testing. Use when Codex changes HTML, CSS, JavaScript, forms, navigation, modals, dashboards, charts, animations, or page layout.
---

# Frontend Browser QA

Use browser verification when visual or interactive behavior matters.

## Checks

1. Start or identify the local dev server if needed.
2. Open the affected page.
3. Test at desktop and mobile widths.
4. Check that text does not overlap or overflow.
5. Verify controls are clickable, keyboard reachable, and visibly focused.
6. Exercise the main happy path and one error or empty state.
7. Inspect console errors.
8. Capture screenshots when useful.

## Fallback When Browser Tools Fail

If browser automation or the in-app browser is blocked by local permissions, missing dependencies, or sandbox issues:

1. Record the exact blocker.
2. Run route/render smoke checks when the project supports them.
3. Inspect rendered HTML or DOM output for critical hooks, forms, modals, filters and navigation.
4. Create or update a manual QA checklist for desktop, tablet, mobile, keyboard navigation, focus states, modals, forms, empty states and text overflow.
5. Keep manual QA marked incomplete until a real browser pass is performed.

## UI Quality Rules

- Keep the actual app or page visible immediately.
- Avoid placeholder-only screens unless requested.
- Preserve the existing design system.
- Use stable dimensions for fixed-format UI such as cards, boards, toolbars, and grids.
- Make buttons and form controls large enough for mobile interaction.

## Final Response

Report the browser URL, viewports checked, interactions tested, and any remaining visual risk.
