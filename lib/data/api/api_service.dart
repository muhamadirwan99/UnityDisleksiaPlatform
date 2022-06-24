import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unity_disleksia_platform/data/model/video_model.dart';

class ApiService {
  static const String _baseUrl = 'http://34.128.78.90:5000/api/';

  Future<VideosResult> listVideos() async {
    final response = await http.get(Uri.parse(_baseUrl + "videos"));
    if (response.statusCode == 200) {
      return VideosResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load videos');
    }
  }

  Future<VideosResult> listRecentVideos() async {
    final response =
        await http.get(Uri.parse(_baseUrl + "videos/update/recent"));
    if (response.statusCode == 200) {
      return VideosResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load recent videos');
    }
  }

  Future<VideosResult> listWebinars() async {
    final response = await http.get(Uri.parse(_baseUrl + "videos"));
    if (response.statusCode == 200) {
      return VideosResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
