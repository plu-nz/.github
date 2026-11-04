# Local project checkouts

This `.github` checkout is the entry point for PLUNZ coding-agent sessions. Run [`./sync-repos.sh`](sync-repos.sh) from any directory to clone all current `plu-nz` projects into `repos/<repository-name>/`. Run it again to discover new repositories and fetch updates. Clean checkouts with an upstream branch are advanced only by a fast-forward pull; checkouts with local work are left in place.

The entire `repos/` directory is ignored by this repository's [`.gitignore`](.gitignore). Each child remains an independent Git repository with its own remote, branches, changes, and `AGENTS.md`. Never copy a child's source into this repository or run `git add -f repos/`.

## Current projects

| Local checkout | Purpose | Repository |
| --- | --- | --- |
| `repos/mono.capture/` | Capture photo portfolio application and API | [plu-nz/mono.capture](https://github.com/plu-nz/mono.capture) |
| `repos/mono.split/` | Split anonymous bill splitter and receipt-scan API | [plu-nz/mono.split](https://github.com/plu-nz/mono.split) |
| `repos/web.home/` | PLUNZ public application hub | [plu-nz/web.home](https://github.com/plu-nz/web.home) |
| `repos/ops.workflows/` | Shared CI and CD workflows | [plu-nz/ops.workflows](https://github.com/plu-nz/ops.workflows) |

The list reflects the projects present when this file was written. The sync script discovers new organization repositories automatically.

## Starting a session

1. Open the session in this repository root and read [AGENTS.md](AGENTS.md), [README.md](README.md), and [CONTEXT.md](CONTEXT.md).
2. Run `./sync-repos.sh` when current remote changes matter. Inspect `git -C repos/<name> status` before editing a product.
3. For product work, read that checkout's `README.md` and `AGENTS.md` (and any more specific instructions). Make changes, commits, and pull requests in the child's repository, not in `.github`.
4. Record cross-product decisions here. Update a product's own documentation for its implementation details.

## Graphify

Graphify can scan the local workspace from this root so questions can refer to shared context and product code together. **Use `--no-gitignore` when extracting from this root**: otherwise Graphify honors `.gitignore` and skips the entire `repos/` directory. Its own built-in noise filtering still prunes `.git`, `node_modules`, and `graphify-out` directories.

For a quick local code index without model calls:

```sh
graphify extract . --no-gitignore --code-only --no-cluster
graphify query "Where is Capture's mobile navigation implemented?"
```

Before rebuilding, check for `graphify-out/graph.json`; if it exists, use `graphify query "<question>"` directly. Re-extract after relevant source changes. The `--code-only` index covers code but not prose documentation; read `README.md`, `AGENTS.md`, and decisions directly or build a fuller graph when those relationships matter. Generated Graphify output is ignored by Git.

The combined workspace may be large. Use Graphify on `repos/<name>/` for product-specific questions or build a full combined graph only when cross-project relationships justify its extraction cost. Graphify reduces repeated source browsing after an index exists; building a full index still takes time and may use model tokens for documentation.
