import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unity_disleksia_platform/data/model/video_model.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';

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

  Future<WebinarsResult> listWebinars() async {
    final response = await http.get(Uri.parse(_baseUrl + "webinars"));
    if (response.statusCode == 200) {
      return WebinarsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load webinars');
    }
  }
}