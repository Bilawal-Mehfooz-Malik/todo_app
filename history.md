# Project Improvement Plan

This document outlines the plan to improve the Todo app by integrating Firebase services and a CI/CD pipeline with Codemagic.

## Initial Assessment

### The Good

*   **Clean Architecture:** The project follows a feature-based architecture, separating concerns into `data`, `domain`, and `presentation` layers.
*   **State Management:** It uses `flutter_bloc` for state management.
*   **Local Storage:** The use of `isar` for local storage is a good choice for performance.
*   **Code Quality:** The project uses `flutter_lints` to enforce code quality, and the analyzer reports no errors.
*   **Clear Documentation:** The `README.md` file provides clear instructions on how to set up and run the project.

### The Bad

*   **Outdated Dependencies:** Many dependencies are outdated.
*   **Discontinued Dependencies:** The project uses discontinued packages.

### The Ugly

*   **No Tests:** The project has no automated tests.

## Integration Plan

### 1. Firebase Crashlytics

*   **Purpose:** To get real-time crash reports from the app.
*   **Offline Capability:** Crashlytics caches crash reports locally on the device when the app is offline and uploads them the next time the app is launched with an internet connection.

### 2. Firebase App Distribution

*   **Purpose:** To distribute pre-release versions of the app to testers.
*   **Benefits:**
    *   Easy distribution of builds.
    *   Tester management.
    *   In-app feedback from testers.

### 3. Codemagic

*   **Purpose:** To set up a CI/CD pipeline for automated builds, tests, and deployments.
*   **Workflow:**
    1.  Push code to the Git repository.
    2.  Codemagic automatically builds the app and runs tests.
    3.  If tests pass, Codemagic deploys the app to Firebase App Distribution for internal testing.
    4.  When ready for production, use Shorebird to release the app to the app stores.

### 4. Shorebird

*   **Purpose:** To ship hotfixes to the app without going through the app store review process.
*   **Benefits:**
    *   Instant updates.
    *   Reduced risk of critical bugs in production.

## Other Considerations

### Firebase App Check

*   **Purpose:** To protect backend resources from abuse.
*   **Conclusion:** Not needed for this app because it is completely offline and has no backend to protect.

## 5. Custom App Logger with Crashlytics Integration

*   **Purpose:** To provide a centralized, application-wide logging mechanism that integrates with Firebase Crashlytics for error reporting.
*   **Implementation Details:**
    *   **Custom Logger:** Implemented a custom `AppLogger` from scratch, avoiding external logging packages for full control.
    *   **Log Levels:** Supports `info`, `warning`, and `severe` log levels.
    *   **Crashlytics Integration:** `severe` level logs automatically report errors and stack traces to Firebase Crashlytics.
    *   **Dependency Injection:** Utilized `get_it` as a service locator to provide a singleton instance of `AppLogger` throughout the application, ensuring testability and decoupling.
    *   **Modular Initialization:** Refactored application startup into an `AppInitializer` class, breaking down initialization concerns (Firebase, dependencies, error handling, Isar, Bloc providers) into distinct, focused methods. This keeps `main.dart` clean and the initialization logic organized.
    *   **Global Error Handling:** Integrated the `AppLogger` into Flutter's global error handlers (`FlutterError.onError`, `PlatformDispatcher.instance.onError`, `ErrorWidget.builder`) to capture and log all uncaught exceptions.
    *   **Usage Example:** Demonstrated usage within a `TodoCubit` to show how to log information and errors from business logic.