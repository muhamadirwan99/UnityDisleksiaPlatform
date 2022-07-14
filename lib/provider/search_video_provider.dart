import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';

class SearchVideoProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchVideoProvider({required this.apiService}) {
    fetchSearchVideo(name: name);
  }

  VideosResult? _videosResult;
  ResultState? _state;
  String _message = '';
  String _name = '';

  String get message => _message;
  String get name => _name;

  VideosResult? get result => _videosResult;

  ResultState? get state => _state;

  Future<dynamic> fetchSearchVideo({String? name}) async {
    try {
      _state = ResultState.Loading;
      _name = name!;

      final video = await apiService.listSearchVideos(name);
      if (video.data.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _videosResult = video;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
