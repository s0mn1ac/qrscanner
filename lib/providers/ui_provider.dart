import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {

  int _selectedMenuOption = 1;

  int get selectedMenuOption {
    return this._selectedMenuOption;
  }

  set selectedMenuOption(int selectedMenuOption) {
    this._selectedMenuOption = selectedMenuOption;
    notifyListeners();
  }
}