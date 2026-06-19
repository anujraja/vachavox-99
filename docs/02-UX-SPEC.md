# UX Specification — VachaVox 99

## UX law

A nontechnical person should complete setup and their first successful
dictation without reading documentation or seeing a technical model name.

Target: the first success should feel like magic, not configuration.

## First launch — five screens maximum

### 1. Welcome

**Title**  
Speak. VachaVox types.

**Body**  
Private dictation that works anywhere on your Mac.

**Primary**  
Set up VachaVox

**Secondary reassurance**  
No account. No subscription.

No feature grid. No technical explanation. No forced sign-up.

### 2. Prepare offline speech

The app checks the local Mac/locale and chooses the actual recommended route.

**Title**  
Preparing offline dictation

**Body, ready state**  
Recommended for this Mac.

**Body, download state**  
Downloading private speech support.

Show:
- progress;
- plain-language size only when it affects the user's decision;
- cancel/retry only if genuinely supported;
- no engine/model vendor names.

If a local asset is unavailable, explain what is true in plain language and
offer one recovery action. Never expose raw errors.

### 3. Microphone permission

**Title**  
Let VachaVox hear you

**Body**  
Your voice is processed on this Mac.

**Primary**  
Allow Microphone

Request only after the explicit button press. If denied, provide “Open System
Settings” and “Try Again.”

### 4. Typing anywhere

**Title**  
Let VachaVox type for you

**Body**  
Allowing Accessibility lets VachaVox paste your words into the app you are using.

**Primary**  
Enable Typing Anywhere

This must be described accurately:
- it is not required for copy fallback;
- it is only requested when direct text delivery is supported by the tested
  distribution path;
- it may be deferred without trapping the user.

If denied:
- show “Copy to Clipboard instead” as an honest working path;
- leave a simple one-button System Settings recovery route.

### 5. Try it

**Title**  
Try your shortcut

**Body**  
Hold **Fn**, say a sentence, then release.

If Fn cannot be reliably captured in the current configuration:
- choose an accessible alternative, such as Option-Space;
- show the exact combination;
- provide a Change button after setup.

The test must show a visible success state. On success:

**Title**  
You’re ready.

**Primary**  
Start dictating

## Everyday behaviour

### State vocabulary

Use only:
- Ready
- Listening
- Finishing
- Needs attention
- Paused (only if pause is retained for a real user need)

Never expose:
- loading model;
- running decoder;
- Core ML;
- VAD;
- token;
- inference;
- raw error code.

### Menu bar

The status icon is the primary operational control.

Popover:
- current status;
- visible shortcut;
- one main action only when useful;
- “VachaVox is On” switch;
- Settings;
- Quit.

No in-popover model selector, transcript history, file queue, analytics, or
dashboard.

### Overlay

- Position near the focused text field when allowed/reliable.
- Otherwise top-center safe fallback.
- Use short native material card with high contrast.
- Listening: minimal waveform/pulse and optional short chime.
- Finishing: concise subtle status.
- Done: show final text briefly only when useful, then fade.
- Do not steal focus.
- Respect Reduce Motion, Increase Contrast, Reduce Transparency, and VoiceOver.

### Text delivery

Order of preference:
1. Apple-supported direct paste into the app that was focused at dictation start.
2. Copy the cleaned final text to clipboard with a compact confirmation.
3. Do not attempt delivery into secure/password fields where detectable.

A failed paste must never lose the text. Clipboard fallback is a product
guarantee.

## Settings — one small native window

No sidebar. No advanced tab. No model tab.

1. **VachaVox is On** — primary master toggle
2. **Shortcut** — value + Change…
3. **Polish spoken text** — on by default  
   Helper: “Adds light punctuation and removes obvious filler words on this Mac.”
4. **Start VachaVox when you log in**
5. **Play a sound when listening**
6. **Offline speech** — Ready / Needs repair and a real repair action
7. Privacy
8. Support
9. Version
10. Quit

## Language and model UX

- Use the Mac/user preferred supported locale when possible.
- Never show a model catalog in V1.
- The default is “Recommended for this Mac.”
- If a genuine tested fallback choice must be shown, use:
  - Quick
  - Recommended
  - Extra accuracy
- Never show a choice that does not materially change tested behaviour.

## Copy style

Good:
- “VachaVox is ready.”
- “Your words were copied.”
- “Offline speech needs a quick repair.”
- “Hold Fn and speak.”

Bad:
- “Model loading failed.”
- “Inference engine unavailable.”
- “No Core ML asset installed.”
- “Select decoder.”
