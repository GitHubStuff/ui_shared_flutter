# Flutter Extensions Package - ui_extensions_flutter

This library provides a set of extensions to streamline and enhance the development experience in Flutter by adding convenient methods to existing Flutter types like `BuildContext` and `Widget`.

## Features

### Context Extensions

#### Usage: BuildContextExtension

The `BuildContextExtension` provides easy access to frequently used properties and methods related to the media query, screen size, and keyboard visibility.

- **Media Query Access**: Quickly fetch media query data.
- **Screen Size**: Obtain screen dimensions directly.
- **Keyboard State**: Check if the keyboard is visible.
- **Hide Keyboard**: Dismiss the keyboard programmatically.

### OS Platform Extensions

#### OSEnum.getCurrentOS

```dart
enum OSEnum {
  android,
  fuchsia,
  ios,
  linux,
  macos,
  windows;
}

/// example:
final OSEnum operatingSystem = OSEnum.getCurrentOS;
```

**NOTE** Any platform not in the OSEnum with throw an error.

### Widget Extensions

#### Usage: WidgetExtensions

The `WidgetExtensions` add decoration and layout utilities directly to any widget, simplifying the process of modifying widget appearance and behavior.

- **Background Color**: Apply a background color.
- **Border Customization**: Add borders with customizable color, width, and radius.
- **Visibility Control**: Easily show or hide widgets based on state.
- **Opacity Control**: Adjust the opacity for widget transparency.
- **Padding Utilities**: Apply various padding configurations.
- **Container Wrapping**: Wrap a widget with additional spacing and optional color.

## Getting Started

### Installation

```yaml
dependencies:
  ui_extensions_flutter:
    git: https://github.com/GitHubStuff/ui_extensions_flutter.git
```

To use these extensions, simply include the extension file in your Flutter project.

Here's a simple example to demonstrate using some of the context and widget extensions:

```dart
import 'package:ui_extensions_flutter/ui_extensions_flutter.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Extension Demo")),
      body: Center(
        child: Text("Hello, World!")
          .paddingAll(20)
          .background(Colors.blue)
          .borderAll(Colors.white),
      ),
    );
  }
}
```

Run the demo [/example](example/lib/main.dart) app to see features and usage.

## Misc

```dart
Type typeOf<T>() => T;

typedef Json = Map<String, dynamic>;
typedef JsonList = List<dynamic>;

class Global {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;
}

class Nullable<T> {
  final T? _value;

  Nullable(this._value);

  T? get value => _value;
}

class CustomError implements Exception {
  final String message;

  CustomError(this.message);

  @override
  String toString() => "CustomError: $message";
}
```

## License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.

## Finally

Be kind to each other!
