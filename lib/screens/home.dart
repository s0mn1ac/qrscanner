import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qrscanner/providers/sl_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';

import 'package:qrscanner/screens/addresses_history.dart';
import 'package:qrscanner/screens/maps_history.dart';

import 'package:qrscanner/widgets/custom_navigation_bar.dart';
import 'package:qrscanner/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false).deleteScans();
            },
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

    final UiProvider uiProvider = Provider.of<UiProvider>(context);
    final ScanListProvider slProvider = Provider.of<ScanListProvider>(context, listen: false);
    
    final int currentIndex = uiProvider.selectedMenuOption;

    switch (currentIndex) {

      case 0:
        slProvider.getScansByType('geo');
        return MapsHistoryScreen();

      case 1:
        slProvider.getScansByType('http');
        return AddressesHistoryScreen();

      default:
        return AddressesHistoryScreen();
    }
  }
}