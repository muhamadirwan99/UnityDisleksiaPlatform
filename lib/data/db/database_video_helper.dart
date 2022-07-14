import 'package:sqflite/sqflite.dart';

import '../model/video_model.dart';

class DatabaseVideoHelper {
  static DatabaseVideoHelper? _instance;
  static Database? _database;

  DatabaseVideoHelper._internal() {
    _instance = this;
  }

  factory DatabaseVideoHelper() => _instance ?? DatabaseVideoHelper._internal();

  static const String _tblBookmark = 'bookmarks';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/video.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookmark (
             name TEXT,
             idYt TEXT,
             desc TEXT,
             thumbnail TEXT,
             modul TEXT,
             createdAt TEXT,
             updatedAt TEXT,
             id TEXT PRIMARY KEY
           )
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<void> insertBookmark(Video video) async {
    final db = await database;
    await db!.insert(_tblBookmark, video.toJson());
  }

  Future<List<Video>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblBookmark);

    return results.map((res) => Video.fromJson(res)).toList();
  }

  Future<Map> getBookmarkById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblBookmark,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeBookmark(String id) async {
    final db = await database;

    await db!.delete(
      _tblBookmark,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
