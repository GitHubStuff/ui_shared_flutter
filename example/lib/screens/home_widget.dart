import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_shared/ui_shared.dart';

import '../gen/assets.gen.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final k = MediaQuery.of(context).viewInsets.bottom;
    debugPrint('K . $k');

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
                child: Assets.images.share1024x1024.image(),
              ).withPaddingAll(15.0).withBorder(
                    Colors.red,
                    width: 2.0,
                  ),
            ]),
            const Gap(4.0),
            ElevatedButton(
              onPressed: () {
                final j = MediaQuery.of(context).viewInsets.bottom;
                debugPrint("J . $j");
                showTimedSnackBar(
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
                PositionAndSizeWidget(
                  onLayout: (size, offset) {
                    showTimedSnackBar(context, 'Size: $size, $offset');
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
            const Gap(3.0),
            ElevatedButton(
                onPressed: () => context.hideKeyboard(),
                child: const Text('HideKeyboard')),
            const Gap(3.0),
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
