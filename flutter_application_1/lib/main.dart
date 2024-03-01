import 'package:flutter/material.dart';
import 'nfc_read_page.dart'; // Make sure to create this page

void main() {
  runApp(NFCApp());
}

class NFCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFC Information Exchange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NFCReadPage(),
    );
  }
}
