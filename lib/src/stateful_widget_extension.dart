// Adds helpers for afterFirstLayout, reportTextScaleFactor, didChangePlatformBrightness,
// didChangeAppLifecycleState
// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

/// A base class for stateful widgets that provides lifecycle methods and callbacks on first layout, reportTextScaleFactor, didChangePlatformBrightness, and didChangeAppLifecycleState.
abstract class StatefulWidgetExtension<T extends StatefulWidget>
    extends State<T> with WidgetsBindingObserver {
  @mustCallSuper
  @override
  void initState() {
    super.initState();
    final instance = WidgetsBinding.instance;
    instance.addPostFrameCallback((_) => afterFirstLayout(context));
    instance.addObserver(this);
    reportTextScaleFactor(instance.platformDispatcher.textScaleFactor);
  }

  /// Called after the first layout has been completed.
  void afterFirstLayout(BuildContext context) {}

  /// Called when the text scale factor changes.
  void reportTextScaleFactor(double? textScaleFactor) {}

  /// Called when the platform brightness changes.
  @override
  void didChangePlatformBrightness() {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @mustCallSuper
  @override
  void didChangeTextScaleFactor() {
    final textScalceFactor =
        WidgetsBinding.instance.platformDispatcher.textScaleFactor;
    reportTextScaleFactor(textScalceFactor);
  }

  @mustCallSuper
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
