import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_extensions_flutter/ui_extensions_flutter.dart';

import '../gen/assets.gen.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.center, children: [
              const Text('Context', style: TextStyle(color: Colors.amber))
                  .withPaddingAll(5.0),
              SizedBox(
                width: 100,
                height: 100,
                child: Assets.images.context1024x1024.image(),
              ).withPaddingAll(15.0).withBorder(
                    Colors.red,
                    width: 2.0,
                  ),
            ]),
            const Gap(4.0),
            ElevatedButton(
              onPressed: () {
                showCustomSnackBar(
                  context,
                  context.isKeyBoardOpen ? 'Keyboard Open' : 'Keyboard Closed',
                );
              },
              child: const Text(
                'Keyboard State',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                SizeMeasuringWidget(
                  onSizeChanged: (size) {
                    showCustomSnackBar(context, 'Size: $size');
                  },
                  child: const Text('Size Measuring Widget'),
                );
              },
              child: const Text(
                'Size Measuring Widget',
                style: TextStyle(color: Colors.greenAccent),
              ),
            ),
            const Gap(4.0),
            const TextField().withPaddingAll(6.0).withBorder(Colors.amber),
            SizeMeasuringWidget(
              onSizeChanged: (size) {
                showCustomSnackBar(context, 'Size: $size');
              },
              child: const Text('Size Measuring Widget'),
            ),
            const Gap(4.0),
            ElevatedButton(
                onPressed: () => context.hideKeyboard(),
                child: const Text('HideKeyboard')),
            const Gap(4.0),
            const Text('Welcome to the UI Extensions Flutter Demo!',
                    style: TextStyle(color: Colors.purple))
                .withPaddingAll(3)
                .withBackground(Colors.blue[100]!)
                .withBorder(Colors.red),
            const Gap(8.0),
            const Text('Faded Text').withOpacity(0.5),
          ],
        ),
      ),
    );
  }
}
