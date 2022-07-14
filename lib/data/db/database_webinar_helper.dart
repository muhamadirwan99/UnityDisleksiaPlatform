import 'package:sqflite/sqflite.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';

class DatabaseWebinarHelper {
  static DatabaseWebinarHelper? _instance;
  static Database? _database;

  DatabaseWebinarHelper._internal() {
    _instance = this;
  }

  factory DatabaseWebinarHelper() =>
      _instance ?? DatabaseWebinarHelper._internal();

  static const String _tblBookmark = 'bookmarks';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/webinar.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookmark (
             name TEXT,
             desc TEXT,
             link TEXT,
             date TEXT,
             thumbnail TEXT,
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

  Future<void> insertBookmark(Webinar webinar) async {
    final db = await database;
    await db!.insert(_tblBookmark, webinar.toJson());
  }

  Future<List<Webinar>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblBookmark);

    return results.map((res) => Webinar.fromJson(res)).toList();
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
