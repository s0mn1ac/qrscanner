import 'package:flutter/material.dart';

import 'package:qrscanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<Scan> scans = [];

  String typeSelected = 'http';

  addNewScan(String value) async {

    final newScan = new Scan(value: value);
    final id = await DBProvider.dbProvider.addScan(newScan);

    // Añadir el ID ofrecido por la base de datos al modelo
    newScan.id = id;

    if (this.typeSelected == newScan.type) {
      this.scans.add(newScan);
      notifyListeners();
    }
  }

  getScans() async {
    final scans = await DBProvider.dbProvider.getScans();
    this.scans = [...scans];
    notifyListeners();
  }

  getScansByType(String type) async {
    final scans = await DBProvider.dbProvider.getScansByType(type);
    this.scans = [...scans];
    notifyListeners();
  }

  deleteScans() async {
    await DBProvider.dbProvider.deleteScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScan(int id) async {
    await DBProvider.dbProvider.deleteScan(id);
    this.getScansByType(this.typeSelected);
  }

}