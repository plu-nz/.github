# Shared context

## Brand

- **Name:** PLUNZ
- **Domain:** `plu.nz` (purchased)
- **Tagline:** “Small apps. Big possibilities.”
- **Concept:** A digital toolbox of simple, modular, independent apps. The `+` symbolizes the tools coming together.

## Visual identity

- Square logo (1:1), with a full background and no rounded corners.
- Symbol inspired by the four arrows of a game controller D-pad.
- Colors exclusively from the Darkppuccin palette in `xonha/dotfiles`.
- Arrows: orange at the top, blue at the bottom, green on the left, and red on the right.
- Retrieve exact color values from the palette source before producing final assets.

## Products

### Capturar

A photo portfolio/PWA using the user's own Google Drive or Photos. It includes a feed and albums, without likes, followers, or comments. Tentative address: `photos.plu.nz`. Original project: `xonha/capturar`.

### Marmitar

Meal and meal-prep planning. Tentative address: `meals.plu.nz`.

### Psincro

Scheduling for psychologists, including calendar sync, confirmations, and payments. Tentative address: `calendar.plu.nz`.

## Repositories and infrastructure

- GitHub organization: `plu-nz`. Do not rename it.
- Bring PLUNZ products into this organization, including Capturar.
- Use the `mono-` prefix for monorepos.
- Prefer low-cost Cloudflare infrastructure where appropriate.
- This `.github` repository holds the public organization profile and shared documentation.

## Shared design system

The intent is to develop shared visual tokens, icons, and reusable components as products need them. The former `lib.design_system` repository contained only a short description and an MIT license; it had no implemented design-system assets. Solid and Storybook appeared in its description, but neither is an approved organization-wide stack decision. Create a dedicated library repository if reusable code emerges.

## Open questions

- Refine product names and subdomains.
- Define each product's architecture and deployment in its own repository.
- Decide which design-system elements should be shared once concrete product needs are known.
