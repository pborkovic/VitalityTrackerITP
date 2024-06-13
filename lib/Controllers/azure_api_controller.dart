import 'package:http/http.dart' as http;
import 'dart:convert';

class AzureAPIController {
  Future<void> sendToAzure(int userId, String date, int consumedCalories, int burnedCalories) async {
    final url = 'https://your-azure-api-endpoint.com/calorie-tracking'; // Replace with your Azure API endpoint

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'UserID': userId,
        'Date': date,
        'ConsumedCalories': consumedCalories,
        'BurnedCalories': burnedCalories,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send data to Azure: ${response.statusCode}');
    }
  }
}
