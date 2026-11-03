# PLUNZ

**Small apps. Big possibilities.**

PLUNZ brings together small, independent apps, each focused on a specific need. Together, they form a digital toolbox. The `+` symbolizes that connection.

This repository holds the [public organization profile](profile/README.md), shared context, and cross-product decisions. Product-specific code and implementation documentation belong in each product repository.

## Products

| Product | Idea | Tentative address | Status |
| --- | --- | --- | --- |
| Capturar | A photo portfolio/PWA using the user's Google Drive or Photos, with a feed and albums but no likes, followers, or comments | `photos.plu.nz` | Initial concept; originally `xonha/capturar` |
| Marmitar | Meal and meal-prep planning | `meals.plu.nz` | Initial concept |
| Psincro | Scheduling for psychologists, with calendar sync, confirmations, and payments | `calendar.plu.nz` | Initial concept |

Product names and subdomains may change. The main domain is `plu.nz`.

## Using this repository

- Track open work on the [PLUNZ Roadmap board](https://github.com/orgs/plu-nz/projects/1/views/3).
- Read the [shared context](docs/context.md) when starting a Codex, Claude, or other agent session.
- Record cross-product choices in [shared decisions](docs/decisions/README.md).
- Keep implementation details in each product repository.
- Follow [AGENTS.md](AGENTS.md) for shared agent instructions.

## Technical direction

Use [the PLUNZ architecture and stack standard](docs/decisions/2026-11-03-architecture-and-stack.md): SolidJS + TypeScript + Vite for web frontends; Hono + TypeScript for hosted APIs on suitable free JavaScript runtimes; Go whenever it fits the product's hosting and cost constraints, especially for CLIs and non-UI programs. Do not use TanStack Start. Aim for no-cost infrastructure, minimal self-hosting, and a small provider footprint.

Repository names follow the `type.name` pattern, inspired by `devbotzeiss`; see the [naming convention](docs/decisions/2026-11-03-repository-naming.md).

Shared visual tokens, icons, and components are planned. No separate design-system package has been adopted yet.

The GitHub organization is `plu-nz`. Do not rename it.

## Language

English is the official language of the PLUNZ organization. Use English for repository documentation, code comments, issues, pull requests, commit messages, and product copy by default. Product localization may add other languages when explicitly planned.
