# PLUNZ

**Small apps. Big possibilities.**

PLUNZ brings together small, independent apps, each focused on a specific need. Together, they form a digital toolbox. The `+` symbolizes that connection.

This repository holds the [public organization profile](profile/README.md), shared context, and cross-product decisions. Product-specific code and implementation documentation belong in each product repository.

## Products

| Product | Idea | Tentative address | Status |
| --- | --- | --- | --- |
| PLUNZ Photo | A photo portfolio/PWA using the user's Google Drive or Photos, with a feed and albums but no likes, followers, or comments | `photo.plu.nz` | In development; repository `mono.photo` |
| PLUNZ Meal | Meal and meal-prep planning | `meal.plu.nz` | Initial concept |
| PLUNZ Practice | Scheduling and practice administration for psychologists, including confirmations and payments | `practice.plu.nz` | Initial concept |

The [product naming convention](decisions/2026-11-03-product-naming.md) defines the English-first family. Addresses remain intended destinations until each product launches. The main domain is `plu.nz`.

## Using this repository

- Track open work on the [PLUNZ Roadmap board](https://github.com/orgs/plu-nz/projects/1/views/3).
- Read the [shared context](CONTEXT.md) when starting a Codex, Claude, or other agent session.
- Browse the [decisions index](decisions/README.md) for accepted cross-product choices.
- See the [profile index](profile/README.md) for the public organization introduction.
- Keep implementation details in each product repository.
- Follow [AGENTS.md](AGENTS.md) for shared agent instructions.
- Open AI sessions from this checkout and use the [local repositories guide](REPOS.md) to sync and work on product checkouts in ignored `repos/*` directories.

Keep this repository flat. Every directory, including nested directories, must contain a `README.md` that summarizes its purpose and links to its contents and relevant parent context.

`repos/` and `graphify-out/` are local generated workspaces, fully ignored by Git; their contents are not part of this repository's documented directory tree.

On the roadmap, draft items belong in **Backlog**. Move work to **Todo** only after converting it to a repository issue with a clear goal, actionable steps, and completion criteria.

## Technical direction

Use [the PLUNZ architecture and stack standard](decisions/2026-11-03-architecture-and-stack.md): SolidJS + TypeScript + Vite for web frontends; Hono + TypeScript for hosted APIs on suitable free JavaScript runtimes; Go whenever it fits the product's hosting and cost constraints, especially for CLIs and non-UI programs. Do not use TanStack Start. Aim for no-cost infrastructure, minimal self-hosting, and a small provider footprint.

Repository names follow the `type.name` pattern, inspired by `devbotzeiss`; see the [naming convention](decisions/2026-11-03-repository-naming.md).

Shared visual tokens, icons, and components are planned. No separate design-system package has been adopted yet.

The GitHub organization is `plu-nz`. Do not rename it.

## Language

English is the official language of the PLUNZ organization. Use English for repository documentation, code comments, issues, pull requests, commit messages, and product copy by default. Product localization may add other languages when explicitly planned.
