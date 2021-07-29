import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qrscanner/providers/db_provider.dart';

class MapsScreen extends StatefulWidget {

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    final CameraPosition initialPoint = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    final Scan scan = ModalRoute.of(context)!.settings.arguments as Scan;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Mapa'),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        }
      )
    );
  }
}