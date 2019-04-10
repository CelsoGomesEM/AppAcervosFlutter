import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<String> get(String url) async {
    var response = await http.get(url);
    return response.body;
  }

  Future<dynamic> postJson(String url, {Map map}) async {
    return json.decode(await post(url, json.encode(map)));
  }

  Future<String> post(String url, body) async {
    var response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    return response.body;
  }
}
