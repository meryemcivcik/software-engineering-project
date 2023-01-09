import 'package:get/get.dart';

import 'maps_controller.dart';

class MapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsController>(
      MapsController.new,
    );
  }
}
