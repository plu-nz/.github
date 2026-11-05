# Shared design system and component workshop

- **Date:** 2026-11-04
- **Status:** Accepted

## Context

PLUNZ apps currently repeat colors, controls, and surface styles. Split and the home use mostly square controls on dark surfaces, while Pomodoro uses different backgrounds and rounded controls. This makes new work drift and requires repeated accessibility review.

## Decision

Maintain the shared SolidJS component library in `plu-nz/lib.storybook` under the package name `@plunz/storybook`. Publish Storybook with the SolidJS Vite integration at `storybook.plu.nz` as the interactive workshop for component states and parameters. The library's public API begins with scoped Darkppuccin tokens, a `Theme` wrapper, buttons, text fields, and cards.

Use the exact Darkppuccin colors from `xonha/dotfiles`. Theme parameters may select an approved accent and square or rounded corners; components may expose variants and sizes. Keep accessible defaults, native semantics, visible focus, and touch targets in the shared components. Product-specific copy, routes, data, and business rules stay in each app. Every new shared component needs representative stories and prop controls.

Adopt the library incrementally in product repositories when a component is touched or a focused consistency pass is planned. Keep the package independent of any one app. Pin Git revisions until a package publishing workflow is selected and tested; the package does not require a new hosted service.

## Consequences

Storybook and package builds are required checks for changes to the library. A shared component does not automatically change deployed apps; each app must install a pinned revision and replace its local implementation through its own tested change. The library may grow only from concrete repeated needs, avoiding a large speculative component catalog.
