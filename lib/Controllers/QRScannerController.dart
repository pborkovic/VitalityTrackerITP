import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String scannedId = '';

  Future<void> scanQRCode(BuildContext context, Function(String) onScanCompleted) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 400,
            width: 400,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (QRViewController controller) {
                controller.scannedDataStream.listen((scanData) {
                  scannedId = scanData.code ?? '';
                  controller.dispose();
                  Navigator.pop(context); // Close the dialog
                });
              },
            ),
          ),
        );
      },
    ).then((_) {
      if (scannedId.isNotEmpty) {
        onScanCompleted(scannedId);
      } else {
        print('No QR code scanned.');
      }
    });
  }
}
