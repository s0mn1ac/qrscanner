import 'package:flutter/material.dart';

import 'package:qrscanner/screens/home.dart';
import 'package:qrscanner/screens/maps.dart';
 
void main() => runApp(QRScannerApp());
 
class QRScannerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'maps': (_) => MapsScreen()
      },
    );
  }
}