import 'package:get/get_connect.dart';
import 'package:woapp/app/data/models/library_model.dart';

class ApiProvider extends GetConnect {
  Future<Response> getLibraryFromApi(String id) async =>
      await get("https://13de-88-239-133-203.eu.ngrok.io/id/$id");
  Future<Response> postChangeStatus(LibraryModel libraryModel) async =>
      await post("https://7d1e-88-239-133-203.eu.ngrok.io/id/${libraryModel.id}", libraryModel.capacity);
}
