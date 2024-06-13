import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

class FatSecretAPIController {
  Future<String> generateOAuthSignature(String method, String url, Map<String, String> params, String consumerSecret, {String tokenSecret = ''}) async {
    var sortedParams = params.entries.toList()..sort((a, b) => a.key.compareTo(b.key));
    var encodedParams = sortedParams.map((e) => '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}').join('&');

    var baseString = '$method&${Uri.encodeComponent(url)}&${Uri.encodeComponent(encodedParams)}';
    var signingKey = '${Uri.encodeComponent(consumerSecret)}&${Uri.encodeComponent(tokenSecret)}';

    var hmacSha1 = Hmac(sha1, signingKey.codeUnits);
    var digest = hmacSha1.convert(baseString.codeUnits);
    var signature = base64Encode(digest.bytes);

    return signature;
  }

  Future<Map<String, dynamic>> fetchFoodData(String foodId) async {
    final method = 'GET';
    final url = 'https://platform.fatsecret.com/rest/server.api';
    final params = {
      'method': 'food.get.v2',
      'food_id': foodId,
      'format': 'json',
      'oauth_consumer_key': '334e7b5719bc487cb7870ca84479909e',
      'oauth_nonce': Uuid().v4(),
      'oauth_signature_method': 'HMAC-SHA1',
      'oauth_timestamp': (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
      'oauth_version': '1.0'
    };

    final signature = await generateOAuthSignature(method, url, params, '712dd789f9aa461fb0c9a088b130eef7');
    params['oauth_signature'] = signature;

    final response = await http.get(
      Uri.parse(url).replace(queryParameters: params),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to retrieve data: ${response.statusCode}');
    }
  }
}
