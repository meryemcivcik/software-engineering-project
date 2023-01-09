import 'package:get/get.dart';
import 'package:woapp/app/modules/maps/maps_page.dart';

import '../modules/maps/maps_binding.dart';

class MapsRoutes {
  MapsRoutes._();

  static final routes = [
    GetPage(
      name: '/maps',
      page: MapsPage.new,
      binding: MapsBinding(),
    ),
  ];
}
