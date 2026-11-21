# Lounge: a Linux TV client for Stremio addons

- **Date:** 2026-11-19
- **Status:** Accepted. Updated 2026-11-20: the name Lounge is confirmed, and the repository is public at `plu-nz/app.lounge`.

## Context

The goal is a Linux app for watching Stremio addon content on a TV with a remote control, similar to [Lumera](https://github.com/LumeraD3v/Lumera). Lumera is a GPL-3.0 Android TV client written in Kotlin and Jetpack Compose for TV.

Two other paths were tried first:

- Reusing PLUNZ TV (`web.stremio_tv`, a Stremio Web fork) through a native shell was rejected; the direction did not suit the user.
- Porting Lumera is not possible, because Android code does not run on Linux.

## Decision

Build **Lounge** (`app.lounge`, a working name) from scratch as a Go + Wails 3 desktop app with a SolidJS + Vite UI. Lumera is used only as a feature and UX reference. Lounge contains no Lumera code, so its GPL-3.0 does not apply.

- **Video:** libmpv renders through its OpenGL API into a `GtkGLArea` placed under the Wails WebKitGTK webview, whose background is transparent. The player UI is HTML drawn over the video in the same window. A spike on Omarchy confirmed this works on GTK 4 and Wayland.
- **Torrents:** the app embeds `anacrolix/torrent` and serves the file over local HTTP with range support, so mpv can stream and seek while pieces download. This avoids Stremio's closed `server.js` and external clients such as aria2 or Transmission, which download pieces out of order and cannot serve a partial file to a player.
- **Addons:** the app talks to the Stremio addon protocol directly from Go. Cinemeta and OpenSubtitles v3 are installed by default; the user installs stream addons by URL.
- **UI:** the UI uses spatial navigation for D-pad remotes and the shared Tinta tokens from `@plunz/storybook`. It is localized in en/pt/es.
- **Framework:** stay on SolidJS 1.9. Solid 2.0 was released on 2026-11-17, but `vite-plugin-solid` 3, `lucide-solid`, and `@plunz/storybook` do not support it yet. Revisit this together with the other PLUNZ apps.
- **Targets:** test on Omarchy first. Packaging for Bazzite (Flatpak or AppImage, launched from Game Mode) comes later.

## Consequences

As with Passport, the mobile-first and installable-PWA rule does not apply to this desktop app. The cgo dependency on libmpv, GTK 4, WebKitGTK 6.0, and epoxy limits the app to Linux.

Not built yet:

- Stremio account sync and profiles
- custom hub rows and themes
- installing addons from a phone through a QR code
- IntroDb skip
- Trakt
- packaging for Bazzite
