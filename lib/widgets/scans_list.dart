import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qrscanner/providers/sl_provider.dart';
import 'package:qrscanner/utils/utils.dart';

class ScansList extends StatelessWidget {

  final String type;

  const ScansList({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ScanListProvider slProvider = Provider.of<ScanListProvider>(context);
    final scans = slProvider.scans;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false).deleteScan(scans[i].id!);
        },
        background: Container(
          padding: EdgeInsets.only(right: 20.0),
          color: Colors.redAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete, color: Colors.white)
            ],
          ),
        ),
        child: ListTile(
          leading: Icon(this.type == 'http' ? Icons.home_outlined : Icons.map_outlined, color: Theme.of(context).primaryColor),
          title: Text(scans[i].value),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[i])
        )
      )
    );
  }
}