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

## 6. CI/CD and Testing Overhaul

*   **Tag-Based Release Workflow:** Refactored the Codemagic CI/CD pipeline to use an explicit, tag-based trigger system instead of activating on every push to `main`.
    *   Full releases are now triggered by tags matching `release-android-v*`.
    *   Shorebird patches are triggered by tags matching `patch-android-*`.
*   **Automated GitHub Releases:** Integrated the GitHub CLI (`gh`) into the Codemagic workflows to automatically create a new GitHub Release for every full release and patch, improving traceability.
*   **Integration Test Fixes:** Resolved multiple issues with the end-to-end integration tests, including:
    *   Fixing a Firebase initialization error by mocking the `AppLogger` during tests.
    *   Resolving a `GetIt` dependency injection error by refactoring the `TodoCubit` to receive its logger via the constructor.
    *   Correcting the initial data loading logic by moving the `loadTodos()` call to the `initState` of the main screen widget (`MyTodoScreen`).
*   **Test Code Centralization:** Consolidated all mock classes into a single, reusable `test/src/mocks.dart` file to clean up test code.