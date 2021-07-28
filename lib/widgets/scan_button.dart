import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qrscanner/providers/sl_provider.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      elevation: 0.0,
      child: Icon(Icons.qr_code_scanner),
      onPressed: () async {
        
        // final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#512DA8', 'Cancelar', false, ScanMode.QR);

        final String barcodeScanRes = 'https://fernando-herrera.com';
        
        if(barcodeScanRes != '-1') {
          final ScanListProvider slProvider = Provider.of<ScanListProvider>(context, listen: false);
          slProvider.addNewScan(barcodeScanRes);
          slProvider.addNewScan('geo:15.33,15.66');
        }
      },
    );
  }
}