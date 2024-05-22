import 'package:flutter/material.dart';

/// Wrapper widget that provides the size and position of its child widget.
class PositionAndSizeWidget extends StatefulWidget {
  final Widget child;
  final void Function(Size size, Offset position) onLayout;

  const PositionAndSizeWidget({
    super.key,
    required this.onLayout,
    required this.child,
  });

  @override
  State<PositionAndSizeWidget> createState() => _PositionAndSizeWidgetState();
}

class _PositionAndSizeWidgetState extends State<PositionAndSizeWidget> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        widget.onLayout(renderBox.size, renderBox.localToGlobal(Offset.zero));
      }
    });

    return Container(
      key: _key,
      child: widget.child,
    );
  }
}
