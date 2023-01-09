import 'package:woapp/app/routes/giris_routes.dart';

import 'home_routes.dart';
import 'maps_routes.dart';


class AppPages {
  AppPages._();

  static const INITIAL = '/maps';

  static final routes = [
    ...HomeRoutes.routes,
    ...GirisRoutes.routes,
    ...MapsRoutes.routes,
		
  ];
}
