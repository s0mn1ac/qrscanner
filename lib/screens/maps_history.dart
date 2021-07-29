import 'package:flutter/material.dart';

import 'package:qrscanner/widgets/scans_list.dart';

class MapsHistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ScansList(type: 'geo');
  }
}