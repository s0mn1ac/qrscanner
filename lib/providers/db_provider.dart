import 'dart:io';

import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

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
}