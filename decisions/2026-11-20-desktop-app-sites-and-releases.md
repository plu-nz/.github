# Desktop app sites and releases

- **Date:** 2026-11-20
- **Status:** Accepted.

## Context

Lounge and Nexus are Linux desktop apps for a TV. They had no public page and no downloads: the only way to install them was to build from source with `scripts/install.sh`. Web products each have a repository and a subdomain, but a desktop app's page only explains the app and offers its download.

## Decision

- **Pages:** each desktop app gets a landing page on its own subdomain (`lounge.plu.nz`, `nexus.plu.nz`). The page lives in the app's repository, in `site/`, as a separate pnpm project. No `web.*` repository is created for it.
- **Stack:** the page uses the web defaults (SolidJS, TypeScript, Vite, `@plunz/storybook`, Cloudflare Workers Static Assets), the localization decision (en/pt/es with the shared `plunz_locale` cookie), and mobile-first layout. As a marketing page it is not an installable PWA.
- **Releases:** pushing a `v*` tag runs `.github/workflows/release.yml`, which builds the app in an Arch Linux container and publishes `<app>-linux-x86_64.tar.gz` and its SHA-256 sum as a GitHub release. The archive name carries no version, so pages link to `releases/latest/download/<archive>`.
- **Install:** the archive holds the binary, the desktop entry, the icon, and `install.sh`. The same `scripts/install.sh` installs a prebuilt binary inside the archive and builds first inside the repository, so both paths stay in sync.
- **Illustrations:** pages show drawn mockups of the interface, not screenshots with third-party artwork.

## Consequences

Release archives link against the system's GTK 4, WebKitGTK 6.0, and (for Lounge) libmpv, so they target Arch Linux and Omarchy on x86_64. Other distributions need those libraries, and Bazzite still needs Flatpak or AppImage packaging. The page's install steps must change together with `scripts/install.sh` and `scripts/package.sh`. Pages are deployed by hand with `pnpm deploy` in `site/`.
