# Decisions

## D-001 — Product scope

**Decision:** Build one small paid Mac dictation utility, not a suite.  
**Status:** Accepted.  
**Reason:** USD $0.99 price and zero-hosting model require low support burden and
a clear instant value proposition.

## D-002 — Native stack

**Decision:** Use Swift/SwiftUI/AppKit bridges and Xcode archive.  
**Status:** Accepted.  
**Reason:** VachaVox depends on macOS-native audio, permissions, menu bar,
accessibility-aware delivery, and app packaging.

## D-003 — Speech strategy

**Decision:** Verify Apple on-device speech as primary; retain original local
engine concepts only as audited fallback.  
**Status:** Pending evidence in P2.  
**Reason:** The system path may create a lighter onboarding and benefit from
current local OS capability, but availability cannot be guessed.

## D-004 — macOS 27 policy

**Decision:** Ship baseline macOS 26; use macOS 27 only for optional
availability-gated refinement once verified locally.  
**Status:** Accepted.  
**Reason:** No submission-critical feature may depend on beta/unverified APIs.

## D-005 — Distribution

**Decision:** Paid Mac App Store at USD $0.99 with public source after license
audit.  
**Status:** Accepted.  
**Reason:** Apple handles payment and updates; source supports trust/portfolio.

## D-006 — Direct delivery feasibility

**Decision:** Make sandboxed hotkey/active-app paste a hard early gate; clipboard
fallback is always required.  
**Status:** Pending P3.  
**Reason:** No unsupported workaround is acceptable.
