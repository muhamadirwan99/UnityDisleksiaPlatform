import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/model/tips_model.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';

class TipsPembelajaranProvider extends ChangeNotifier {
  final ApiService apiService;

  TipsPembelajaranProvider({required this.apiService}) {
    fetchAllTips();
  }

  late TipsResult _tipsResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  TipsResult get result => _tipsResult;

  ResultState get state => _state;

  Future<dynamic> fetchAllTips() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final tips = await apiService.listTipsPembelajaran();
      if (tips.data.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _tipsResult = tips;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
