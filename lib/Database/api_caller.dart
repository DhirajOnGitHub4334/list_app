import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiCaller {
  static Future<Map<String, dynamic>> post(Map body) async {
    String url = "https://api.hive.blog/";

    var encodedBody = jsonEncode(body);
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: encodedBody,
    );

    log("Url : $url Body Data : $body");

    //log("Getting Response Code : ${response.statusCode} Response Body : ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = jsonDecode(response.body);
      return res;
    } else {
      var res = jsonDecode(response.body);
      return res;
    }
  }
}
