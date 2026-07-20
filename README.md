# Insighta (Smart Farmer)

A Flutter mobile app for smart farm management (poultry/livestock), helping farmers monitor and manage their flock and daily operations from one place, with Arabic as the primary UI language.

## Overview

- **Project name:** FlockSight
- **Description:** Smart Farmer
- **Supported platforms:** Android, iOS, macOS (with scaffolding also present for Web, Windows, and Linux)
- **Default language:** Arabic (with internationalization support via `intl` and `flutter_localizations`)

## Key Features

Based on the project's modules:

- **Login:** User authentication, with biometric login support via `local_auth` and secure data storage via `flutter_secure_storage`.
- **Dashboard:** Main screen showing a summary and overview of the farm.
- **Animal List:** View and manage the list of animals/flock.
- **Flock:** Detailed management of flock data.
- **Sick List:** Track and log sick animals.
- **Field Ops:** Log and track daily field operations and activities.
- **Protocols:** Manage care, vaccination, and other protocols.
- **Stats:** Visual data and indicators (gauges) via `syncfusion_flutter_gauges`.
- **Notifications:** Push notifications via Firebase Cloud Messaging.
- **Security:** Root detection via `root_checker_plus`, and secure storage for sensitive data.

## Tech Stack

- **Flutter / Dart** (SDK >=3.4.3)
- **GetX** (`get`) for state management and routing — the project follows a `bindings` / `controllers` / `views` structure per module.
- **Firebase** (`firebase_core`, `firebase_messaging`) for push notifications.
- **HTTP** for communicating with the backend API.
- **flutter_secure_storage** and **local_auth** for security and authentication.
- **webview_flutter** and **video_player** for displaying web and video content in-app.
- **flutter_screenutil** for responsive design across screen sizes.

## Project Structure

```
lib/
├── main.dart              # App entry point
├── app.dart                # Global app setup
├── repo.dart                # Data access layer (Repository)
├── models/                  # Data models
├── modules/                 # Feature modules (each with bindings/controllers/views)
│   ├── login/
│   ├── dashboard/
│   ├── animal_list/
│   ├── flock/
│   ├── sick_list/
│   ├── field_ops/
│   ├── protocols/
│   ├── inventory/
│   ├── stats/
│   └── shell/
├── web_services/            # API communication layer
├── widgets/                  # Shared reusable widgets
├── styles/                   # Colors, fonts, and general styling
└── utilities/                # Helper functions and utilities
```

## Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (compatible with Dart >=3.4.3)
- Android Studio or VS Code with Flutter/Dart plugins
- A physical device or emulator to run the app

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run the app in debug mode
flutter run

# Build a release version for Android
flutter run --release
```

## Notes

- The app is integrated with Firebase, so the project's Firebase config files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS) are required to fully enable push notifications.
