import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

Scan scanFromJson(String str) => Scan.fromJson(json.decode(str));

String scanToJson(Scan data) => json.encode(data.toJson());

class Scan {

  Scan({
    this.id,
    this.type,
    required this.value,
  }) {
    this.type = this.value.contains('http') ? 'http' : 'geo';
  }

  int? id;
  String? type;
  String value;

  LatLng getLatLng() {

    final latLng = this.value.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);
    return LatLng(lat, lng);
  }

  factory Scan.fromJson(Map<String, dynamic > json) => Scan(
    id: json["id"],
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic > toJson() => {
    "id": id,
    "type": type,
    "value": value,
  };
}
