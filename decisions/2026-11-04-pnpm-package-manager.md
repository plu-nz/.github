# Package manager for JavaScript and TypeScript projects

- **Date:** 2026-11-04
- **Status:** Accepted

## Context

PLUNZ uses JavaScript and TypeScript in its web applications and hosted APIs. Using different package managers across products creates duplicate lockfiles and inconsistent agent commands.

## Decision

Use **pnpm** for every PLUNZ JavaScript or TypeScript project. Commit `pnpm-lock.yaml`, declare the package manager version in `package.json`, and use `pnpm install --frozen-lockfile` in CI. Documentation and agent instructions must show pnpm commands. Do not use npm, yarn, or Bun to install dependencies or run project scripts in PLUNZ repositories.

This decision does not change the preferred language or hosting choices in the [architecture decision](2026-11-03-architecture-and-stack.md). Go-only projects use Go tooling.

## Consequences

New projects start with pnpm. Existing JavaScript and TypeScript projects should migrate their lockfile and CI commands in a focused change, preserving dependency versions and verifying builds before removing the old lockfile. Avoid mixing lockfiles in one repository.
