import 'package:diatfori/data/model/resep_list.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblFavorite = 'favorite';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/resepf.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblFavorite (
            key TEXT PRIMARY KEY,
            thumb TEXT,
            title TEXT,
            times TEXT
           )
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    } else {
      null;
    }

    return _database;
  }

  Future<void> insertFavorite(ResultResep resep) async {
    final db = await database;
    await db!.insert(_tblFavorite, resep.toJson());
  }

  Future<List<ResultResep>> getFavorite() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblFavorite);

    return results.map((res) => ResultResep.fromJson(res)).toList();
  }

  Future<Map> getFavoriteByKey(String key) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblFavorite,
      where: 'key = ?',
      whereArgs: [key],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String key) async {
    final db = await database;

    await db!.delete(
      _tblFavorite,
      where: 'key = ?',
      whereArgs: [key],
    );
  }
}