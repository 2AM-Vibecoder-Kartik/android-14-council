# Android 14-Agent Pre-Launch & Anti-Vibe-Coding Council (`android-14-council`)

**Created by [Kartik (@2AM-Vibecoder-Kartik)](https://github.com/2AM-Vibecoder-Kartik)**

Stop shipping AI-generated ("vibe-coded") vulnerabilities, memory leaks, and Google Play Store rejections.

**`android-14-council`** is a zero-API-key Claude Code skill & plugin (inspired by Andrej Karpathy's LLM Council methodology) that orchestrates **14 independent specialist sub-agents** across your **Flutter**, **Native Android (Kotlin/Java)**, or **React Native** repository.

Every check is governed by a strict **2x Double-Verification Rule** (Pass 1 pattern scan + Pass 2 `file:line` data-flow trace), followed by anonymized peer review and a beginner-friendly **Chairman Remediation Playbook** with copy-paste `Before`/`After` fixes.

---

## ⚡ 1-Command Direct Install into Claude Code

Install straight from GitHub into Claude Code using any of the 3 official methods below:

### Option 1 — via `npx skills` CLI (Works across Claude Code, Cursor & Windsurf)
```bash
npx skills add 2AM-Vibecoder-Kartik/android-14-council -a claude-code -g
```

### Option 2 — via Native Claude Code `/plugin` Marketplace (Inside Claude Code)
Run these two commands directly inside any Claude Code session:
```text
/plugin marketplace add 2AM-Vibecoder-Kartik/android-14-council
/plugin install android-14-council@android-14-council-marketplace
```

### Option 3 — Direct `git clone` into `~/.claude/skills/`
**macOS / Linux:**
```bash
git clone https://github.com/2AM-Vibecoder-Kartik/android-14-council.git ~/.claude/skills/android-14-council
```
**Windows (PowerShell):**
```powershell
git clone https://github.com/2AM-Vibecoder-Kartik/android-14-council.git "$env:USERPROFILE\.claude\skills\android-14-council"
```

---

## 🚀 How to Run It in Claude Code

Once installed, open Claude Code inside any Flutter, Native Android, or React Native project root and either run the slash command:
```text
/android-14-council
```
or type in natural language:
- `"run 14-agent audit"`
- `"council test this"`
- `"vibe check app"`
- `"pre-launch android council"`

The council will audit the project and save the full report to `./council-reports/pre-launch-audit-<YYYY-MM-DD>.md`.

---

## Why This Exists (The 12 Classic Vibe-Coding Traps)

LLMs are trained on years of public repositories containing deprecated Android SDKs, insecure StackOverflow snippets, and tutorial shortcuts. Every agent actively hunts for these 12 pitfalls:
1. Outdated `targetSdk` (`< 36`) & unencrypted `SharedPreferences`
2. Client-only role/admin checks (`if (isAdmin)`) without backend verification
3. Hardcoded API keys (`AIza...`, `sk-...`, `.env` bundled inside `assets/`)
4. Silent `try { ... } catch (e) {}` blocks swallowing failed DB/network writes
5. $O(N)$ / $O(N^2)$ full-table loads into memory instead of indexed SQL queries
6. Fake/stubbed encryption (Base64 disguised as encryption, static IVs)
7. Biometric checks without a Keystore `CryptoObject` (bypassable via Frida in seconds)
8. Trust-all SSL overrides (`badCertificateCallback = true`) left in release builds
9. Unvalidated deep links, `WebView` JS injection, and `android:exported="true"` leaks
10. 1,000+ line God-files mixing UI, SQL, and HTTP state
11. Missing `dispose()` / `onCleared()` causing OOM crashes on 3 GB RAM phones
12. Missing button debounce & idempotency keys causing duplicate bills/payments on reconnect

---

## The 14 Specialist Agents

| Wave | # | Agent Persona | Core Audit Scope |
| :--- | :--- | :--- | :--- |
| **Wave 1: Code & Build** | 1 | Clean Architecture Auditor | God-files (`>400` lines), layer leaks, silent `catch (e) {}` traps |
| **Wave 1: Code & Build** | 2 | Lifecycle & Async Leak Hunter | Missing `dispose()`/`onCleared()`, post-`await` unmounted context crashes |
| **Wave 1: Code & Build** | 3 | Complexity & Local DB Profiler | $O(N)$ loops on 10k+ rows, missing SQLite/Room indexes, lazy pagination |
| **Wave 1: Code & Build** | 4 | Gradle, Manifest & Play Gatekeeper | API 36+, R8 + `--obfuscate`, `allowBackup="false"`, AAB size, Robo-crawler readiness |
| **Wave 1: Code & Build** | 5 | *Slot A:* Hardware/BLE OR Deep-Links | Android 12+ BLE/Printer/Mic disconnects *OR* App Links & `PendingIntent` safety |
| **Wave 2: Resilience & Chaos** | 6 | Offline & Sync Burst Engineer | Airplane mode, exponential backoff with jitter, UUID idempotency keys |
| **Wave 2: Resilience & Chaos** | 7 | Low-RAM (3 GB) & 16ms Profiler | Isolate/Coroutine offloading, widget rebuilds, `onTrimMemory` survival |
| **Wave 2: Resilience & Chaos** | 8 | The Impatient Chaos User | Rapid double-tap submit locks, mid-flow process death, emoji/SQLi inputs |
| **Wave 2: Resilience & Chaos** | 9 | Localization (`l10n`) & Script Tester | 100% locale key parity, hardcoded strings, Indic/RTL glyph clipping |
| **Wave 2: Resilience & Chaos** | 10 | Accessibility & Font Scaler | `2.0x` system font overflow, `48x48dp` touch targets, TalkBack `Semantics` |
| **Wave 3: Security & Legal** | 11 | *Slot B:* Financial/REA OR Data Integrity | Append-only REA ledger events & integer currency *OR* DB migrations |
| **Wave 3: Security & Legal** | 12 | SAST, SDK Index & Play Protect Auditor | Leaked `.env`/keys, CVE scan, Google Play SDK Index, Play Protect PHA triggers |
| **Wave 3: Security & Legal** | 13 | DAST, MASA & OWASP MASVS Red Teamer | SQLCipher + Keystore, Biometric `CryptoObject`, TLS pinning, Play Integrity API |
| **Wave 3: Security & Legal** | 14 | Global Legal & Play Policy Reviewer | Play Data Safety & Account Deletion, India DPDP 2023 + CERT-In 2022, GDPR, CCPA |

---

## Author & License

- **Author:** [Kartik (@2AM-Vibecoder-Kartik)](https://github.com/2AM-Vibecoder-Kartik)
- **License:** MIT License
