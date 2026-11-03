# Repository naming convention

- **Date:** 2026-11-03
- **Status:** Accepted

## Context

The `devbotzeiss` organization commonly uses repository names such as `web.my_vision_profile`, `api.marketing`, `lib.icons`, `doc.design_system`, and `ops.workflows`. PLUNZ has `web.home` and `mono.photo` (previously `mono.capturar`); `.github` holds its organization profile and shared documentation.

## Decision

Use `type.name` for new PLUNZ repositories. The type describes the repository's primary role:

| Type | Use |
| --- | --- |
| `mono` | A product or system whose frontend, backend, or other parts share one repository |
| `web` | A web frontend or website |
| `app` | A standalone client application |
| `api` | A backend API |
| `lib` | A reusable code library or asset package |
| `doc` | Documentation with a scope that needs its own repository |
| `ops` | Shared operational tooling or infrastructure |

Use the product slug from the [product naming convention](2026-11-03-product-naming.md) as the suffix for product repositories, for example `mono.photo` or `web.photo`. Use lowercase English words and underscores between words for non-product names, for example `web.photo_portfolio`. Use a hyphen after the name only when a separate qualifier is needed, as in `web.photo-admin`. Choose a type from the actual contents; do not create a `lib` repository for a design-system plan without reusable assets.

The special GitHub repository `.github` keeps its required name and is exempt from this convention.

## Consequences

New repositories should use the prefix that matches their contents. `mono.photo` follows this convention. Legacy code and deployment identifiers inside it need a separate, validated migration.
