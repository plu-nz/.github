# Repository naming convention

- **Date:** 2026-11-03
- **Status:** Accepted

## Context

The `devbotzeiss` organization commonly uses repository names such as `web.my_vision_profile`, `api.marketing`, `lib.icons`, `doc.design_system`, and `ops.workflows`. PLUNZ has `mono.capture` and `web.home`, and uses `.github` for its organization profile and shared documentation.

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

Use lowercase English words and underscores between words within `name`, for example `web.photo_portfolio`. Choose the suffix for each product when its name is decided, as with `mono.capture`. Use a hyphen after the name only when a separate qualifier is needed, as in `web.capture-admin`. Choose a type from the actual contents; do not create a `lib` repository for a design-system plan without reusable assets.

The special GitHub repository `.github` keeps its required name and is exempt from this convention.

## Consequences

`mono.capture` follows this convention. New repositories should use the prefix that matches their contents. Product names are decided individually; no shared public product naming formula is imposed.
