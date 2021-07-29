import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:qrscanner/providers/db_provider.dart';

void launchURL(BuildContext context, Scan scan) async {

  final url = scan.value;

  if (scan.type == 'http') {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'maps', arguments: scan);
  }
}