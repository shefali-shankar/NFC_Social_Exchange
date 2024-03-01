import 'package:flutter/material.dart';

class NFCDisplayPage extends StatelessWidget {
  final String data;

  NFCDisplayPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NFC Data')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(data, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
