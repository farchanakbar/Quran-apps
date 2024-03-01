import 'package:get/get.dart';

import '../controllers/niat_sholat_controller.dart';

class NiatSholatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NiatSholatController>(
      () => NiatSholatController(),
    );
  }
}
