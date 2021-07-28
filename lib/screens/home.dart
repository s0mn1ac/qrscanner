import 'package:flutter/material.dart';
import 'package:qrscanner/screens/addresses_history.dart';
import 'package:qrscanner/screens/maps_history.dart';

import 'package:qrscanner/widgets/custom_navigation_bar.dart';
import 'package:qrscanner/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final currentIndex = 0;

    switch (currentIndex) {
      case 0:
        return MapsHistoryScreen();
      case 1:
        return AddressesHistoryScreen();
      default:
        return MapsHistoryScreen();
    }
  }
}