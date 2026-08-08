# Vault-in-a-Box | Enterprise Flutter & Firebase Architecture

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.0.0+-blue.svg)](https://flutter.dev)
[![Firebase Engine](https://img.shields.io/badge/Firebase-Firestore%20%7C%20Auth-orange.svg)](https://firebase.google.com)
[![RevenueCat SDK](https://img.shields.io/badge/Monetization-RevenueCat-green.svg)](https://www.revenuecat.com)
[![License: Commercial](https://img.shields.io/badge/License-Commercial-purple.svg)](#license)

**Vault-in-a-Box** (powered by the Omen Vault engine) is a battle-tested, high-security mobile application boilerplate built on Flutter (`>=3.0.0 <4.0.0`) and Firebase. It eliminates 100+ hours of setup time by providing a pre-configured backend, zero-trust local data encryption, and production-ready in-app purchase paywalls out of the box.

---

## 🚀 Key Features

* **Zero-Trust Encryption:** Local-first storage fallback with secure key management.
* **Hardened Security Rules:** Pre-written Firestore and Storage rules enforcing strict UID isolation policies.
* **Instant Monetization:** Integrated RevenueCat SDK configured for monthly, annual, and lifetime ("Black Tier") paywalls.
* **1-Click Firebase Deployment:** Bash scripts included to deploy security rules and indexes directly from your terminal.
* **Clean Architecture:** Fully modular `lib/` directory structure optimized for rapid feature expansion.

---

## ⚡ 15-Minute Quickstart Guide

### Step 1: Clone the Repository
```bash
git clone [https://github.com/Cliston507/Omen_vault_vault_v2.git](https://github.com/Cliston507/Omen_vault_vault_v2.git)
cd Omen_vault_vault_v2
flutter pub get
