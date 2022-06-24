import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';

enum ResultState { Loading, NoData, HasData, Error }

class VideoProvider extends ChangeNotifier {
  final ApiService apiService;

  VideoProvider({required this.apiService}) {
    _fetchAllVideo();
  }

  late VideosResult _videosResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  VideosResult get result => _videosResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllVideo() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final video = await apiService.listVideos();
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
