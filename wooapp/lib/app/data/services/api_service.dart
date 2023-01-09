import 'package:get/get.dart';
import 'package:woapp/app/data/models/library_model.dart';
import 'package:woapp/app/data/providers/api_provider.dart';

class ApiService extends GetxService {
  ApiProvider get apiProvider => Get.find();

  Future<LibraryModel> getLibrary(String id) async {
    try {
      var response = await apiProvider.getLibraryFromApi(id);
      var libraryModel = LibraryModel.fromJson(response.body);
      return libraryModel;
    } catch (e) {
      print(e);
      return LibraryModel();
    }
  }

  Future<bool> postLibrary(LibraryModel model) async {
    try {
      await apiProvider.postChangeStatus(model);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
