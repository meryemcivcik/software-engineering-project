import 'package:get/get.dart';
import 'package:hackathonapp/app/data/models/library_model.dart';
import 'package:hackathonapp/app/data/services/api_service.dart';

class LibraryRepository {
  ApiService get apiService => Get.find();

  Future<List<LibraryModel>> getLocations() async {
    try {
      final List<LibraryModel> libraryList = [];
      for (var i = 1; i <= 3; i++) {
        var libraryModel = await apiService.getLibrary(i.toString());
        libraryList.add(libraryModel);
      }
      return libraryList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> changeLibraryStatus(LibraryModel libraryModel) async {
    try {
      libraryModel.capacity = "%100";
      var isPostDone = await apiService.postLibrary(libraryModel);
      return isPostDone;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
