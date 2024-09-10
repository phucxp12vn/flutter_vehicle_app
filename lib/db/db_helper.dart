import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_auth.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        isLoggedIn INTEGER
      )
    ''');
  }

  Future<void> insertLoginState(bool isLoggedIn) async {
    final db = await database;
    await db.insert('user', {'isLoggedIn': isLoggedIn ? 1 : 0});
  }

  Future<bool> isUserLoggedIn() async {
    final db = await database;
    final result = await db.query('user', limit: 1);
    if (result.isNotEmpty) {
      return result.first['isLoggedIn'] == 1;
    }
    return false;
  }

  Future<void> clearLoginState() async {
    final db = await database;
    await db.delete('user');
  }
}
