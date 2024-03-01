import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'nfc_display_page.dart'; // You'll create this next

class NFCReadPage extends StatefulWidget {
  @override
  _NFCReadPageState createState() => _NFCReadPageState();
}

class _NFCReadPageState extends State<NFCReadPage> {
  String _nfcData = 'Ready to scan NFC tags';

  void _startNFC() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      final data = tag.data.toString();
      NfcManager.instance.stopSession();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NFCDisplayPage(data: data)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NFC Reader')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_nfcData),
            ElevatedButton(
              onPressed: _startNFC,
              child: Text('Scan NFC Tag'),
            ),
          ],
        ),
      ),
    );
  }
}
