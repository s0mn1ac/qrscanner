import 'package:flutter/material.dart';

import 'package:qrscanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<Scan> scans = [];

  String typeSelected = 'http';

  Future<Scan> addNewScan(String value) async {

    final newScan = new Scan(value: value);
    final id = await DBProvider.dbProvider.addScan(newScan);

    newScan.id = id;

    if (this.typeSelected == newScan.type) {
      this.scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  getScans() async {
    final scans = await DBProvider.dbProvider.getScans();
    this.scans = [...scans];
    notifyListeners();
  }

  getScansByType(String type) async {
    final scans = await DBProvider.dbProvider.getScansByType(type);
    this.scans = [...scans];
    this.typeSelected = type;
    notifyListeners();
  }

  deleteScans() async {
    await DBProvider.dbProvider.deleteScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScansByType() async {
    await DBProvider.dbProvider.deleteScansByType(this.typeSelected);
    this.scans = [];
    notifyListeners();
  }

  deleteScan(int id) async {
    await DBProvider.dbProvider.deleteScan(id);
    this.getScansByType(this.typeSelected);
  }

}