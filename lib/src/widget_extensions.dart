import 'package:flutter/material.dart';

/// A Dart extension on the Flutter `Widget` class to provide additional
/// convenience methods for manipulating widget properties.
extension WidgetExtensions on Widget {
  /// Returns an invisible version of the widget if [isVisible] is `true`,
  /// otherwise returns the widget as is.
  Widget hide(bool isVisible) => isVisible ? withOpacity(0.0) : this;

  /// Removes the widget from the layout if [isRemove] is `true`, replacing it
  /// with an empty box, otherwise returns the widget as is.
  Widget remove(bool isRemove) => isRemove ? const SizedBox.shrink() : this;

  /// Wraps the widget with a `DecoratedBox` that applies a background [color].
  Widget withBackground(Color color) => DecoratedBox(
        decoration: BoxDecoration(color: color),
        child: this,
      );

  /// Adds a border to the widget with specified [color], optional [width], [radius], and
  /// [style].
  Widget withBorder(
    Color color, {
    double width = 1.5,
    double radius = 0.0,
    BorderStyle style = BorderStyle.solid,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width, style: style),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: this,
      );

  /// Applies opacity to the widget, defined by [opacityValue].
  /// Throws an assertion error if [opacityValue] is not between 0.0 and 1.0.
  Widget withOpacity(double opacityValue) {
    assert(opacityValue >= 0.0 && opacityValue <= 1.0,
        'Opacity must be between 0.0 and 1.0');
    return Opacity(opacity: opacityValue, child: this);
  }

  /// Adds padding to the widget on all sides individually specified by
  /// [left], [right], [top], and [bottom].
  Widget withPadding({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );

  /// Adds uniform padding around the widget specified by [value].
  Widget withPaddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Adds symmetric padding to the widget, specified by [horizontal] and
  /// [vertical].
  Widget withSymmetricPadding(
          {double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  /// Wraps the widget with a specified color background and padding defined by
  /// [left], [right], [top], and [bottom].
  Widget withWrap({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
    Color color = Colors.transparent,
  }) =>
      Container(
        color: color,
        child: withPadding(left: left, right: right, top: top, bottom: bottom),
      );

  /// Wraps the widget with a specified [color] background and uniform padding
  /// around the widget defined by [value].
  Widget withWrapAll(double value, {Color color = Colors.transparent}) =>
      withWrap(
        left: value,
        right: value,
        top: value,
        bottom: value,
        color: color,
      );
}
