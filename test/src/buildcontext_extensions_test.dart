import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_shared/ui_shared.dart';

void main() {
  testWidgets(
    'BuildContextExtension methods test',
    (WidgetTester tester) async {
      // Create a MaterialApp with a home widget that uses MediaQuery.
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              // Test screenSize
              expect(context.screenSize, isNotNull);
              expect(context.screenSize, equals(MediaQuery.of(context).size));

              // Test height and width
              expect(context.height, equals(context.screenSize.height));
              expect(context.width, equals(context.screenSize.width));

              // Test keyboard visibility
              expect(
                context.isKeyBoardOpen,
                isFalse,
              ); // Initially, keyboard should not be open

              // Test hideKeyboard
              context.hideKeyboard();
              expect(
                context.isKeyBoardOpen,
                isFalse,
              ); // Still should be false since keyboard was not opened

              return Container();
            },
          ),
        ),
      );
    },
  );
}
