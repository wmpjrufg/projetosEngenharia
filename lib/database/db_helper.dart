//import 'dart:ffi';

import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //Tables
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE user(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      cpf TEXT NOT NULL UNIQUE,
      senha TEXT NOT NULL
    )
    """);

    await database.execute("""CREATE TABLE Concreto(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT NOT NULL,
      momentoFlexor REAL NOT NULL,
      alturaUtil REAL NOT NULL,
      alturaUtilLinha REAL NOT NULL,
      largura REAL NOT NULL,
      fck REAL NOT NULL,
      fyk REAL NOT NULL,
      userID INTEGER NOT NULL
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'App2.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // User
  static Future<int> createUser(String cpf, String senha) async {
    final db = await SQLHelper.db();

    final data = {'cpf': cpf, 'senha': senha};
    final id = await db.insert(
      'data',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return id;
  }

  static Future<List<Map<String, dynamic>>> loginUser(
      String cpf, String senha) async {
    final db = await SQLHelper.db();
    final result = await db.query(
      'data',
      where: 'cpf = ? AND senha = ?',
      whereArgs: [cpf, senha],
      limit: 1,
    );
    return result;
  }

  // Concreto
  static Future<int> createConcreto(
      String name,
      double momentoFlexor,
      double alturaUtil,
      double alturaUtilLinha,
      double largura,
      double fck,
      double fyk,
      int userID) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'momentoFlexor': momentoFlexor,
      'alturaUtil': alturaUtil,
      'alturaUtilLinha': alturaUtilLinha,
      'largura': largura,
      'fck': fck,
      'fyk': fyk,
      'userID': userID
    };
    final id = await db.insert(
      'Concreto',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllConcreto() async {
    final db = await SQLHelper.db();

    return db.query('Concreto', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleConcreto(int id) async {
    final db = await SQLHelper.db();
    return db.query('Concreto', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateConcreto(
    int id,
    String? name,
    double? momentoFlexor,
    double? alturaUtil,
    double? alturaUtilLinha,
    double? largura,
    double? fck,
    double? fyk,
  ) async {
    final db = await SQLHelper.db();
    final data = {
      'name': name,
      'momentoFlexor': momentoFlexor,
      'alturaUtil': alturaUtil,
      'alturaUtilLinha': alturaUtilLinha,
      'largura': largura,
      'fck': fck,
      'fyk': fyk,
    };
    final result = await db.update(
      'Concreto',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  static Future<void> deleteConcreto(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete(
        'Concreto',
        where: 'id = ?',
        whereArgs: [id],
      );
      // ignore: empty_catches
    } catch (e) {}
  }
}
