import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_shared/ui_shared.dart';

import '../gen/assets.gen.dart';

class HomefulWidget extends StatefulWidget {
  const HomefulWidget({
    super.key,
  });

  @override
  State<HomefulWidget> createState() => _HomefulWidgetState();
}

//💠
class _HomefulWidgetState extends State<HomefulWidget>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    final instance = WidgetsBinding.instance;
    instance.addPostFrameCallback((_) => afterFirstLayout(context));

    instance.addObserver(this);
  }

  void afterFirstLayout(BuildContext context) {
    didChangeMetrics();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final value = WidgetsBinding
        .instance.platformDispatcher.views.first.viewInsets.bottom;
    if (value != 0.0) {
      // WHEN KEYBOARD POP UP
      setState(() {
        isKeyboardVisible = true;
      });
    } else {
      setState(() {
        isKeyboardVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final k = MediaQuery.of(context).viewInsets.bottom != 0;
    debugPrint('....K . $k');

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.center, children: [
              const Text('Context', style: TextStyle(color: Colors.green))
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
                onPressed: () => context.hideKeyboard(),
                child: const Text('HideKeyboard')),
            const Gap(4.0),
            ElevatedButton(
              onPressed: () {
                final j = MediaQuery.of(context).viewInsets.bottom != 0;
                debugPrint("J: $j");
                showCustomSnackBar(
                  context,
                  isKeyboardVisible ? 'Keyboard Open' : 'Keyboard Closed',
                );
              },
              child: isKeyboardVisible
                  ? const Text(
                      'Keyboard State - visibile',
                      style: TextStyle(color: Colors.greenAccent),
                    )
                  : const Text('Keyboard State - hidden',
                      style: TextStyle(color: Colors.redAccent)),
            ),
            ElevatedButton(
              onPressed: () {
                PositionAndSizeWidget(
                  onLayout: (size, offset) {
                    showCustomSnackBar(context, 'Size: $size - $offset');
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
            PositionAndSizeWidget(
              onLayout: (size, offset) {
                showCustomSnackBar(context, 'Size: $size - $offset');
              },
              child: const Text('Size Measuring Widget'),
            ),
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
