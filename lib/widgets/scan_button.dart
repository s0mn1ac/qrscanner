import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      elevation: 0.0,
      child: Icon(Icons.qr_code_scanner),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#512DA8', 'Cancelar', false, ScanMode.QR);
        print(barcodeScanRes);
      },
    );
  }
}