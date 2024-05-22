# ui_shared_flutter

- **LAST UPDATED 09-MAR-2024**

## Description

A collection of extensions on *BuildContext* and *Widget*

## Getting Started

Install

```yaml
dependencies:
  ui_shared_flutter:
    git: https://github.com/GitHubStuff/ui_shared_flutter.git
```

## BuildContext

- MediaQueryData mediaQuery
- Size screenSize
- double height
- double width
- bool isKeyBoardOpen
- void hideKeyboard()
- Future<T?> showBottomSheet()
- ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar()

## Widgets

- background(Color color)
- borderAll(...)
- hide(bool state)
- opacity(double shade)
- padding(...)
- paddingAll(double value)
- paddingSymmetric({double horizontal = 0.0, double vertical = 0.0})
- removed(bool state)
- wrap(...)
- wrapAll(...)

## Finally

Be kind to each other.
