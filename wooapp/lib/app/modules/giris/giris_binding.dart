import 'package:get/get.dart';

import 'giris_controller.dart';

class GirisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GirisController>(
      GirisController.new,
    );
  }
}
