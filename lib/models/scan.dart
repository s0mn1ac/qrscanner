import 'dart:convert';

Scan scanFromJson(String str) => Scan.fromJson(json.decode(str));

String scanToJson(Scan data) => json.encode(data.toJson());

class Scan {

  Scan({
    this.id,
    required this.type,
    required this.value,
  }) {
    this.type = this.type.contains('http') ? 'http' : 'geo';
  }

  int? id;
  String type;
  String value;

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
