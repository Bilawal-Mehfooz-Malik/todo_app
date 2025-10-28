# Todo App

A simple yet powerful Todo app developed using `drift` (formerly `moor`) as the backend and `flutter_bloc` for state management. This app allows users to create, update, and manage their todos efficiently with a clean and intuitive UI.

## Features
- **Add, Edit, and Delete Todos**: Easily manage your tasks.
- **Clean State Management**: Leveraging `flutter_bloc` for predictable and maintainable state.
- **High-Performance Local Storage**: Using `drift` for a fast and reliable local database.
- **Error Reporting**: Integrated with **Firebase Crashlytics** for real-time crash monitoring.
- **Over-the-Air Updates**: Ready for hotfixes using **Shorebird**.

## Technologies & Architecture
- **State Management**: `flutter_bloc`
- **Database**: `drift` (on top of `sqlite`)
- **Dependency Injection**: `get_it`
- **CI/CD**: Codemagic & GitHub Actions
- **Error Reporting**: Firebase Crashlytics
- **Hotfixes**: Shorebird
- **Architecture**: A clean, feature-first architecture is used, separating code into `data`, `domain`, and `presentation` layers.

## DevOps & CI/CD
This project uses a tag-based release system automated with Codemagic.

### Creating a Full Release
To build and release a new version of the application:
1. Create a new git tag with the format `release-android-vX.X.X` (e.g., `release-android-v1.0.0`).
2. Push the tag to the remote repository: `git push origin <tag_name>`.

This will trigger the `android-app-distribution` workflow on Codemagic, which builds the APK, uploads it to Firebase App Distribution, and creates a new release on GitHub with the APK attached.

### Creating a Patch
To release a hotfix using Shorebird:
1. Create a new git tag with the format `patch-android-vX.X.X.X` (e.g., `patch-android-v1.0.0.1`).
2. Push the tag to the remote repository.

This will trigger the `android-patch-distribution` workflow, which deploys the code changes via Shorebird and creates a corresponding release tag on GitHub.

## Screenshots

### 1. My Todos Screen
<div>
  <img src="./github_readme_data/images/todo-screen.jpg" width="200" height="400" alt="Todo Screen">
  <img src="./github_readme_data/images/todo-screen-completed.jpg" width="200" height="400" alt="Todo Screen Completed">
</div>

### 2. Todo Details Screen
<div>
  <img src="./github_readme_data/images/Screenshot_20241003_190755.jpg" width="200" height="400" alt="Todo Details Screen">
</div>

### 3. Add & Edit Todo Screen
<div>
  <img src="./github_readme_data/images/Screenshot_20241003_190820.jpg" width="200" height="400" alt="Add Todo Screen">
  <img src="./github_readme_data/images/Screenshot_20241003_190803.jpg" width="200" height="400" alt="Edit Todo Screen">
</div>

## Project Structure

- **`lib/src/`**: Main project directory.
  - **`common/`**: Contains reusable widgets and utility functions (e.g., dialogs, buttons).
  - **`constants/`**: Holds application-wide constants like sizes and breakpoints.
  - **`features/`**: Core application features, each separated into `data`, `domain`, and `presentation` layers.
  - **`localization/`**: Manages localization and internationalization.
  - **`theme/`**: Contains the application's theme data and color schemes.
  - **`utils/`**: Shared utility classes and extensions.

## Project Setup

Follow these steps to get the project up and running on your local machine.

### 1. Prerequisites

Make sure you have the following tools installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- An IDE such as [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)

### 2. Clone the Repository

```bash
git clone https://github.com/Bilawal-Mehfooz-Malik/todo_app
cd todo_app
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Configure Firebase

This project uses Firebase for crash reporting. You must connect it to your own Firebase project to run it.

1.  **Install the FlutterFire CLI:**
    ```bash
    dart pub global activate flutterfire_cli
    ```

2.  **Connect to Firebase:** Run the following command and follow the prompts to select your Firebase project. This will automatically generate the `lib/firebase_options.dart` file for you.
    ```bash
    flutterfire configure
    ```

### 5. Run the Application

```bash
flutter run
```