# Product naming convention

- **Date:** 2026-11-03
- **Status:** Accepted

## Context

PLUNZ is a family of focused applications. The earlier Portuguese working names do not fit the organization's English-first language policy and are difficult to extend into a recognizable family. Repository names already use the separate `type.name` convention.

## Decision

Use **PLUNZ + one short, plain English functional noun** as each product's public name. The noun should tell a new visitor what the app helps them manage or make. The `PLUNZ` prefix is always present in store listings, the hub, metadata, and first-use contexts; a compact interface may show the noun alone when the parent brand is already clear.

Derive one lowercase ASCII slug from the noun. Use that slug consistently for a product's intended subdomain and repository suffix: `<slug>.plu.nz` and `<type>.<slug>`. The repository prefix still describes its actual contents, as defined by the [repository naming convention](2026-11-03-repository-naming.md). A product may have `mono.photos`, or separate `web.photos` and `api.photos` repositories; do not add `mono.` unless it is a monorepo. The organization hub remains `web.home`.

Choose names by this checklist:

1. Use an ordinary English word that is easy to spell, pronounce, and recognize without knowing PLUNZ.
2. Prefer a concrete user domain or outcome over an invented word, abbreviation, internal technology, or metaphor.
3. Keep the noun and slug short, ideally one word. Use a two-word noun only when one word would mislead; join its slug with an underscore in repository names and a hyphen in DNS names if needed.
4. Check meaning, potential collisions, and public availability before an external launch. A working name can change before release, but do not create a separate naming style for each app.
5. Avoid names that promise functionality the product does not provide. Product copy must state the audience and current scope.

| Product concept | Public name | Slug | Intended address | Repository name when migrated |
| --- | --- | --- | --- | --- |
| Personal photo portfolio and albums | **PLUNZ Photos** | `photos` | `photos.plu.nz` | `mono.photos` |
| Meal and meal-prep planning | **PLUNZ Meals** | `meals` | `meals.plu.nz` | Choose prefix from eventual structure |
| Psychologist practice scheduling and administration | **PLUNZ Practice** | `practice` | `practice.plu.nz` | Choose prefix from eventual structure |

These are product names, not a promise that their apps or addresses are live. The existing photo application still has legacy code, package, repository, and deployment identifiers. Migrate them deliberately with redirects, OAuth and API configuration checks, and deployment validation; do not perform an unrelated code rewrite just to change a name.

## Consequences

The hub and shared documentation use the new public names. Historical references may retain the former names when they identify existing resources or migration work. Future products use the same naming checklist and slug mapping. Before a product launch, verify its public name and address against external conflicts and actual feature scope.
