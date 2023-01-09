import 'package:get/get.dart';

import '../modules/giris/giris_binding.dart';
import '../modules/giris/giris_page.dart';

class GirisRoutes {
  GirisRoutes._();

  static final routes = [
    GetPage(
      name: '/giris',
      page: GirisPage.new,
      binding: GirisBinding(),
    ),
  ];
}
