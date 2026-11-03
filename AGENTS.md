# Agent instructions

This repository is the source of shared PLUNZ context. Read `README.md` and `CONTEXT.md` before proposing changes that affect the brand or multiple products.

- Treat product names and subdomains as tentative where indicated. The GitHub organization is `plu-nz`; do not rename it.
- Distinguish confirmed facts, proposals, and pending decisions.
- Write repository content in English, including documentation, code comments, issues, pull requests, commit messages, and product copy. Add other languages only for explicitly planned product localization.
- Record shared decisions in `decisions/`; keep product details in each product repository.
- Keep this repository flat. Every directory and nested directory must have a `README.md` that summarizes its purpose and links to its contents and relevant parent context. Update the index when adding, moving, or removing files.
- Name new repositories using the `type.name` convention in `decisions/2026-11-03-repository-naming.md`.
- Apply `decisions/2026-11-03-architecture-and-stack.md` to new work: SolidJS + TypeScript + Vite for web UIs; Hono + TypeScript for hosted APIs on suitable free JavaScript runtimes; Go when it fits no-cost hosting and low-operations goals, especially for CLIs and non-UI programs. Do not use TanStack Start.
- Every product repository must have an `AGENTS.md` covering its architecture, responsibilities, directory and code conventions, install/development/build/lint/test commands, dependency policy, and completion checks.
- Prefer simple, modular, no-cost solutions. Use suitable free tiers, minimize self-hosted services, and keep the provider count small. Cloudflare is preferred where appropriate, not required for every component.
- Treat shared design-system tokens, icons, and components as planned work. SolidJS is the web UI standard, but no separate design-system package or Storybook setup has been approved.
- Do not assume access to a user's Google Drive or Photos, or select an integration before validating permissions, limits, and the intended user experience.
- When working on a product, also read that product repository's instructions.
