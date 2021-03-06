import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';

class SearchWebinarProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchWebinarProvider({required this.apiService}) {
    fetchSearchWebinar(name: name);
  }

  WebinarsResult? _webinarsResult;
  ResultState? _state;
  String _message = '';
  String _name = '';

  String get message => _message;
  String get name => _name;

  WebinarsResult? get result => _webinarsResult;

  ResultState? get state => _state;

  Future<dynamic> fetchSearchWebinar({String? name}) async {
    try {
      _state = ResultState.Loading;
      _name = name!;

      final webinar = await apiService.listSearchWebinars(name);
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
