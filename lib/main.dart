import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qrscanner/providers/sl_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';

import 'package:qrscanner/screens/home.dart';
import 'package:qrscanner/screens/maps.dart';
 
void main() => runApp(QRScannerApp());
 
class QRScannerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'maps': (_) => MapsScreen()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.deepPurple
          )
        )
      )
    );
  }
}