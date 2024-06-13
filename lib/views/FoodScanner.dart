import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class FoodScanner extends StatefulWidget {
  @override
  _FoodScannerState createState() => _FoodScannerState();
}

class _FoodScannerState extends State<FoodScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController qrController;
  bool scanning = false;

  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Food Scanner",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xff000000),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff212435),
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Color(0x1fffffff),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  "Scan your Food QR-Code",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.7000000000000001,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xffe4e7e9),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      scanning = !scanning;
                    });
                    if (scanning) {
                      qrController.resumeCamera();
                    } else {
                      qrController.pauseCamera();
                    }
                  },
                  color: scanning ? Colors.red : Color(0xffe32727),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    scanning ? "Stop Scanning" : "Scan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xffffffff),
                  height: MediaQuery.of(context).size.height * 0.08,
                  minWidth: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      qrController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      print('Scanned QR code: ${scanData.code}');
      setState(() {
        scanning = false;
      });
      qrController.pauseCamera();
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: FoodScanner(),
  ));
}
