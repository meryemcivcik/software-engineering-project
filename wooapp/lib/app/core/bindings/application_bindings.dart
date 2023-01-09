import 'package:get/get.dart';
import 'package:woapp/app/data/providers/api_provider.dart';
import 'package:woapp/app/data/repositories/library_repository.dart';
import 'package:woapp/app/data/services/api_service.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiProvider>(
      ApiProvider(),
    );

    Get.put<ApiService>(
      ApiService(),
    );

    Get.put<LibraryRepository>(
      LibraryRepository(),
    );
  }
}
