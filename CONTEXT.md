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

### Capture (working name)

A photo portfolio/PWA using the user's own Google Drive or Photos. It includes a feed and albums, without likes, followers, or comments. Preview address: `capture.plu.nz`. Repository: `plu-nz/mono.capture`. Persisted data and current production resources still use legacy Capturar identifiers until a validated migration.

### Split

An anonymous, mobile-first bill splitter at `split.plu.nz` in `plu-nz/mono.split`. Visitors can enter bill items, add people, assign items, and copy exact per-person totals without accounts. A receipt photo can be sent to Cloudflare Workers AI for suggested line items; every suggestion must be reviewed. Bill drafts remain on the visitor's device. No payment or restaurant management is included.

### Meal planning (unnamed)

Meal and meal-prep planning. Public name and address remain undecided.

### Psychologist practice (unnamed)

Scheduling for psychologists, including calendar sync, confirmations, and payments. Public name and address remain undecided.

## Repositories and infrastructure

- GitHub organization: `plu-nz`. Do not rename it.
- Keep PLUNZ products in this organization, including the photo app in `mono.capture`.
- Name repositories with a type prefix and a dot, following `decisions/2026-11-03-repository-naming.md`. Use `mono.` for monorepos.
- Prefer suitable free tiers, especially Cloudflare where appropriate; minimize self-hosted services and the number of providers.
- This `.github` repository holds the public organization profile and shared documentation.

## Architecture and stack

The [architecture and stack decision](decisions/2026-11-03-architecture-and-stack.md) sets SolidJS + TypeScript + Vite for web frontends. Hono + TypeScript is an expected choice for hosted APIs on suitable free JavaScript runtimes. Prefer Go for its efficiency whenever hosting it fits the no-cost and low-operations goals, especially for CLIs and non-UI software. TanStack Start is excluded. Apply the standard to new work without rewriting existing applications solely for consistency.

Use [pnpm](decisions/2026-11-04-pnpm-package-manager.md) for JavaScript and TypeScript projects.

Design product apps mobile first and make web product apps installable on smartphones, following the [mobile-first and installability decision](decisions/2026-11-04-mobile-first-and-installable-apps.md).

## Language

English is the official language across the PLUNZ organization. Repository documentation, code comments, issues, pull requests, commit messages, and product copy are written in English by default. Additional product languages require an explicit localization plan.

## Shared design system

The intent is to develop shared visual tokens, icons, and reusable components as products need them. The former `lib.design_system` repository contained only a short description and an MIT license; it had no implemented design-system assets. SolidJS is now the standard for web interfaces; Storybook and a separate design-system package remain undecided. Create a dedicated library repository if reusable code emerges.

## Open questions

- Refine product names and subdomains.
- Define each product's architecture and deployment in its own repository.
- Decide which design-system elements should be shared once concrete product needs are known.
