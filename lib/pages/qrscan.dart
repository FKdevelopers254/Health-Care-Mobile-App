import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  String qrText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: qrText.isEmpty
                  ? QrImage(
                data: "",
                size: 200,
              )
                  : QrImage(
                data: qrText,
                size: 200,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Scanned QR code data",
            ),
            readOnly: true,
            controller: TextEditingController(text: qrText),
          ),
          TextButton(
            onPressed: scanQR,
            child: Text("Scan QR code"),
          ),
        ],
      ),
    );
  }

  Future scanQR() async {
    String? cameraScanResult = await scanner.scan();
    setState(() {
      qrText = cameraScanResult!;
    });
  }
}
