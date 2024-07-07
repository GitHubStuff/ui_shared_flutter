import 'package:flutter/material.dart';

/// A cache for storing the last retrieved MediaQueryData.
MediaQueryData? _cachedMediaQuery;

/// A Dart extension on BuildContext to provide easy access to frequently used data.
extension BuildContextExtension<T> on BuildContext {
  /// Returns the MediaQueryData for the context, caching it for future accesses.
  MediaQueryData get mediaQuery {
    _cachedMediaQuery ??= MediaQuery.of(this);
    return _cachedMediaQuery!;
  }

  /// Gets the height of the screen from the cached media query.
  double get height => screenSize.height;

  /// Gets the width of the screen from the cached media query.
  double get width => screenSize.width;

  /// Gets the locale of the current context.
  Locale get locale => Localizations.localeOf(this);

  /// Returns the screen size extracted from the media query.
  Size get screenSize => mediaQuery.size;

  /// Provides the ThemeData of the current context.
  ThemeData get theme => Theme.of(this);

  /// Checks if the keyboard is visible in the current context.
  //NOTE: Cannot use _cachedMediaQuery here as it may not be updated over time.
  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;

  /// Hides the keyboard if it is not currently the focus.
  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  /// Returns the safe area size of the screen.
  Size safeScreenSize() => Size(
        width,
        height - mediaQuery.padding.top - mediaQuery.padding.bottom,
      );
}
