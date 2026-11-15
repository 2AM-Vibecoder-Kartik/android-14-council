---
name: android-14-council
description: "Universal 14-agent Android, Flutter, and React Native pre-launch security, performance, and legal compliance council with 2x Double-Verification and anti-vibe-coding checks. Trigger with run 14-agent audit, council test this, vibe check app, or pre-launch android council."
---

# Universal 14-Agent Android Pre-Launch & Anti-Vibe-Coding Council

Orchestrate a rigorous, 3-stage pre-launch audit of any **Flutter**, **Native Android (Kotlin/Java)**, or **React Native** repository using 14 independent specialist sub-agents, a mandatory **2x Double-Verification Rule**, anonymized peer review, and a beginner-friendly Chairman Remediation Playbook.

## Core Operating Principles (Non-Negotiable Thumb Rules)

### 1. The 2x Double-Verification Thumb Rule

Every single check in this council **MUST be verified at least TWO times (2x)** before it can be marked `PASS` or reported as a confirmed bug:

* **Pass 1 — Automated / Pattern Scan (Breadth):** Search across the codebase using exact regexes, manifest/Gradle keys, and static analysis commands (`dart analyze`, `./gradlew lint`, `npx eslint`, dependency graphs) to locate all candidate occurrences.

* **Pass 2 — Deep Contextual & Data-Flow Trace (Depth):** Open and read the actual surrounding source file (`file:line`), tracing the variable, state, or permission from input/UI all the way to storage/network/OS execution to confirm whether the safeguard actually runs in production (or is dead/commented-out/mocked code).

* **Cross-Agent Redundancy:** Every critical domain (Security, Storage, Lifecycle, Manifest, Offline Sync, Legal) is intentionally assigned to **at least two separate agents** from different angles (e.g., Static SAST vs. Runtime Red-Team DAST) so no single-agent blind spot survives.

### 2. The Anti-Vibe-Coding Mandate (Why AI Code Fails in Production)

AI coding assistants are trained on years of historical public repositories containing outdated SDKs, insecure StackOverflow snippets, and tutorial shortcuts. Every agent MUST actively hunt for these **12 Classic Vibe-Coding Traps**:

 1. **Hallucinated or Outdated APIs & SDKs:** Targeting old Android SDKs (`< 36`), using deprecated `compile` instead of `implementation`, `SharedPreferences` instead of `EncryptedSharedPreferences`/Keystore, or deprecated Android `AsyncTask` / `onBackPressed()`.

 2. **Trusting the Client for Auth & Roles:** Hiding an "Admin" or "Paid/Pro" button in the UI (`if (isAdmin)`) without enforcing role/entitlement checks on the backend or verifying cryptographic tokens.

 3. **Hardcoded Secrets & Open Backend Rules:** Leaving Firebase/Supabase/AWS keys, OpenAI/Gemini API keys, or webhook URLs inside `.dart`, `.kt`, `.ts`, `.env` bundled in assets, or `strings.xml`, paired with permissive database rules (`allow read, write: if true;`).

 4. **Silent `try { ... } catch (e) {}` Blocks:** AI loves swallowing exceptions to stop crashes during prompting—hiding failed database writes, broken network calls, and corrupted ledger states.

 5. **Unbounded Loops & Full-Table Fetches (`O(N)` / `O(N²)`):** Loading an entire SQLite/Firestore/Room table into memory and filtering in Dart/JS/Kotlin instead of using indexed SQL `WHERE` + `LIMIT/OFFSET` queries.

 6. **Fake / Stubbed Security:** Writing a function named `encryptData()` or `verifyIntegrity()` that only does Base64 encoding, returns `true`, or uses a hardcoded AES key/IV (`"1234567890123456"`).

 7. **Broken Cryptography & Weak Randomness:** Using `MD5`, `SHA-1`, `AES/ECB`, `Random()` instead of `SecureRandom()`, or omitting `CryptoObject` in `BiometricPrompt` (allowing Frida bypass in 3 lines of script).

 8. **Blind SSL/TLS Bypass Snippets:** Copy-pasting `badCertificateCallback = (cert, host, port) => true` or `X509TrustManager` that accepts all certificates to "fix" local development SSL errors and forgetting it in release builds.

 9. **Unvalidated Deep Links, WebViews & Intents:** Enabling `javaScriptEnabled = true` and `allowFileAccess = true` on `WebView` while loading untrusted URLs/params, or leaving `android:exported="true"` on internal Activities/Receivers.

