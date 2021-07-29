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

  MapType mapType = MapType.normal;
  IconData icon = Icons.terrain;

  @override
  Widget build(BuildContext context) {

    final Scan scan = ModalRoute.of(context)!.settings.arguments as Scan;
    
    final CameraPosition initialPoint = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('main-marker'),
      position: scan.getLatLng()
    ));
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Mapa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: scan.getLatLng(),
                  zoom: 17.5,
                  tilt: 50
                )
              ));
            },
          )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(icon),
        onPressed: () {
          setState(() {
            mapType == MapType.normal ? mapType = MapType.hybrid : mapType = MapType.normal;
            icon == Icons.terrain ? icon = Icons.satellite : icon = Icons.terrain;
          });
        }
      )
    );
  }
}