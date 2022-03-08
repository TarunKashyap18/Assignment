import 'dart:io';
import 'package:assignment/util/student_template.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String tableName = "StudentRecord";
  final String columnId = "id";
  final String columnName = "name";
  final String columnBranch = "branch";
  final String columnMobileNumber = "mobileNumber";
  final String columnGender = "gender";
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();
  static Database? _db;
  Future<Database> get db async {
    if (_db != null) return _db!;

    _db = await _initDB();
    return _db!;
  }

  _initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "password_keeper1.db");
    var myDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDb;
  }

  void _onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE $tableName($columnName PRIMARY KEY TEXT,$columnBranch TEXT,$columnMobileNumber TEXT,$columnGender TEXT)";
    await db.execute(sql);
    print("Table is created");
  }

  //  insert data
  Future<int> savedStudent(Student stu) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", stu.toMap());
    print(res.toString());
    return res;
  }

  // String decodeData(String data) {
  //   Codec<String, String> stringToBase64 = utf8.fuse(base64);
  //   String decoded = stringToBase64.decode(data);
  //   print(decoded);
  //   return decoded;
  // }

  //get data
  Future<List> getStudents() async {
    String sql = "SELECT * FROM $tableName ORDER BY $columnName ASC";
    var dbClient = await db;
    var result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> deleteStudent(String name) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: "$columnName = ?", whereArgs: [name]);
  }

  Future<int> updateStudent(Student stu) async {
    var dbClient = await db;
    return await dbClient.update(tableName, stu.toMap(),
        where: "$columnName = ?", whereArgs: [stu.name]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
