import 'dart:collection';
import 'dart:convert';
// ignore: depend_on_referenced_packages, unused_import
// import 'package:flutter_app/model/loginModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/loginModel.dart';

class LoginAPI {
  static const url = '';
  // static List<Login> parseJson(String responseJson) {
  //   Map<String, dynamic> resultJSON = jsonDecode(responseJson);
  //   var json = Data.fromJson(resultJSON);
  //   print(json.token);
  //   return [];
  // }

  Future<Login> login(String username, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://118.69.123.51:5000/fis_dev/api//login'));
    request.body = jsonEncode(<String, String>{
      "username": username,
      "password": password,
      "buildNumber": "10820",
      "osVersion": "10"
    });
    // '''{\r\n    "username": "hoangnn22",\r\n    "password": "456456QWE!@#",\r\n    "buildNumber": "10820",\r\n    "osVersion": "10"\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var result = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      Map<String, dynamic> resultJSON = jsonDecode(result);
      // ignore: avoid_print
      var addJson = Login.fromJson(resultJSON);
      return addJson;
    } else if (response.statusCode == 404) {
      // ignore: avoid_print
      // print(response.reasonPhrase);
      throw Exception("Not Found");
    } else {
      throw Exception("Failed~!");
    }
  }
}
