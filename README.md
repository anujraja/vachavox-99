# VachaVox 99 — Codex Delivery Packet

This folder is a **control packet** for Codex. It is not the product repository yet.

It turns an empty working folder into the new public product repository:

- GitHub repository: `anujraja/vachavox-99`
- Product name: `VachaVox`
- Distribution: paid Mac App Store app, USD $0.99, one-time purchase
- Architecture: native Swift / SwiftUI / AppKit bridges only
- Hosting: no backend; only a landing page/privacy/support site
- Product: private, offline-first dictation for macOS

## Human start — exactly three steps

1. Extract this ZIP to the folder where you want the project to live:

   ```bash
   mkdir -p ~/Developer/vachavox-99
   unzip VachaVox-99_Codex_Submission_Packet.zip -d ~/Developer
   cd ~/Developer/vachavox-99-codex-packet
   ```

2. Start Codex **in this folder**.

3. Copy and paste the text from [`00-CODEX-GOAL.md`](00-CODEX-GOAL.md).

Codex must read [`AGENTS.md`](AGENTS.md) first, then follow
[`docs/00-FILE-ROUTING.md`](docs/00-FILE-ROUTING.md). The agent will safely
bootstrap the new repo here from `anujraja/agent-project-template`, maintain
its own progress state, and keep producing verified work until it reaches the
submission-ready gate.

## What “submission-ready” means

It does **not** mean Codex has submitted the app to Apple. Apple Developer
Program access, certificates/profiles, App Store Connect agreements, banking
and tax information, price selection, and final submission remain human-only
tasks.

It **does** mean the repository contains a signed-release-ready Xcode project,
a working app, passing tests and QA evidence, required privacy/attribution
documents, App Store copy, screenshot plan, App Review notes, an exact
human-only checklist, and no unresolved product blockers except items that
require Anuj’s Apple account or physical permission prompts.

## The product in one sentence

> Hold a key, speak, and VachaVox types polished text anywhere on your Mac — privately, offline, and without a subscription.

## Important constraints

- Do not build a feature buffet.
- Do not use Tauri, Rust, React, Electron, a webview interface, or a backend.
- Do not copy TypeWhisper, Superwhisper, Wispr Flow, or competitor code, copy,
  screenshots, UX, or proprietary behaviour.
- Preserve only reusable original work from `anujraja/VachaVox`.
- Keep VachaVox 99 public-source-friendly, clean-room, lightweight, and
  genuinely App Store-ready.
