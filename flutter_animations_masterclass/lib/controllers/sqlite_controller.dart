// import 'dart:async';
//
// import 'package:flutter_animations_masterclass/models/sqlite_test_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//
// class SqliteController {
//   Database? _database;
//   // Future<String> getDatabasesPath() => databaseFactory.getDatabasesPath();
//
//   Future<Database> get database async {
//     print('디비 불러오기');
//     if (_database != null) return _database!;
//
//     return await initDB();
//   }
//
//   initDB() async {
//     print('디비 이닛');
//     String path = join(await getDatabasesPath(), 'test_database.db');
//     return await openDatabase(path,
//         version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
//   }
//
//   FutureOr<void> _onCreate(Database db, int version) {
//     print('디비생성');
//     String sql = '''
//   CREATE TABLE testTable(
//     No INTEGER PRIMARY KEY AUTOINCREMENT,
//     UserID TEXT,
//     Content TEXT,
//     RecordDate DATETIME)
//   ''';
//
//     db.execute(sql);
//   }
//
//   FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
//     print('디비 업그레이드');
//   }
//
//   /// DB에 넣기 (INSERT)
//   Future<void> testInsert(SqliteTestModel item) async {
//     print('DB에 넣기 (INSERT)');
//     var db = await database;
//     try {
//       await db.insert('testTable', item.toMap());
//       print('insert 완료');
//     } catch (e) {
//       print('insert 에럭 : ${e}');
//     }
//   }
//
//   /// DB에서 꺼내오기 (SELECT)
//   Future<List<SqliteTestModel>> testSelect() async {
//     print('DB에서 꺼내오기 (SELECT)');
//     var db = await database;
//
//     // testTable 테이블에 있는 모든 field 값을 maps에 저장한다.
//     final List<Map<String, dynamic>> maps = await db.query('testTable');
//     return List.generate(maps.length, (index) {
//       print('select 완료');
//       return SqliteTestModel(
//           No: maps[index]['No'] as int,
//           UserID: maps[index]['UserID'] as String,
//           Content: maps[index]['Content'] as String,
//           RecordDate: maps[index]['RecordDate'] as String);
//     });
//   }
//
//   /// DB내용 수정하기 (UPDATE)
//   Future<void> testUpdate(SqliteTestModel item) async {
//     print('DB내용 수정하기 (UPDATE)');
//     var db = await database;
//
//     try {
//       await db.update('testTable', item.toMap(),
//           where: 'No = ?', whereArgs: [item.No]);
//       print('db 내용 수정 완료');
//     } catch (e) {
//       print('db 내용 수정 에러 : ${e}');
//     }
//   }
//
//   /// DB내용 지우기(DELETE)
//   Future<void> testDelete(int no) async {
//     print('DB내용 지우기(DELETE)');
//     var db = await database;
//
//     try {
//       await db.delete('testTable', where: 'No = ?', whereArgs: [no]);
//       print('db내용 지우기 완료');
//     } catch (e) {
//       print('db내용 지우기 에러 : ${e}');
//     }
//   }
// }
