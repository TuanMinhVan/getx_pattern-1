import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

class UtilLogger {
  factory UtilLogger() {
    return _instance;
  }

  UtilLogger._internal();
  static final UtilLogger _instance = UtilLogger._internal();
  static const String TAG = 'App';

  static void log(dynamic msg, {String tag = TAG}) {
    if (kDebugMode) {
      developer.log('$msg', name: tag);
    }
  }
}
