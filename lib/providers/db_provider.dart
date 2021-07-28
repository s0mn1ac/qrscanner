import 'dart:io';

import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:qrscanner/models/scan.dart';
export 'package:qrscanner/models/scan.dart';

class DBProvider {

  static Database? _database;

  static final DBProvider dbProvider = DBProvider._();

  DBProvider._();

  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    }

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {

    Directory applicationDocumentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(applicationDocumentsDirectory.path, 'QRScannerScans.database');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {

        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          );
        ''');
      }
    );
  }

  // Future<int> addScanRaw(Scan scan) async {

  //   final id = scan.id;
  //   final type = scan.type;
  //   final value = scan.value;

  //   final db = await this.database;

  //   final res = await db.rawInsert('''
  //     INSERT INTO Scans(id, type, value)
  //     VALUES($id, '$type', '$value');
  //   ''');

  //   return res;
  // }

  Future<int> addScan(Scan scan) async {
    final db = await this.database;
    return await db.insert('Scans', scan.toJson());
  }

  Future<Scan?> getScan(int id) async {
    final db = await this.database;
    final rawScan = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return rawScan.isNotEmpty ? Scan.fromJson(rawScan.first) : null;
  }

  Future<List<Scan>> getScans() async {
    final db = await this.database;
    final rawScan = await db.query('Scans');
    return rawScan.isNotEmpty ? rawScan.map((item) => Scan.fromJson(item)).toList() : [];
  }

  Future<List<Scan>> getScansByType(String type) async {
    final db = await this.database;
    final rawScan = await db.rawQuery('''
      SELECT * FROM Scans
      WHERE type = '$type';
    ''');
    return rawScan.isNotEmpty ? rawScan.map((item) => Scan.fromJson(item)).toList() : [];
  }
}