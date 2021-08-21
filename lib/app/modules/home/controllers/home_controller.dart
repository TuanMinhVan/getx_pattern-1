import 'package:get/get.dart';
import 'package:training/app/routes/app_pages.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onLibrary() {
    Get.toNamed(Routes.LIBRARY);
  }
}
