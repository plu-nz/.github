# Architecture and technology stack

- **Date:** 2026-11-03
- **Status:** Accepted

## Context

PLUNZ needs a consistent default for new products while allowing deployment constraints and existing applications to shape implementation choices.

## Decision

Go is the primary language for backends, APIs, CLIs, workers, automations, background services, and other software without a graphical interface whenever the target runtime supports it. Prefer Go's standard library before adding frameworks or external dependencies.

Web frontends use **SolidJS + TypeScript + Vite**. Do not use **TanStack Start**. TanStack Router is a separate library and is not prohibited by this decision.

For backends, use **Go** when technically viable. Use **Hono + TypeScript** only when the hosting runtime executes JavaScript/TypeScript only or Go is not viable. Evaluate the real deployment environment before choosing a backend.

| Scenario | Default stack |
| --- | --- |
| Web application without its own backend | SolidJS + TypeScript + Vite |
| Web application with a backend | SolidJS + TypeScript + Vite; Go backend |
| Web application on JavaScript-only hosting | SolidJS + TypeScript + Vite; Hono + TypeScript backend |
| Independent API | Go |
| API on a JavaScript-only runtime | Hono + TypeScript |
| CLI or other non-UI application | Go |
| Worker, automation, or background service | Go when supported; use the runtime-compatible alternative when necessary |

## Architectural principles

1. **Simplicity:** Avoid unnecessary abstractions, dependencies, and layers.
2. **Performance:** Favor lightweight, efficient applications with low resource use.
3. **Type safety:** Use static types and explicit frontend/backend contracts.
4. **Modularity:** Group features by domain with clear responsibilities.
5. **Maintainability:** Keep code predictable, readable, and easy for AI agents to modify.
6. **Portability:** Avoid excessive dependence on a single provider.
7. **Affordable infrastructure:** Prefer free or low-cost services, including Cloudflare where appropriate.
8. **Testability:** Keep business rules separate from frameworks and infrastructure.

## Project organization

- Do not require a monorepo for every project. Keep small projects simple.
- Combine frontend and backend in a monorepo only when there is a concrete benefit.
- Go-only projects do not need frontend scaffolding.
- Document API contracts and generate frontend types from them where practical.
- Document any exception to the default stack with its runtime or product constraint.
- Do not migrate or rewrite an existing application solely to conform to this standard.

## Agent readiness

Every project repository must include an `AGENTS.md` that describes architecture and responsibilities; code and directory conventions; installation, development, build, lint, and test commands; dependency and implementation guidelines; and validation required before completing a change.

## Consequences

New PLUNZ work starts from these defaults. Existing projects adopt the documentation and agent guidance now, then change implementation only when a product need justifies it. Capturar's SolidJS frontend and Hono backend on Cloudflare Workers fit this policy without a rewrite.
