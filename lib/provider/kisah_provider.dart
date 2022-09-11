import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/model/kisah_model.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';

class KisahProvider extends ChangeNotifier {
  final ApiService apiService;

  KisahProvider({required this.apiService}) {
    fetchKisah();
  }

  late KisahResult _kisahResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  KisahResult get result => _kisahResult;

  ResultState get state => _state;

  Future<dynamic> fetchKisah() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final kisah = await apiService.listKisah();
      if (kisah.data.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _kisahResult = kisah;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
