<h1 align="center">PassKeeper</h1>

<p align="center">
  A secure, offline-first password manager built with Flutter.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.41.4-02569B?logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-Riverpod-blue?logo=dart&logoColor=white" alt="Riverpod">
  <img src="https://img.shields.io/badge/Encryption-AES--256--GCM-green" alt="AES-256-GCM">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT">
</p>

<p align="center">
  <a href="https://play.google.com/store/apps/details?id=com.bavly.passkeeper">
    <img alt="Get it on Google Play" src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" height="60">
  </a>
</p>

---

## About

**PassKeeper** stores and manages your passwords locally on your device — no cloud, no accounts, no servers. Every password is encrypted at rest with AES-256-GCM, and the encryption key is itself derived from your PIN using Argon2id, so your vault is only ever as accessible as your device and your PIN. Unlock with a PIN or your device's biometrics, and organize your credentials into categories and favourites.

## Features

- 🔐 **PIN + Biometric Unlock** — Log in with a PIN or hardware-backed fingerprint/face authentication.
- 🛡️ **End-to-End Local Encryption** — Passwords are encrypted with AES-256-GCM; the master encryption key is derived from your PIN via Argon2id and never stored in plaintext.
- 📴 **Fully Offline** — All data lives in an encrypted local Hive store on your device. Nothing is sent to a server.
- 🗂️ **Categories** — Organize passwords into custom categories (Banking, Social Media, Work, etc.) with quick batch add/remove.
- ⭐ **Favourites** — Pin frequently-used credentials for one-tap access.
- 🔍 **Search & Category Filter** — Quickly find what you need by name or category.
- 🎨 **Brand Icons** — Automatic brand icon matching for recognizable, at-a-glance entries.
- 🌗 **Clean, Modern UI** — A fast, minimal interface designed for everyday use.

## Screenshots

<p>
  <img src="https://github.com/user-attachments/assets/188fa763-88ec-408b-a976-57185f123c21" width="200">
  <img src="https://github.com/user-attachments/assets/5b13fcf3-cb5e-493e-b12c-3c3f0e6f73b1" width="200">
  <img src="https://github.com/user-attachments/assets/cc853a5d-9524-43c3-8baa-71c17077f79f" width="200">
  <img src="https://github.com/user-attachments/assets/21f76641-8aed-48bf-a8b0-6759ebb3d770" width="200">
  <img src="https://github.com/user-attachments/assets/af3344e3-41fc-4b2a-9572-ae49a81f88d3" width="200">
  <img src="https://github.com/user-attachments/assets/6047a880-1f5b-4e30-a37c-c0d5dee874b8" width="200">
  <img src="https://github.com/user-attachments/assets/e7dc09c6-b553-4e8f-b470-71ed1d52288d" width="200">
  <img src="https://github.com/user-attachments/assets/d84090c0-2708-4f09-aaec-9d41ede7933d" width="200">
</p>

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | [Flutter](https://flutter.dev) / [Dart](https://dart.dev) |
| State Management | [Riverpod](https://riverpod.dev) (`riverpod_generator`, `riverpod_annotation`) |
| Data Models | [Freezed](https://pub.dev/packages/freezed) |
| Local Storage | [Hive CE](https://pub.dev/packages/hive_ce) |
| Secure Storage | [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) |
| Cryptography | [cryptography](https://pub.dev/packages/cryptography) — Argon2id + AES-256-GCM |
| Biometrics | [local_auth](https://pub.dev/packages/local_auth) |
| Routing | [go_router](https://pub.dev/packages/go_router) |
| Icons | [flutter_svg](https://pub.dev/packages/flutter_svg) |

## Security

1. **Key derivation** — On unlock, your PIN is run through **Argon2id** to derive a Key Encryption Key (KEK).
2. **Master key** — The KEK decrypts a randomly generated Master Encryption Key (MEK), which lives only in memory while the app is active.
3. **Per-entry encryption** — Each password is individually encrypted with **AES-256-GCM** using the MEK and a unique 12-byte random IV, stored alongside the ciphertext.
4. **Hardware-backed storage** — Sensitive material such as the encrypted MEK is stored via secure, hardware-backed platform storage (Android Keystore / iOS Keychain) where available.

> PassKeeper is a personal project and has not undergone a formal third-party security audit. Use at your own discretion.

## Architecture

Feature-first, layered architecture, inspired by [codewithandrea](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/) riverpod architecture.

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check out the [issues page](https://github.com/BavlyMourad/PassKeeper/issues) for more information.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.