10. **God-Files & Spaghetti State:** Dumping 1,000+ lines of UI, SQL queries, HTTP calls, and business logic into a single file (`ledger.dart`, `MainActivity.kt`, `App.tsx`), making state mutations unpredictable.

11. **Missing Cleanup & Memory Leaks:** Creating `TextEditingController`, `StreamSubscription`, `Timer`, `AnimationController`, or `BroadcastReceiver` without disposing/unregistering them on screen exit.

12. **Double-Tap & Reconnect Floods:** No debounce/mutex on "Pay", "Save", or "Sync" buttons, and no idempotency keys on network requests—causing duplicate bills/charges when a user taps twice or regains 4G signal.

### 3. Beginner / Vibe-Coder Friendly Output

Assume the developer may not be a security engineer or Staff Android Architect. For every issue found:

* Explain **What goes wrong in plain language** (e.g., *"Any hacker can unzip your APK in 10 seconds and steal this key"*).

* Show **Exact File & Line** (`file:line`).

* Provide **Copy-Pasteable Fix Code** (Before vs. After) so a solo/vibe coder can fix it immediately.

## Stage 1: Stack Auto-Detection & Baseline Discovery

Before spawning sub-agents, inspect the repository root in one pass to detect the stack, domain, and target privacy region:

1. **Auto-Detect Framework & Run Read-Only Baseline Checks:**

   * **Flutter** (`pubspec.yaml` present):

     * Inspect `pubspec.yaml`, `analysis_options.yaml`, `lib/`, `test/`, `l10n/`, and `android/app/`.

     * Run `flutter --version`, `dart analyze`, and `flutter test --reporter compact`.

   * **Native Android — Kotlin/Java** (`settings.gradle*` or `app/build.gradle*` present, no `pubspec.yaml`):

     * Inspect `app/build.gradle*`, `gradle/libs.versions.toml`, `app/src/main/`, `res/values*/strings.xml`, and `app/src/test/`.

     * Run `./gradlew lintDebug` and `./gradlew testDebugUnitTest`.

   * **React Native** (`package.json` with `react-native` + `android/`):

     * Inspect `package.json`, `tsconfig.json`, `src/` or `app/`, and `android/app/`.

     * Run `npx eslint .`, `npm test -- --watchAll=false`, and `cd android && ./gradlew lintDebug`.

2. **Inspect Shared Android & Release Configuration:**

   * `android/app/build.gradle` or `build.gradle.kts` (`compileSdk`, `targetSdk`, `minSdk`, `isMinifyEnabled`, `isShrinkResources`, `proguardFiles`, signingConfigs, ABI splits).

   * `android/app/src/main/AndroidManifest.xml` (all `<uses-permission>` tags, `android:allowBackup`, `android:debuggable`, `android:exported`, `android:networkSecurityConfig`, `<intent-filter>` deep links).

   * `android/app/src/main/res/xml/network_security_config.xml` and `android/app/proguard-rules.pro`.

   * File size & line-count scan across source directories (flag any source file `> 400` lines and any binary/asset `> 10 MB`).

3. **Activate Conditional Domain Plug-In Slots & Privacy Region:**

   * **Slot A (Agent 5):** If `AndroidManifest.xml` or dependencies include `BLUETOOTH*`, `NFC`, `USB`, `CAMERA`, or `RECORD_AUDIO`, activate **Hardware, BLE, Printer & Audio Edge Tester**; otherwise activate **Deep Links, Notifications & IPC Intent Tester**.

   * **Slot B (Agent 11):** If the repo handles money, ledgers, invoices, carts, wallets, subscriptions, or in-app purchases, activate **Financial, Billing & REA Ledger Auditor**; otherwise activate **Data Integrity, Schema Migration & Form Edge-Case Tester**.

   * **Privacy Region (Agent 14):** Always enforce **Google Play Store Global Baseline** plus regional modules detected from app locales/docs (or all three if global): **India (`DPDP Act 2023` + `CERT-In 2022`)**, **EU (`GDPR`)**, and **US (`CCPA` / `COPPA`)**.

