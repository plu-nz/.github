# Tinta as the PLUNZ theme

- **Date:** 2026-11-21
- **Status:** Accepted

## Context

PLUNZ products used the Darkppuccin palette from `xonha/dotfiles`: Catppuccin Mocha accents with blue-tinted neutrals. The Tinta palette (`plu-nz/web.tinta`, [tinta.plu.nz](https://tinta.plu.nz)) replaces the blue tint with neutral grays, adds a light mode, and renames Catppuccin's Peach to Orange.

## Decision

- `src/palette.js` in `plu-nz/web.tinta` is the source of truth for PLUNZ colors. Change a color there first, then propagate it.
- `plu-nz/lib.storybook` mirrors Tinta: all 14 accents, a `dark` (default), `light`, or `system` mode, and the same neutrals. `--plz-line` and `--plz-raised` use Tinta `surface0` (`#333333`).
- The orange accent keeps its name and takes the Tinta value `#FAB387` (previously `#f6b6ab`).
- Products replace hard-coded Darkppuccin and Catppuccin hex values with Tinta values. Product repositories pick up the library change by bumping their `@plunz/storybook` pin.
- The Dotfiles repository ships the Omarchy themes `tinta-dark` and `tinta-light` (with matching GTK themes `Tinta-Dark` and `Tinta-Light`, published in `plu-nz/web.tinta`) next to `darkppuccin`. Desktop apps that follow the GTK theme (Lounge, Stage, Nexus, Passport) are Tinta once that theme is active.

## Consequences

- Supersedes the Darkppuccin color rules in the [shared design system decision](2026-11-04-shared-design-system.md) and in the visual identity section of the shared context. Those files stay as history.
- Text, lines, and surfaces become neutral grays (for example text `#D7D7D7` instead of `#cdd6f4`); backgrounds `#0F0F0F` and `#1C1C1C` are unchanged.
- Pastel accents on the light mode have lower contrast as text; solid controls use a dark `--plz-on-accent` for readability.
