# Product localization

- **Date:** 2026-11-04
- **Status:** Accepted

## Context

PLUNZ apps serve people who use English, Portuguese, or Spanish. The organization uses English for its repository content, while product interfaces need an explicit localization plan.

## Decision

- Offer English, Portuguese, and Spanish in every user-facing app.
- Default to the browser or operating-system language, including installed apps. Match supported regional language tags to their base language. Use English when no preferred language is supported or a translation is missing.
- Provide an accessible language selector in every app. Let users explicitly choose a language or return to the system default.
- Share an explicit selection between PLUNZ web apps on `plu.nz` and its subdomains with a small, JavaScript-readable `plunz_locale` cookie scoped to `plu.nz`. Save each app's local preference as a fallback when cookies are unavailable. The cookie value is only `en`, `pt`, `es`, or `system`; `system` explicitly prevents an older app-local choice from reappearing. On first visit, migrate a valid app-local choice only when no shared cookie exists.
- Do not require an account or synchronize the choice across devices or browsers. Native store apps, if introduced, need a separate synchronization design.
- Keep each product's text with its source code so interface changes and translations can be reviewed and released together. Localize user-facing interface text, including errors and accessibility labels. Keep repository documentation, code comments, and internal identifiers in English.

## Consequences

Capture's existing localization follows this direction. Split and the PLUNZ home need localization work. Translation variants and locale-sensitive formats can be refined for each product without changing the initial supported language set.

An interface for manually editing translations across products is a future idea. It has no approved architecture or dedicated repository yet.
