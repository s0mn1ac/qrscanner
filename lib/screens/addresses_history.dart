import 'package:flutter/material.dart';

import 'package:qrscanner/widgets/scans_list.dart';

class AddressesHistoryScreen extends StatelessWidget {

 @override
  Widget build(BuildContext context) {

    return ScansList(type: 'http');
  }
}