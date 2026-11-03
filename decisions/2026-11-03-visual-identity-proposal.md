# Shared visual identity proposal

**Status:** Proposed; pending review in the pull request. This document is a working specification for the PLUNZ hub MVP, not an approved organization-wide decision.

## Context and confirmed constraints

PLUNZ is a family of small, independent apps. The `+` expresses their connection. The existing [shared context](../CONTEXT.md) already fixes the organization mark's square, full-background format; its four D-pad-inspired arrows; the order orange/top, blue/bottom, green/left, red/right; and the use of colors from Darkppuccin. Product names and subdomains remain tentative. The [architecture decision](2026-11-03-architecture-and-stack.md) prefers lightweight SolidJS web interfaces and avoids unnecessary shared packages.

The product direction is **mobile first**. [Capturar's bottom navigation](https://github.com/plu-nz/mono.capturar/blob/main/app/src/ui/bottom-nav/index.tsx) is an existing example of keeping primary destinations close to the thumb. This is a navigation principle, not a requirement to copy Capturar's components into every product.

## Proposed direction

Use a restrained, dark, functional visual language. Product artwork may have its own subject and accent, while the same typography, color roles, spacing, icon conventions, and accessibility checks make the family recognizable. Start with documented assets and CSS custom properties in the `.github` repository and the PLUNZ hub. Publish a library only after two products need the same maintained code.

### 1. Color source and roles

The source of truth is [`xonha/dotfiles` Darkppuccin `colors.toml`](https://github.com/xonha/dotfiles/blob/main/omarchy/themes/darkppuccin/colors.toml). Its orange is **`#f6b6ab`**, distinct from the more familiar Catppuccin peach. Copy the exact values; do not substitute a similarly named palette. The colors below are a selected subset, not a new palette.

| Raw token | Hex | Proposed role |
| --- | --- | --- |
| `background` | `#0f0f0f` | Page and full-bleed brand mark background |
| `lighter_background` | `#1c1c1c` | Raised surface |
| `selection` | `#393947` | Selected surface or subtle border, subject to contrast checks |
| `foreground` | `#cdd6f4` | Primary text |
| `light_foreground` | `#bac2de` | Secondary text |
| `dark_foreground` | `#6c7086` | Decorative or disabled text only unless contrast passes |
| `red` | `#f38ba8` | Right arrow; error when paired with text |
| `orange` | `#f6b6ab` | Top arrow; possible warm accent |
| `green` | `#a6e3a1` | Left arrow; success |
| `blue` | `#89b4fa` | Bottom arrow; link or focus accent |
| `yellow` | `#f9e2af` | Warning |
| `cyan` | `#94e2d5` | Optional product accent |
| `magenta` | `#f5c2e7` | Optional product accent |

Use semantic names in product CSS, for example `--color-page`, `--color-surface`, `--color-text`, `--color-text-secondary`, `--color-link`, `--color-focus`, `--color-success`, and `--color-danger`. Raw colors describe the palette; semantic tokens describe use. Use `currentColor` for interface icons. Define hover and pressed states with borders, underlines, or surface changes already present in the palette before adding colors. Do **not** synthesize `red-500`, `red-600`, and `red-700` merely to fill a scale. Any new color or light theme needs a separate proposal, source, and contrast checks.

### 2. Typography and layout

- Use the platform system UI font stack (`system-ui`, `-apple-system`, `BlinkMacSystemFont`, `"Segoe UI"`, `sans-serif`) for the first release. This keeps the hub fast and avoids a font service. Pick a licensed brand face later only if product comparisons expose a real need.
- Use a small type scale: body `1rem` with line height around `1.55`; compact labels `0.875rem`; section headings around `clamp(1.75rem, 3vw, 2.5rem)`; primary heading around `clamp(2.75rem, 7vw, 5.5rem)`. Keep paragraph measure near 65 characters.
- Use a consistent spacing scale of `4, 8, 12, 16, 24, 32, 48, 64` CSS pixels. Use the same scale for gaps and padding; allow responsive interpolation for large sections.
- Keep the **brand mark** square with sharp corners. UI cards and controls may use small radii (`4–8px`) if consistent within a product. Do not infer a global prohibition on UI rounding from the logo requirement.
- Use a visible `2px` or stronger focus outline and preserve keyboard navigation, touch targets, and reduced-motion preferences.

### 3. PLUNZ mark and product icon family

- Master artwork: vector SVG on a square artboard with an opaque, edge-to-edge `#0f0f0f` background and no rounded corners. Four directional forms meet around a central negative-space `+`, with orange/top, blue/bottom, green/left, and red/right. Keep the silhouette recognizable in monochrome and at `32px`.
- Keep the master mark separate from each **product icon**. Product icons use the same square artboard, opaque background, safe margins, visual weight, and preferably a recognizable central motif. A product may use one Darkppuccin accent and a small family cue, but must remain distinguishable from the PLUNZ mark and the other apps at launcher size. Do not use a generic D-pad with only a different color for every app.
- Make a comparison sheet showing PLUNZ, Capturar, Marmitar, and Psincro at `16`, `32`, `192`, and `512px`; check recognition in grayscale and on dark and light launcher surrounds. Product pictograms are proposals until each product validates its own subject and name.
- Export the vector master, `32px` favicon, `192px` and `512px` PWA icons, a dedicated maskable version with important artwork inside the centered 80%-diameter safe circle, and a single-color version. The maskable variant may have extra padding while its artwork remains on a full opaque square. See [MDN's PWA icon guidance](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/How_to/Define_app_icons).
- Record source, license, export script, and minimum-size checks alongside each asset. Never treat interface icon glyphs as a substitute for app identity artwork.

### 4. Interface icons

Use [Lucide](https://lucide.dev/) as the proposed baseline for functional UI icons, with a consistent `24px` box, `2px` stroke at full size, and `currentColor`. Use smaller sizes only after checking legibility. Import only the glyphs needed; use text labels for actions whose meaning is unclear. Brand marks, app identities, and illustrations remain custom. Keep the Lucide [license notice](https://lucide.dev/license) when distributing its icons.

### 5. Accessible application rules

- Check actual foreground/background pairs against [WCAG text contrast](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html): at least `4.5:1` for normal text and `3:1` for large text. Check meaningful controls and icons against [non-text contrast](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast): at least `3:1` where required. A palette value by itself is not an accessibility guarantee.
- Never convey availability, error, or status through hue alone. Pair color with text, icon shape, or another cue.
- Prefer semantic HTML, visible keyboard focus, meaningful link names, and reduced-motion handling. Test at narrow and zoomed viewports before reusing a pattern across apps.
- Do not publish inactive product destinations as if they were live. The hub should distinguish available apps from concepts and link to a verified destination only.

### 6. Mobile-first navigation and reachability

- Design each app's smallest supported mobile viewport and its primary journeys first; expand the same information architecture for tablet and desktop. Validate at narrow widths, zoomed text, and touch input before calling a flow complete.
- Prefer the lower part of the mobile screen for frequent navigation and primary actions. For apps with several persistent top-level destinations, use a bottom navigation bar as the default pattern, following Capturar's direction. Keep the destinations few, stable, clearly labeled, and visibly indicate the current one.
- Keep less frequent settings, account management, and long-form content out of the primary bar. A simple landing page or a one-screen flow may use a clear bottom-positioned action without a persistent navigation bar; choose the pattern from the actual task and explain exceptions in the product repository.
- Respect `env(safe-area-inset-bottom)` and device/browser chrome. Reserve enough page padding so the bar never covers content, controls, dialogs, or the final scroll target. Check behavior with the on-screen keyboard open and with long labels or localization.
- Give touch controls adequate target size and spacing, visible focus, text labels, and semantic navigation markup. Do not make important actions depend on a gesture alone. On larger screens, adapt placement when it improves use without changing destination meaning.

## MVP implementation and ownership

1. Build the hub with local semantic CSS tokens and a vector PLUNZ mark, matching this proposed specification. Do not publish this proposal as an already approved standard.
2. Verify the exact color source, contrast pairs, mobile layout, keyboard flow, screen-reader labels, favicon, PWA icons where the hub is installable, and clear product status.
3. Collect real product needs before extracting shared components or adopting Storybook. Keep product-specific artwork and component behavior in each product repository.
4. On approval, change this document's status to **Accepted**, update the [decision index](README.md), and decide whether a separate asset repository is justified. Record any approved changes made during review.

## Open decisions

- Final SVG geometry and legal/brand review of the PLUNZ mark and each product icon.
- Whether a distinctive licensed typeface adds enough value to justify loading it.
- Whether additional Darkppuccin colors, a light mode, or generated ramps are needed after real interface checks.
- Whether a shared versioned token package is warranted after more than one product consumes it.

## Consequences

The proposal gives the hub an implementable visual baseline without forcing unfinished products into a common component library. It deliberately leaves application icons and any palette expansion open for review. Site implementation can be revised before this proposal is accepted.
