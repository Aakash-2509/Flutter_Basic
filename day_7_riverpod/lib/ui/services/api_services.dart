import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/suggestion.dart';

final apiServiceProiver = Provider<ApiService>((ref) => ApiService());

class ApiService {
  final _dio = Dio();
  Future<Suggestion> getSuggestion() async {
    // print("APi start");
    try {
      final res = await _dio.get("https://www.boredapi.com/api/activity/");
      // print(res.data);
      return Suggestion.fromJson(res.data);
    } catch (e) {
      // print(e.toString());
      throw Exception('Error');
    }
  }
}