4. Compile a **Shared Context Brief** (max 700 words) summarizing the stack, file counts, largest files, permissions, dependencies, and analyzer output. Pass this brief to all 14 sub-agents.

## Stage 2: 14-Agent Parallel Audit (With Mandatory 2x Verification)

Spawn the 14 specialist sub-agents in **3 parallel waves** (5 + 5 + 4). Every sub-agent must execute **Pass 1 (Pattern Scan)** and **Pass 2 (Deep Contextual Trace)** on its checklist items.

### Sub-Agent Prompt Template

> You are **\[Agent # & Name\]** on the Universal 14-Agent Android Pre-Launch Council.
> **Detected Stack:** \[Flutter / Native Kotlin-Java / React Native\]
> **Your Mission:** \[Insert Agent Mission & Checklist below\]
> **Shared Context Brief:** \[Insert Brief\]
>
> **Mandatory Rules:**
>
> 1. **Execute the 2x Double-Verification Rule on every check:**
>
>    * **Check Pass 1 (Scan):** Search files/configs for the pattern or setting.
>
>    * **Check Pass 2 (Trace):** Read the surrounding code (`file:line`) to verify real data flow and confirm it isn't bypassed, mocked, or silently caught.
>
> 2. **Hunt Vibe-Coding Traps:** Flag AI-generated shortcuts (silent `catch (e) {}`, hardcoded secrets, fake encryption, missing `dispose()`, `O(N)` full-table loads, missing debounce/idempotency).
>
> 3. **Format every finding for a solo/vibe developer:**
>
>    * **Severity:** `P0 Blocker` | `P1 High` | `P2 Medium`
>
>    * **Location:** Exact `file:line`
>
>    * **2x Verification Proof:** `[Pass 1: Found X in file] -> [Pass 2: Traced Y at line Z confirming bug]`
>
>    * **Plain-English Impact:** Why this crashes, loses data, gets rejected by Google Play, or lets hackers in.
>
>    * **Copy-Paste Fix:** Exact code or config snippet to fix it.
>
> 4. If a check passes both Pass 1 and Pass 2, record `PASS (2x Verified: file:line)`.

### Wave 1 — Code Architecture, Memory & Android Build Gates (Agents 1–5)

#### Agent 1: Clean Architecture & Anti-Spaghetti Auditor

* **Check 1.1 — God-File & Responsibility Split:**

  * *Pass 1:* List all source files `> 400` lines.

  * *Pass 2:* Inspect each oversized file to check if UI rendering, business logic, and raw SQL/HTTP calls are mixed together. Provide a concrete file-split plan.

* **Check 1.2 — Layer Boundary & Dependency Direction:**

  * *Pass 1:* Scan imports in `domain/` (or core business models) for UI (`flutter/material.dart`, `android.view.*`, `react-native`) or direct DB/network SDK imports.

  * *Pass 2:* Trace how UI components trigger data changes—verify unidirectional data flow (UI -> ViewModel/Controller -> UseCase/Repository -> Data Source).

* **Check 1.3 — Silent Exception Swallowing (Vibe-Code Trap):**

  * *Pass 1:* Search for `catch (e) {}`, `catch (_) {}`, `catch (Exception e) { e.printStackTrace(); }`, or `.catchError((_) => null)`.

  * *Pass 2:* Trace each catch block to ensure errors are logged safely and surfaced to the user or retry queue instead of silently corrupting state.

#### Agent 2: Lifecycle, Async & Memory Leak Hunter

* **Check 2.1 — Controller, Stream & Listener Disposal:**

  * *Pass 1:* Scan all `StatefulWidget` / `ViewModel` / `Activity` / `Fragment` / `useEffect` files for `TextEditingController`, `ScrollController`, `AnimationController`, `FocusNode`, `StreamSubscription`, `Timer`, `BroadcastReceiver`, or event listeners.

  * *Pass 2:* Verify every single instance is canceled/disposed in `dispose()` / `onCleared()` / `onDestroy()` / `useEffect` cleanup.

* **Check 2.2 — Async Gap & Unmounted Context Crashes:**

  * *Pass 1:* Search for `await` followed by `context.`, `Navigator.`, `ScaffoldMessenger.`, `setState`, or Fragment transaction calls.

  * *Pass 2:* Confirm `if (!mounted) return;` (Flutter), `lifecycleScope` (Kotlin), or abort controller checks guard every post-`await` UI call.

* **Check 2.3 — Unbounded Cache & Image Memory Leaks:**

  * *Pass 1:* Scan image loading (`Image.asset`, `Image.network`, `Glide`, `Coil`, `FastImage`) and in-memory lists/maps.

  * *Pass 2:* Verify `cacheWidth`/`cacheHeight` or downsampling is used for high-res images and in-memory caches have a max size or eviction policy.

#### Agent 3: Time Complexity ($O(\log N)$) & Local Database Profiler

* **Check 3.1 —** $O(N)$ **/** $O(N^2)$ **In-Memory Filtering & Nested Loops:**

  * *Pass 1:* Search for `.where(`, `.filter(`, `.map(`, `.sort(`, and nested `for`/`forEach` loops over database query results.

  * *Pass 2:* Trace what happens when a user has **10,000+ rows** (e.g., 2 years of bills/messages). Move filtering, sorting, and `SUM()` aggregation into indexed SQL queries.

* **Check 3.2 — SQLite / Room / Realm Index Verification:**

  * *Pass 1:* Locate all `CREATE TABLE`, `@Entity`, or schema definitions and all `WHERE`, `JOIN`, and `ORDER BY` clauses.

  * *Pass 2:* Confirm `CREATE INDEX` exists for every foreign key (`customer_id`, `user_id`), `timestamp`/`created_at`, and search column.

* **Check 3.3 — Pagination & Lazy Rendering:**

  * *Pass 1:* Inspect all scrollable lists (`ListView`, `LazyColumn`, `RecyclerView`, `FlatList`).

  * *Pass 2:* Verify builder/lazy constructors (`ListView.builder`, `PagingData`, `LIMIT/OFFSET` cursor pagination) are used—never rendering `.toList()` inside a `Column` or `SingleChildScrollView`.

#### Agent 4: Gradle, Manifest, R8 & Play Pre-Launch Gatekeeper

* **Check 4.1 — Target SDK 36+ & Play Store ABI/Bundle Compliance:**

  * *Pass 1:* Check `compileSdk` and `targetSdk` in `build.gradle*` (must be `>= 36` for Google Play 2026 requirements) and check APK/AAB size (`< 200 MB` base download, ideally `< 40 MB`).

  * *Pass 2:* Inspect bundled assets/native `.so` libraries (`ai_edge` models, unoptimized PNGs/fonts) and verify Play Asset Delivery or on-demand download is used for heavy models.

* **Check 4.2 — R8 Shrinking, ProGuard & Dart/JS Symbol Obfuscation:**

  * *Pass 1:* Check `isMinifyEnabled = true` and `isShrinkResources = true` in `buildTypes.release` and inspect `proguard-rules.pro`.

  * *Pass 2:* Verify release build scripts include `--obfuscate --split-debug-info=build/symbols` (Flutter) or Hermes bytecode + ProGuard mapping archiving, and confirm reflection/serialization models (`@Keep` / `fromJson`) won't crash in release mode when R8 strips classes.

* **Check 4.3 — Manifest Hardening & Play Pre-Launch Robo Readiness:**

  * *Pass 1:* Inspect `AndroidManifest.xml` for `android:debuggable`, `android:allowBackup`, `android:fullBackupContent`, `android:dataExtractionRules`, and `android:exported`.

  * *Pass 2:* Confirm `allowBackup="false"` (or encrypted exclusion of auth/db files), `debuggable="false"`, explicit `android:exported="false"` on all internal components, and no crash triggers when Google Play's automated **Firebase Robo Crawler** clicks every screen without prior setup.

#### Agent 5: Conditional Slot A — Hardware/BLE/Audio OR Deep-Link/IPC Tester

* **If Hardware/BLE/Audio/Camera permissions exist (`BLUETOOTH*`, `RECORD_AUDIO`, `CAMERA`, `NFC`):**

  * *Check 5A.1 (Android 12+ Permission Split):* 2x verify `BLUETOOTH_SCAN` (`neverForLocation` flag), `BLUETOOTH_CONNECT`, and `RECORD_AUDIO` runtime permission flows, including graceful recovery when the user taps *"Don't Allow"*.

  * *Check 5A.2 (Thermal Printer / BLE Disconnect Chaos):* 2x trace socket/GATT write loops (`58mm`/`80mm` ESC/POS chunks, MTU size, buffer overflow) to verify timeouts, paper-out/disconnect handling, and socket closure in `finally` blocks.

* **Otherwise (Deep Links, Notifications & Intent Security):**

  * *Check 5B.1 (App Links & Intent Spoofing):* 2x verify `<intent-filter android:autoVerify="true">`, incoming URI parameter sanitization, and protection against malicious deep links navigating to internal screens without auth.

  * *Check 5B.2 (`PendingIntent` & Broadcast Safety):* 2x verify every `PendingIntent` specifies `FLAG_IMMUTABLE` (required on Android 12+) and internal broadcasts use `LocalBroadcastManager` or signature permissions.

### Wave 2 — Runtime Resilience, Frame Budgets & User Chaos (Agents 6–10)

#### Agent 6: Offline-First, Sync Burst & Traffic Flood Engineer

* **Check 6.1 — True Offline Operation & Atomic Local Writes:**

  * *Pass 1:* Trace all core user actions (creating records, viewing history, searching) when network connectivity is `none` or airplane mode is active.

  * *Pass 2:* Verify local DB writes succeed immediately without blocking on HTTP calls, and outbox/sync queues persist across app restarts.

* **Check 6.2 — Reconnect Flood, Exponential Backoff & Jitter:**

  * *Pass 1:* Inspect retry loops, `WorkManager` constraints, and network interceptors.

  * *Pass 2:* Confirm failed sync calls use **exponential backoff with random jitter** (never tight `while` retry loops or instant retry storms that DDoS your own backend when 4G returns).

* **Check 6.3 — Idempotency Keys on Every Mutating Request:**

  * *Pass 1:* Scan all `POST` / `PUT` / `PATCH` / sync upload calls.

  * *Pass 2:* Verify each mutation sends a client-generated deterministic **UUID idempotency key** so retrying a timed-out request never creates duplicate database rows or double charges.

#### Agent 7: Low-RAM (3 GB) & 16ms Frame Budget Profiler

* **Check 7.1 — Main-Thread Blocking & Isolate/Coroutine Offloading:**

  * *Pass 1:* Search for heavy CPU work: JSON parsing of large payloads, PDF/image compression, encryption/hashing, phonetic/fuzzy search, or on-device AI (`ai_edge` / TFLite / ONNX).

  * *Pass 2:* Confirm all work taking `> 8 ms` runs inside `Isolate.run` / `compute()` (Flutter), `Dispatchers.Default`/`IO` (Kotlin), or background threads—keeping the UI thread under the **16.6 ms (60 Hz) / 8.3 ms (120 Hz)** frame budget.

* **Check 7.2 — Widget Rebuilds & Low-RAM OOM Survival:**

  * *Pass 1:* Check root state providers, `setState()` placement, `const` widget constructors, and `saveLayer()` / `Opacity` / clipped shadows in scrolling lists.

  * *Pass 2:* Trace memory behavior under Android `onTrimMemory()` / low-RAM conditions (3 GB budget devices) to ensure ML models or large bitmaps are released when backgrounded.

#### Agent 8: The Impatient Chaos User (Edge-Case & Double-Tap Breaker)

* **Check 8.1 — Rapid Double-Tap / Multi-Submit Guard:**

  * *Pass 1:* Inspect every `onPressed` / `onClick` handler that triggers a DB write, payment, print job, or API call.

  * *Pass 2:* Verify an `_isSubmitting` mutex lock or button disable guard prevents 5 rapid taps from creating 5 duplicate records.

* **Check 8.2 — Mid-Flow Process Death & State Restoration:**

  * *Pass 1:* Trace multi-step forms, voice recordings, or checkout/billing screens when Android kills the backgrounded activity (`Don't keep activities`).

  * *Pass 2:* Confirm partial drafts or transaction states recover cleanly without crashing on null arguments.

* **Check 8.3 — Malformed, Emoji, SQL-Meta & Extreme Inputs:**

  * *Pass 1:* Inspect all text inputs, voice-to-text parsers, and contact/CSV importers.

  * *Pass 2:* Trace what happens with empty strings, `10,000`-character pastes, emojis/RTL zero-width joiners, quotes (`'`, `"`, `; --`), and `NaN`/`Infinity` numbers.

#### Agent 9: Localization (`l10n`), Regional Parity & Script Clipping Tester

* **Check 9.1 — 100% Translation Key Parity Across Locales:**

  * *Pass 1:* Compare key counts across all `.arb` / `strings.xml` / `.json` locale files (e.g., English & Hindi vs. Marathi, Gujarati, Kannada, Tamil, etc.).

  * *Pass 2:* Flag any locale with `< 100%` coverage (like `167/799` keys) and verify either missing keys are completed or incomplete locales are gated behind a feature flag so users never see half-translated screens.

* **Check 9.2 — Hardcoded UI Strings & Indic/RTL Rendering:**

  * *Pass 1:* Scan UI widgets for raw string literals not routed through `l10n` / `stringResource()`.

  * *Pass 2:* Check fixed-height containers (`height: 20` / `maxLines: 1` without `overflow: TextOverflow.ellipsis`) that clip tall Devanagari/Indic matras (`ी`, `ू`, `ं`) or RTL layouts.

#### Agent 10: Accessibility, TalkBack & System Font Scaler (Play Pre-Launch Check)

* **Check 10.1 — `2.0x` Font Scaling Overflow (`RenderFlex overflowed`):**

  * *Pass 1:* Scan `Row`, fixed `SizedBox`/`Container` heights, and custom cards containing text.

  * *Pass 2:* Trace layout behavior when an older user sets Android system font size to **150%–200% (`textScaleFactor = 2.0`)**—ensure `Flexible`/`Expanded`/`Wrap` prevents yellow-and-black overflow stripes.

* **Check 10.2 — Screen Reader (`Semantics`) & `48x48dp` Touch Targets:**

  * *Pass 1:* Inspect all `IconButton`, custom `GestureDetector`/`InkWell`, and status icons.

  * *Pass 2:* Verify every interactive element has a minimum `48x48dp` hit area and a clear `semanticLabel` / `contentDescription` (explicitly tested by Google Play's Pre-launch Report).

### Wave 3 — Financial/Data Integrity, Play Store Security & Global Legal (Agents 11–14)

#### Agent 11: Conditional Slot B — Financial/REA Ledger Auditor OR Data Integrity Tester

* **If Financial / Ledger / Billing / E-Commerce App:**

  * *Check 11A.1 (REA Resource–Event–Agent Immutability):* 2x verify that financial transactions (sales, payments, refunds, credit notes) are stored as **append-only immutable Events**, and balances are derived or updated inside **atomic SQLite `TRANSACTION` blocks**—never allowing silent `UPDATE`/`DELETE` overwrites of historical money entries without an audit reversal event.

  * *Check 11A.2 (Floating-Point Money Bug & Negative/Zero Guards):* 2x scan for `double` / `float` arithmetic on currency (e.g., `0.1 + 0.2 = 0.30000000000000004`); require integer paise/cents (`int`) or `Decimal`, and verify strict guards against negative quantities, `0` division, or integer overflow.

* **Otherwise (General Data Integrity & Migration Tester):**

  * *Check 11B.1 (Database Schema Upgrade Migrations):* 2x verify `onUpgrade` / Room `Migration(from, to)` paths so existing users upgrading from v1 to v2 never lose local data or crash on missing columns.

  * *Check 11B.2 (Optimistic Concurrency & Destructive Confirmations):* 2x verify delete/reset actions require confirmation and concurrent edits don't overwrite newer timestamps.

#### Agent 12: SAST, Supply-Chain CVEs, SDK Index & Play Protect Auditor

* **Check 12.1 — Hardcoded Secrets, Tokens & `.env` Leak Scan:**

  * *Pass 1:* Scan all source files, `assets/`, `build.gradle*`, `strings.xml`, and `.gitignore` for API keys (`AIza`, `sk-`, `Bearer`, `eyJ`, AWS/Firebase/Supabase secrets, keystore passwords).

  * *Pass 2:* Verify `pubspec.yaml` `assets:` or Gradle asset folders do NOT bundle `.env`, `.jks`, `.keystore`, or private `.pem` files into the APK/AAB.

* **Check 12.2 — Dependency CVEs & Google Play SDK Index Check:**

  * *Pass 1:* Audit all direct and transitive dependencies in `pubspec.yaml` / `libs.versions.toml` / `package.json`.

  * *Pass 2:* Flag unmaintained packages, known CVEs, and any commercial SDK flagged in the **Google Play SDK Index** for policy violations or outdated target API levels.

* **Check 12.3 — Google Play Protect PHA (Potentially Harmful App) Triggers:**

  * *Pass 1:* Scan for dynamic code loading (`DexClassLoader`, downloading `.apk`/`.jar`/`.so` at runtime), reflection on hidden Android APIs, SMS/Call Log reading, or AccessibilityService abuse.

  * *Pass 2:* Confirm every declared permission in `AndroidManifest.xml` has a direct, user-visible feature in code so **Google Play Protect** never flags the app as spyware/trojan.

#### Agent 13: DAST, OWASP MASVS, Google MASA & Red-Team Penetration Tester

* **Check 13.1 — Local Storage Encryption (`MASVS-STORAGE` & `MASVS-CRYPTO`):**

  * *Pass 1:* Search for `sqflite`, `Room`, `SharedPreferences`, `Hive`, `MMKV`, and local file writes (`getApplicationDocumentsDirectory`).

  * *Pass 2:* Confirm sensitive user/financial data is encrypted at rest using **SQLCipher** or **AES-256-GCM** with keys generated and stored inside the hardware-backed **Android Keystore** (never hardcoded or stored in plaintext `SharedPreferences`).

* **Check 13.2 — Biometric CryptoObject & Auth Bypass (`MASVS-AUTH`):**

  * *Pass 1:* Locate all `BiometricPrompt` / `local_auth` implementations and session token checks.

  * *Pass 2:* Check whether biometric auth merely returns a boolean `if (authenticated)` (bypassable via Frida hook) or properly unlocks a Keystore `CryptoObject` / cipher; verify release builds strip all `Log.d`/`print()` statements that leak PII or tokens to `logcat`.

* **Check 13.3 — Network Pinning, Cleartext Block & WebView Hardening (`MASVS-NETWORK` & `MASA`):**

  * *Pass 1:* Inspect `network_security_config.xml`, HTTP clients (`Dio`, `OkHttp`, `Retrofit`, `fetch`), and `WebView` configurations.

  * *Pass 2:* Confirm `cleartextTrafficPermitted="false"`, verify zero trust-all SSL overrides (`badCertificateCallback`), check TLS certificate pinning for sensitive APIs, and confirm `WebView` disables `allowFileAccess` and `JavascriptInterface` on untrusted content.

* **Check 13.4 — Anti-Tampering, Root Detection & Play Integrity API (`MASVS-RESILIENCE`):**

  * *Pass 1:* Search for **Google Play Integrity API** integration and runtime environment checks.

  * *Pass 2:* Verify Play Integrity tokens are decrypted and verified **on the backend server** (not just on the client device) with a nonce to block repackaged APKs, emulators, and hooked runtimes.

#### Agent 14: Global Legal Acts & Google Play Store Policy Reviewer

* **Check 14.1 — Google Play Console Mandatory Gates (Data Safety & Account Deletion):**

  * *Pass 1:* Cross-check every permission and SDK data collection point in code against Google Play's **Data Safety** categories.

  * *Pass 2:* If the app supports accounts or cloud sync, verify **both** an in-app **"Delete Account & Data"** button AND a public web deletion URL exist, and verify sensitive permissions (Mic, Contacts, Camera, Location, Bluetooth) are requested **just-in-time** with clear purpose disclosure—never all at cold launch.

* **Check 14.2 — India Legal Compliance (`DPDP Act 2023`, `DPDP Rules 2025`, `CERT-In 2022`, `IT Act 2000`):**

  * *Pass 1:* Search UI and docs for consent notices, privacy policy links, Grievance Officer details, and backend logging rules.

  * *Pass 2:* Verify:

    1. **Itemized Consent Notice (DPDP Sec 5 & 6):** Clear notice in English + supported Indian languages explaining *what* data (e.g., voice audio, contacts, ledger entries) is collected and *why*, with a way to withdraw consent and erase data.

    2. **Grievance Officer & Breach Readiness:** Named Grievance Officer contact in-app/Privacy Policy and a 72-hour Data Protection Board breach notification SOP.

    3. **CERT-In 2022 Backend Mandate:** 180-day rolling ICT log retention within India, NTP clock sync (NIC/NPL), and 6-hour cyber incident reporting runbook.

* **Check 14.3 — Global Privacy Readiness (`EU GDPR` & `US CCPA/COPPA`):**

  * *Pass 1:* Check for data export (portability), right-to-erasure, analytics opt-out, and age-screen checks.

  * *Pass 2:* Verify non-essential tracking/analytics SDKs do not fire before user consent (GDPR) and users can export/delete their local and cloud records cleanly.

## Stage 3: Anonymized Peer Review, 2x Audit Gate & Chairman Playbook

1. **Anonymized Cross-Review & 2x Gate Enforcement:**

   * Strip agent names and label the 14 reports `Reviewer A` through `Reviewer N`.

   * Verify that every reported bug and every `PASS` includes **both Pass 1 and Pass 2 evidence**. If any agent skipped Pass 2 (`file:line` trace), re-run that check immediately before synthesis.

   * Deduplicate overlapping findings (e.g., where Agent 4, Agent 12, and Agent 13 flagged the same Manifest or secret issue—mark it as **High-Confidence Multi-Agent Consensus**) and resolve trade-offs (e.g., strict encryption vs. 16 ms frame budget on 3 GB RAM phones).

2. **Chairman Synthesis & Vibe-Coder Remediation Playbook:**
   Generate the final report in the console AND save it to `./council-reports/pre-launch-audit-<YYYY-MM-DD>.md` using this exact structure:

   * `## 1. Executive Launch Verdict`

     * **Status:** `GO` | `CONDITIONAL GO` | `NO-GO (Release Blockers Found)`

     * **Scorecard Table:** Category | 2x Verified Passes | P0 Blockers | P1 High | P2 Medium

     * **Detected Stack, Active Plug-In Slots & Legal Regions**

   * `## 2. Vibe-Coding Traps Caught in Your Repo`

     * Bullet summary of AI-generated shortcuts, silent catches, fake security, or outdated SDK patterns discovered.

   * `## 3. P0 — Release Blockers (Fix Before Uploading to Google Play)`

     * For each P0 issue:

       * **Title & Consensus:** (Which reviewers caught it)

       * **Exact Location:** `file:line`

       * **2x Verification Proof:** Pass 1 + Pass 2 trace

       * **Why This Matters (Plain English):** Crash / Hack / Play Store Rejection explanation

       * **Copy-Paste Fix:** Exact `Before` and `After` code block

   * `## 4. P1 — High-Priority Security, Performance & Legal Fixes` (Same structured format)

   * `## 5. P2 — Architecture, l10n & Polish Improvements`

   * `## 6. Google Play Console Submission Cheat-Sheet`

     * Exact answers to fill into the Play Console **Data Safety Form**, **Target API 36 check**, **App Content / Permission justifications**, and **Pre-launch Report test credentials** based on the audited code.

   * `## 7. Top 3 Commands to Run Right Now`

     * The exact terminal commands and first file edit the developer should execute in the next 10 minutes.
