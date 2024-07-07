import 'package:flutter/material.dart';

/// Shows a floating [SnackBar] with a [content] that disappears after [duration].
void showTimedSnackBar(
  BuildContext context,
  dynamic content, {
  Duration duration = const Duration(seconds: 2),
  Color backgroundColor = Colors.amber,
}) {
  final message = content is String ? Text(content) : content;
  final snackBar = SnackBar(
    content: message as Widget,
    duration: duration,
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
