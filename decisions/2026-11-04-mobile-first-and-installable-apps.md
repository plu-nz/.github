# Mobile-first and installable product apps

- **Date:** 2026-11-04
- **Status:** Accepted

## Context

PLUNZ products are small tools that people should be able to reach and use comfortably on a smartphone. The product apps need a consistent mobile baseline and a way to live on the home screen without requiring a native app release.

## Decision

Design **every PLUNZ product app mobile first**. Start with the smallest supported phone viewport and the primary task, then adapt the same flow to larger screens. Put frequent navigation and primary actions within easy thumb reach, favoring the lower part of the screen. Use bottom navigation when an app has several persistent top-level destinations; a simple flow may use a bottom action instead. Respect safe-area insets, the on-screen keyboard, zoomed text, touch targets, visible focus, and screen-reader semantics. Do not cover content with fixed controls.

Make **every web product app installable on smartphones** as a Progressive Web App. Serve it over HTTPS with a product-specific web app manifest, name, start URL, standalone display mode, and suitable square icons, including 192px and 512px sizes. Use an appropriate maskable icon where supported. Check installation and launch from the home screen on representative Android and iOS browsers; provide plain instructions where the browser does not show an install prompt. Installation must not require an account or an app store unless the product itself has an independently justified account requirement.

Offline behavior is decided per product. At minimum, an installed app should open to a useful shell or clear connection state when offline; features that require a network or external AI service may say so. Document any offline data retention and update behavior in the product repository.

The PLUNZ marketing hub is a website, not a product app, and is outside this installability requirement.

## Consequences

New product work includes mobile layout and smartphone installation checks in its completion criteria. Existing product apps should be audited and brought into compliance through focused changes; this decision does not authorize unrelated rewrites. Each product owns its manifest, icons, offline behavior, and device validation.

Browser installation behavior varies by platform; the product must not promise an automatic prompt everywhere. See [MDN's installability guide](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable) for the current technical baseline.
