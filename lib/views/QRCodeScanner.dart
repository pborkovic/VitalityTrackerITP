import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRScannerPage(),
    );
  }
}

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  late QRScannerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = QRScannerController();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initializeCamera();
    setState(() {}); // Refresh UI after camera initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Scanner')),
      body: _controller.cameraController.value.isInitialized
          ? QRView(
        key: GlobalKey(debugLabel: 'QR'),
        onQRViewCreated: _controller.onQRViewCreated,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }
}
