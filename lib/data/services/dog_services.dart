import 'dart:convert';

import 'package:http/http.dart';
import 'package:loading_provider_example/data/services/base_url.dart';

class DogServices {
  Base base = Base.dogBaseUrl;
  late String baseUrl;

  DogServices() {
    baseUrl = BaseUrl.getBaseUrl(base);
  }

  Future<Map<String, dynamic>> getDog() async {
    Response response = await get(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 204) {
      String body = response.body;
      String newBody = '';
      for (int i = 0; i < body.length; i++) {
        if (body[i] != '\\') {
          print('detected');
            newBody += body[i];
        }
      }
        print('\\');
      print('new body: $newBody');
      return jsonDecode(newBody);
    } else {
      return {"error": true};
    }
  }
}
