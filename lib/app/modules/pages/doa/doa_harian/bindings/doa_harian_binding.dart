import 'package:get/get.dart';

import '../controllers/doa_harian_controller.dart';

class DoaHarianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaHarianController>(
      () => DoaHarianController(),
    );
  }
}
