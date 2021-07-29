import 'package:flutter/material.dart';
import 'package:qrscanner/providers/db_provider.dart';

class MapsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Scan scan = ModalRoute.of(context)!.settings.arguments as Scan;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Mapa'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(scan.value),
      ),
    );
  }
}