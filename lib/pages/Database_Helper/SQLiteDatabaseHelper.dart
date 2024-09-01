import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'static_users.dart'; // Ensure this file has your `User` class definition

class SQLDatabaseHelper {
  static final _databaseName = "user_database.db";
  static final _databaseVersion = 1;

  static final table = 'user_table';

  static final columnId = '_id';
  static final columnFirstName = 'firstName';
  static final columnLastName = 'lastName';
  static final columnStudentNumber = 'studentNumber';
  static final columnPassword = 'password';
  static final columnProfilePictureUrl = 'profilePictureUrl';

  SQLDatabaseHelper._privateConstructor();
  static final SQLDatabaseHelper instance = SQLDatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnFirstName TEXT NOT NULL,
        $columnLastName TEXT NOT NULL,
        $columnStudentNumber TEXT NOT NULL UNIQUE,
        $columnPassword TEXT NOT NULL,
        $columnProfilePictureUrl TEXT
      )
    ''');
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    await db.insert(table, user, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> getAllUsers() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<Map<String, dynamic>?> getUser(String studentNumber) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      where: '$columnStudentNumber = ?',
      whereArgs: [studentNumber],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }
}
