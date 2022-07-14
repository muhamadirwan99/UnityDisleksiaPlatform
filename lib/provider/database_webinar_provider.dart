import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/data/db/database_webinar_helper.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';

import '../utils/result_state.dart';

class DatabaseWebinarProvider extends ChangeNotifier {
  final DatabaseWebinarHelper databaseHelper;

  DatabaseWebinarProvider({required this.databaseHelper}) {
    _getBookmarks();
  }

  ResultState? _state;
  ResultState? get state => _state;

  String _message = '';
  String get message => _message;

  List<Webinar> _bookmarks = [];
  List<Webinar> get bookmarks => _bookmarks;

  void _getBookmarks() async {
    _bookmarks = await databaseHelper.getBookmarks();
    if (_bookmarks.isNotEmpty) {
      _state = ResultState.HasData;
    } else {
      _state = ResultState.NoData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addBookmark(Webinar webinar) async {
    try {
      await databaseHelper.insertBookmark(webinar);
      _getBookmarks();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isBookmarked(String id) async {
    final bookmarkedVideo = await databaseHelper.getBookmarkById(id);
    return bookmarkedVideo.isNotEmpty;
  }

  void removeBookmark(String id) async {
    try {
      await databaseHelper.removeBookmark(id);
      _getBookmarks();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
