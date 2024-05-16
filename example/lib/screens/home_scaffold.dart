// ignore_for_file: sort_child_properties_last
/// A Flutter widgets that imports essential packages for UI design,
/// handling assets, and incorporating UI extensions for enhanced
/// visual components to be used demo the ui_extensions_flutter package.
library;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../gen/assets.gen.dart';

import 'package:ui_extensions_flutter/ui_extensions_flutter.dart';

import 'home_widget.dart';

//NOTE: Bad practice to use un-disposed global variables, but for the sake of this example
final TextEditingController _controller = TextEditingController();

class HomeScaffold extends StatelessWidget {
  final String title;
  const HomeScaffold({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const HomeWidget(),
      floatingActionButton: null,
    );
  }

  Widget homeWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox.shrink(), flex: 1),
          const Gap(4.5),
          SizedBox(
            width: 50,
            height: 50,
            child: Assets.images.context1024x1024.image(),
          ).withPaddingAll(15.0).withBorder(
                Colors.red,
                width: 2.0,
              ),
          const Gap(4.5),
          const Text('Welcome to the:\nUI Extensions Flutter example app!')
              .withPaddingAll(3)
              .withBackground(Colors.blue[50]!)
              .withBorder(Colors.red),
          const Expanded(child: SizedBox.shrink(), flex: 2),
          Column(
            children: [
              const Gap(8.0),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a number',
                  border: OutlineInputBorder(),
                ),
              ).withSymmetricPadding(horizontal: 10.0),
              const Gap(3.0),
              ElevatedButton(
                  onPressed: () {
                    showCustomSnackBar(
                      context,
                      '🌸 Keyboard open: ${context.isKeyBoardOpen}',
                    );
                    context.hideKeyboard();
                  },
                  child: const Text('Dismiss Keyboard')),
            ],
          ).withBorder(Colors.green).withPaddingAll(8.0),
          const Gap(5.0),
          const Text('Faded Text using .opacity').withOpacity(0.5),
          const Expanded(child: SizedBox.shrink(), flex: 7),
        ],
      ),
    );
  }
}
