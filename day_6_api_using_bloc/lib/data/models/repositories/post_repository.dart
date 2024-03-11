import 'package:day_6_api_using_bloc/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'api/api.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>?> fetchPost() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;

      return postMaps.map((map) => PostModel.fromJson(map)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
