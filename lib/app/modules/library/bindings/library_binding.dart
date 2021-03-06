

import 'package:get/get.dart';
import 'package:training/app/modules/library/controllers/library_controller.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibraryController>(() => LibraryController());
  }

}