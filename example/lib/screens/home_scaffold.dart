// ignore_for_file: sort_child_properties_last
/// A Flutter widgets that imports essential packages for UI design,
/// handling assets, and incorporating UI extensions for enhanced
/// visual components to be used demo the ui_shared_flutter package.
library;

import 'package:flutter/material.dart';

import 'homeful_widget.dart';

class HomeScaffold extends StatelessWidget {
  final String title;
  const HomeScaffold({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Builder(builder: (context) {
        return const HomefulWidget();
      }),
      floatingActionButton: null,
    );
  }
}
