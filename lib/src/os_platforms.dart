// ignore_for_file: public_member_api_docs

import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _spinner = OSEnum.getPlatformSpinner;

/// Enum to get the current OS and its spinner
enum OSEnum {
  android,
  fuchsia,
  ios,
  linux,
  macos,
  windows;

  static OSEnum get getCurrentOS {
    if (Platform.isAndroid) return OSEnum.android;
    if (Platform.isFuchsia) return OSEnum.fuchsia;
    if (Platform.isIOS) return OSEnum.ios;
    if (Platform.isLinux) return OSEnum.linux;
    if (Platform.isMacOS) return OSEnum.macos;
    if (Platform.isWindows) return OSEnum.windows;
    throw UnsupportedError('This platform is not supported');
  }

  static Widget get appSpinner => _spinner;
  static set appSpinner(Widget spinner) => _spinner = spinner;

  static Widget get getPlatformSpinner {
    switch (getCurrentOS) {
      case OSEnum.android:
        return const CircularProgressIndicator();
      case OSEnum.fuchsia:
        return const CircularProgressIndicator();
      case OSEnum.ios:
        return const CupertinoActivityIndicator();
      case OSEnum.linux:
        return const CircularProgressIndicator();
      case OSEnum.macos:
        return const CupertinoActivityIndicator();
      case OSEnum.windows:
        return const CircularProgressIndicator();
    }
  }
}
