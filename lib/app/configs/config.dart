library config;

import 'dart:async';

import 'package:flutter/material.dart';
export 'package:velocity_x/velocity_x.dart';
export 'package:flutter/material.dart';
part 'extensions/context_extension.dart';
part 'theme.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    required this.apiUrl,
    required this.appName,
    required this.flavorName,
    required Widget child,
  }) : super(child: Material(child: child)) {
    _globalKey = child.key as GlobalKey;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (isDev) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      }
    };
  }

  final String apiUrl, appName;
  final AppFlavor flavorName;
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey? _globalKey;
  static GlobalKey get globalKey => _globalKey!;

  bool get isDev => flavorName == AppFlavor.DEVELOPMENT;

  AppConfig copyWith({
    String? appName,
    AppFlavor? flavorName,
    String? apiUrl,
    Widget? child,
  }) {
    return AppConfig(
      apiUrl: apiUrl ?? this.apiUrl,
      appName: appName ?? this.appName,
      flavorName: flavorName ?? this.flavorName,
      child: child ?? this.child,
    );
  }

  static AppConfig get instance => _globalKey!.currentContext!.dependOnInheritedWidgetOfExactType(aspect: AppConfig)!;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

enum AppFlavor { DEVELOPMENT, TEST, PRODUCTION }
