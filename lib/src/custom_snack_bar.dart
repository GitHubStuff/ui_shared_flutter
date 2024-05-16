import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, dynamic content) {
  final message = content is String ? Text(content) : content;
  final snackBar = SnackBar(
    content: message,
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.amber,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
