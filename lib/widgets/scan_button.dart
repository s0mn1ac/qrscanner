import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qrscanner/providers/sl_provider.dart';
import 'package:qrscanner/utils/utils.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      elevation: 0.0,
      child: Icon(Icons.qr_code_scanner),
      onPressed: () async {
        
        final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#512DA8', 'Cancelar', false, ScanMode.QR);

        if (barcodeScanRes == '-1') {
          return;
        }

        final ScanListProvider slProvider = Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await slProvider.addNewScan(barcodeScanRes);

        launchURL(context, newScan);
      },
    );
  }
}