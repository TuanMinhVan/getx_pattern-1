import 'package:get/get.dart';
import 'package:training/app/configs/config.dart';
import 'package:training/app/cores/models/library_model.dart';

class LibraryController extends GetxController {
  Rx<TextEditingController> textController = TextEditingController().obs;
  RxString textSearch = ''.obs;
  RxList<LibraryModel> listLibrary = RxList();
  var listTmp = <LibraryModel>[];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    createDataMockup();
  }

  void createDataMockup() {
    for (var i = 0; i < 15; i++) {
      var iLibrary = LibraryModel();
      iLibrary.image =
          'https://binhphuoc.gov.vn/uploads/binhphuoc/news/2021_07/cv-hoa-toc-2420.png';
      iLibrary.shortContent =
          '13$i Nguyên Tắc Nghĩ Giàu Làm Giàu là cuốn sách “chỉ dẫn” duy nhất chỉ ra những nguồn lực bạn phải có để thành công. Cuốn sách sẽ giúp bạn trở nên giàu có, làm giàu thêm cho cuộc sống của bạn trên tất cả các phương diện của cuộc sống chứ không chỉ về tài chính và vật chất.';
      listTmp.add(iLibrary);
    }
    listLibrary.addAll(listTmp);
  }

  void onFilter(String textFilter) {
    listLibrary.clear();
    if (textFilter.isEmpty) {
      listLibrary.addAll(listTmp);
      return;
    }
    for (var i = 0; i < listTmp.length; i++) {
      if (isExistContent(listTmp[i].shortContent, textFilter)) {
        listLibrary.add(listTmp[i]);
      }
    }
  }

  bool isExistContent(String source, String? query) {
    if (query == null ||
        query.isEmpty ||
        !source.toLowerCase().contains(query.toLowerCase())) {
      return false;
    }
    return true;
  }

  void onBack() {
    Get.back();
  }

  void onSearchChanged(String value) {
    print('search value: $value');
    textSearch.value = value;
    onFilter(value);
  }

  void onRemoveSearch() {
    textController.value.text = '';
    textSearch.value = '';
    onFilter('');
  }
}
