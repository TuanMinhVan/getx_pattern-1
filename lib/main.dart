import 'package:flutter/material.dart';
import 'package:training/app/configs/application.dart';
import 'package:training/app/configs/config.dart';

import 'package:training/app/modules/app/views/app_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Application().setPreferences();
  final configuredApp = AppConfig(
    apiUrl: Application.domain,
    appName: Application.name,
    flavorName: AppFlavor.DEVELOPMENT,
    child: AppView(key: GlobalKey()),
  );
  runApp(GestureDetector(
    onTap: () => WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus(),
    child: configuredApp,
  ));
}
