import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qrscanner/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final UiProvider uiProvider = Provider.of<UiProvider>(context);

    final int currentIndex = uiProvider.selectedMenuOption;

    return BottomNavigationBar(
      onTap: (int value) => uiProvider.selectedMenuOption = value,
      currentIndex: currentIndex,
      elevation: 0.0,
      items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Direcciones'
        )
      ]
    );
  }
}