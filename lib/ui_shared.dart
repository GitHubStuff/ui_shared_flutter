/// A library of shared utilities and extensions for Flutter apps.
// ignore_for_file: public_member_api_docs

library ui_shared;

import 'package:flutter/material.dart';

export 'src/buildcontext_extensions.dart';
export 'src/material_color.dart';
export 'src/os_platforms.dart';
export 'src/position_and_size.dart';
export 'src/show_timed_snackbar.dart';
export 'src/widget_extensions.dart';

/// A function that returns the type of a generic class.
Type typeOf<T>() => T;

/// Typedef of Json and JsonList for better readability.
typedef Json = Map<String, dynamic>;
typedef JsonList = List<dynamic>;

/// Global class to access the context and navigator key from anywhere in the app.
/// This is useful for showing snackbars, dialogs, and navigating without needing to pass the context around.
/// NOTE: This is not recommended for use in production apps, as it can lead to tight coupling and make testing difficult.
/// Instead, consider using a service locator or dependency injection to provide the context and navigator key where needed.
class Global {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;
}

/// Where parameters are optional and can be null, this provides a wrapper to
/// set null or use the value.
/// Example:
/// ```dart
/// class Person {
///  final String name;
///  final int? age;
///
///  Person copyWith({String? name, Nullable<int>? age}) {
///   return Person(
///    name: name ?? this.name,
///    age: (age == null) ? this.age : age.value,
///  );
/// }
/// ```
/// This way, you can use the value directly or set it to null.
class Nullable<T> {
  Nullable(this._value);
  final T? _value;

  T? get value => _value;
}

/// Define a base custom error class
class CustomError implements Exception {
  CustomError(this.message);
  final String message;

  @override
  String toString() => 'CustomError: $message';
}
