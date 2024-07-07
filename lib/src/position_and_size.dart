import 'package:flutter/material.dart';

/// Wrapper widget that provides the size and position of its child widget.
class PositionAndSizeWidget extends StatefulWidget {
  /// Constructor for the [PositionAndSizeWidget].
  const PositionAndSizeWidget({
    required this.onLayout,
    required this.child,
    super.key,
  });

  /// The child widget to provide the size and position for.
  final Widget child;

  /// Callback function that provides the size and position of the child widget.
  final void Function(Size size, Offset position) onLayout;

  @override
  State<PositionAndSizeWidget> createState() => _PositionAndSizeWidgetState();
}

class _PositionAndSizeWidgetState extends State<PositionAndSizeWidget> {
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
  }

  void _onLayoutDone(_) {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      widget.onLayout(renderBox.size, renderBox.localToGlobal(Offset.zero));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: widget.child,
    );
  }
}
