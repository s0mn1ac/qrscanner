import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qrscanner/providers/sl_provider.dart';

class AddressesHistoryScreen extends StatelessWidget {

 @override
  Widget build(BuildContext context) {

    final ScanListProvider slProvider = Provider.of<ScanListProvider>(context);
    final scans = slProvider.scans;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: scans.length,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.web, color: Theme.of(context).primaryColor),
        title: Text(scans[i].value),
        subtitle: Text(scans[i].id.toString()),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () => print(scans[i].id.toString())
      )
    );
  }
}