import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:training/app/configs/application.dart';
import 'package:training/app/configs/config.dart';
import 'package:training/app/routes/app_pages.dart';

import '../controllers/app_controller.dart';

class AppView extends GetView<AppController> {
  AppView({Key? key}) : super(key: key ?? GlobalKey());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppConfig.navigatorKey,
      title: Application.name,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      theme: AppTheme.getCollectionTheme(),
    );
  }
}
