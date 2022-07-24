import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';

class WebinarProvider extends ChangeNotifier {
  final ApiService apiService;

  WebinarProvider({required this.apiService}) {
    fetchAllWebinar();
  }

  late WebinarsResult _webinarsResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  WebinarsResult get result => _webinarsResult;

  ResultState get state => _state;

  Future<dynamic> fetchAllWebinar() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final webinar = await apiService.listWebinars();
      if (webinar.data.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _webinarsResult = webinar;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
