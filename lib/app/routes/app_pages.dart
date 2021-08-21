import 'package:get/get.dart';

import 'package:training/app/modules/home/bindings/home_binding.dart';
import 'package:training/app/modules/home/views/home_view.dart';
import 'package:training/app/modules/library/bindings/library_binding.dart';
import 'package:training/app/modules/library/views/library_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => LibraryView(),
      binding: LibraryBinding(),
    ),
  ];
}
