import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FirestoreHelper {
  static final FirestoreHelper _instance = FirestoreHelper._internal();

  factory FirestoreHelper() => _instance;

  FirestoreHelper._internal();

  static FirestoreHelper get instance => _instance;

  Future<void> insertUser(Map<String, dynamic> user) async {
    Database db = await _getDatabase();
    await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUser(String studentNumber) async {
    Database db = await _getDatabase();
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'studentNumber = ?',
      whereArgs: [studentNumber],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(studentNumber TEXT PRIMARY KEY, firstName TEXT, lastName TEXT, password TEXT, profilePictureUrl TEXT)",
        );
      },
      version: 1,
    );
  }
}
