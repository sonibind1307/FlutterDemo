# flutter_demo_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- cupertino_icons: Provides iOS-style icons for Cupertino widgets.

- dio: Powerful HTTP client for making network requests.

- get_it: Simple service locator for dependency injection.

- retrofit: Type-safe HTTP client generator for Dio.

- flutter_bloc: State management using the BLoC pattern.

- cached_network_image: Loads and caches network images efficiently.

- shimmer: Adds shimmering loading placeholders.

- go_router: Declarative navigation and routing for Flutter apps.

- connectivity_plus: Checks network connectivity status.

- hive: Lightweight NoSQL local database.

- hive_flutter: Hive extensions for Flutter apps.

- path_provider: Access device storage paths like documents or temp.

- equatable: Makes value comparison easy for Dart objects.

- flutter_screenutil: Helps with responsive UI sizing.

- Dev Dependencies:

- flutter_test: Provides tools for writing Flutter unit and widget tests.

- retrofit_generator: Generates Retrofit API client code.

- build_runner: Runs code generators like Retrofit and Hive.

- hive_generator: Generates Hive TypeAdapters for storing custom objects.

## Project explanation
✅ State Management (flutter_bloc)
Used BLoC pattern to separate business logic from UI. It makes the app more scalable, testable, and easy to maintain.

✅ Dependency Injection (get_it)
Used get_it as a service locator to manage dependencies (like API repository) efficiently. This removes tight coupling between classes.

✅ API Integration (dio + retrofit)
Used dio for network calls with retrofit for type-safe REST API handling. This ensures cleaner and reusable API code.

✅ Local Storage (hive)
Integrated Hive to store data locally for offline support. Users can access data even without internet.

✅ Connectivity Check (connectivity_plus)
Added connection detection to automatically handle online/offline states and load local data when offline.

✅ Responsive UI (flutter_screenutil)
Used screenutil to make the UI look consistent on all screen sizes.

✅ Better UX (shimmer, cached_network_image)
Added shimmer loaders for smooth loading states and cached images for performance.

Overall, the project is built with clean architecture, reusable components, and robust state management for a better user experience.

