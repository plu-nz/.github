# Architecture and technology stack

- **Date:** 2026-11-03
- **Status:** Accepted

## Context

PLUNZ aims to keep products as close to no-cost as practical by using suitable free tiers, minimizing self-hosted services, and avoiding unnecessary providers. These operating constraints shape the backend choice alongside performance and maintainability.

## Decision

Go is the preferred language for efficiency whenever it fits the product's hosting and cost constraints. Use it as the default for CLIs and other non-UI programs that can run without an additional paid or self-hosted service. Prefer Go's standard library before adding frameworks or external dependencies.

Web frontends use **SolidJS + TypeScript + Vite**. Do not use **TanStack Start**. TanStack Router is a separate library and is not prohibited by this decision.

For hosted APIs and backend services, **Hono + TypeScript** is an expected, common choice because many suitable free-tier runtimes execute JavaScript/TypeScript and using them avoids extra self-hosting or providers. Choose **Go** when a suitable hosting path meets the same no-cost, low-operations goals. Do not add hosting cost, a self-hosted service, or another provider solely to use Go. Evaluate the actual runtime, free-tier limits, operational burden, and provider footprint for each product.

| Scenario | Default stack |
| --- | --- |
| Web application without its own backend | SolidJS + TypeScript + Vite |
| Web application with a backend on a suitable free JavaScript runtime | SolidJS + TypeScript + Vite; Hono + TypeScript backend |
| Web application with a backend where Go hosting fits the cost and operations goals | SolidJS + TypeScript + Vite; Go backend |
| Independent hosted API | Hono + TypeScript on a suitable free JavaScript runtime; Go when equally viable to host |
| API on a JavaScript-only runtime | Hono + TypeScript |
| CLI or other non-UI application | Go |
| Worker, automation, or background service | Go when a suitable no-cost runtime supports it; otherwise Hono + TypeScript or another runtime-compatible TypeScript implementation |

## Architectural principles

1. **Simplicity:** Avoid unnecessary abstractions, dependencies, and layers.
2. **Performance:** Favor lightweight, efficient applications with low resource use; use Go where its efficiency is practical to deploy.
3. **Type safety:** Use static types and explicit frontend/backend contracts.
4. **Modularity:** Group features by domain with clear responsibilities.
5. **Maintainability:** Keep code predictable, readable, and easy for AI agents to modify.
6. **Portability:** Avoid excessive dependence on a single provider while keeping the number of providers small.
7. **No-cost infrastructure:** Prefer suitable free tiers, especially Cloudflare and other existing providers where appropriate. Minimize self-hosted services and avoid paid infrastructure unless a product need justifies it.
8. **Testability:** Keep business rules separate from frameworks and infrastructure.

## Project organization

- Do not require a monorepo for every project. Keep small projects simple.
- Combine frontend and backend in a monorepo only when there is a concrete benefit.
- Go-only projects do not need frontend scaffolding.
- Document API contracts and generate frontend types from them where practical.
- Document the hosting, cost, and runtime reasons for each backend choice.
- Do not migrate or rewrite an existing application solely to conform to this standard.

## Agent readiness

Every project repository must include an `AGENTS.md` that describes architecture and responsibilities; code and directory conventions; installation, development, build, lint, and test commands; dependency and implementation guidelines; and validation required before completing a change.

## Consequences

New PLUNZ work starts from these defaults. Most hosted APIs may use Hono + TypeScript because it fits available free tiers; Go remains preferred when it can be deployed efficiently without adding cost or operational burden. Existing projects change implementation only when a product need justifies it. Capture's SolidJS frontend and Hono backend on Cloudflare Workers fit this policy directly.
