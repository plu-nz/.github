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

- Read the [shared context](docs/context.md) when starting a Codex, Claude, or other agent session.
- Record cross-product choices in [shared decisions](docs/decisions/README.md).
- Keep implementation details in each product repository.
- Follow [AGENTS.md](AGENTS.md) for shared agent instructions.

## Technical direction

Prefer simple, modular, low-cost solutions. Cloudflare is the preferred infrastructure where it fits. Repository names follow the `type.name` pattern, inspired by `devbotzeiss`; see the [naming convention](docs/decisions/2026-11-03-repository-naming.md).

Shared visual tokens, icons, and components are planned, but no framework or package has been adopted as an organization-wide standard.

The GitHub organization is `plu-nz`. Do not rename it.

## Language

English is the official language of the PLUNZ organization. Use English for repository documentation, code comments, issues, pull requests, commit messages, and product copy by default. Product localization may add other languages when explicitly planned.
