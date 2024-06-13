import 'package:flutter/material.dart';
import 'qr_scanner_controller.dart';
import 'fatsecret_api_controller.dart';
import 'azure_api_controller.dart';

class ScanAndUploadPage extends StatefulWidget {
  @override
  _ScanAndUploadPageState createState() => _ScanAndUploadPageState();
}

class _ScanAndUploadPageState extends State<ScanAndUploadPage> {
  final qrScannerController = QRScannerController();
  final fatSecretAPIController = FatSecretAPIController();
  final azureAPIController = AzureAPIController();

  void onScanCompleted(String scannedId) async {
    try {
      final foodData = await fatSecretAPIController.fetchFoodData(scannedId);

      final int userId = 123; // Replace with actual user ID
      final String date = DateTime.now().toIso8601String(); // Replace with actual date from data if available
      final int consumedCalories = foodData['food']['calories']; // Adjust the path according to actual response structure
      final int burnedCalories = 0; // Replace with actual burned calories if available

      await azureAPIController.sendToAzure(userId, date, consumedCalories, burnedCalories);
      print('Data successfully sent to Azure');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FatSecret Food Scanner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await qrScannerController.scanQRCode(context, onScanCompleted);
          },
          child: Text('Scan QR Code'),
        ),
      ),
    );
  }
}
