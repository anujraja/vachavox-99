# App Store Gate — Required Before Calling VachaVox 99 Submission-Ready

## Distribution intent

- Platform: Mac App Store.
- Commercial model: paid app, USD $0.99, one-time purchase.
- No StoreKit, subscriptions, trials, unlocks, ads, or external purchase links
  are needed for V1.
- Apple handles checkout and update delivery.
- Source code may be public, but the store app is a polished, signed,
  sandboxed convenience distribution.

## Required engineering evidence

### 1. Xcode project and archive

- Native app target + unit/UI test targets.
- Valid bundle identifier placeholder documented for Anuj.
- Apple Silicon build.
- macOS 26 deployment baseline.
- Debug and Release configuration.
- Release archive succeeds as far as local signing credentials permit.
- A reproducible `xcodebuild` archive/export procedure exists.
- App icon, version/build number, privacy manifest, and Info.plist are valid.

### 2. Sandbox / permissions

- App Sandbox configured with least privilege.
- Microphone usage string is accurate and shown before request.
- Any network capability is absent unless a real asset-install path requires it.
- No broad file entitlement; V1 excludes file transcription.
- No Apple Events automation by default.
- Accessibility is treated as a user-controlled Privacy & Security permission,
  not an entitlement bypass.
- Direct text delivery has an honest tested App Store-compatible path or the
  product falls back to copy without losing text.
- Privacy manifest matches actual API/dependency behaviour.

### 3. Privacy / support

- Public privacy policy page content exists.
- In-app Privacy link exists.
- Support URL and support email placeholders exist.
- App Store privacy answers are drafted from actual data behaviour.
- “No data collected” is used only if a full dependency/network audit proves it.
- Required third-party and model attribution is included.

### 4. App Review package

`docs/08-RELEASE-PACK.md` must contain:
- app name, subtitle, description, keywords;
- price setup notes;
- category recommendation;
- age-rating notes;
- screenshot storyboard;
- reviewer path for onboarding;
- explanation of microphone request;
- explanation of Accessibility and clipboard fallback;
- explanation of offline speech asset preparation;
- test account statement: no account required;
- known limitation statement if direct paste differs in sandbox/review.

### 5. Quality gates

- Fresh install success.
- Offline after setup.
- Permission denied recovery.
- Copy fallback preserves output.
- No secure-field surprises.
- VoiceOver / keyboard / contrast / Reduce Motion checks.
- No crash on no-asset, failed-asset, or network-offline state.
- Build/test/QA evidence present.

## Human-only finish line

Anuj must complete:
1. Apple Developer Program membership / team agreement.
2. Bundle identifier registration if Xcode cannot manage it automatically.
3. Signing certificates/profiles or automatic signing approval.
4. App Store Connect record.
5. App name availability and SKU.
6. USD $0.99 pricing and storefront availability.
7. Banking/tax/legal agreements.
8. Upload signed archive.
9. Add screenshots/metadata/privacy/support URLs.
10. Answer export-compliance/age-rating/other App Store Connect questions based
    on the final binary.
11. Submit for review.

Codex prepares every artifact and tells Anuj the exact remaining screen/value.
It must never claim to have performed these account actions.
