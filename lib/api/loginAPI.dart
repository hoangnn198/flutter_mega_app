// ignore: file_names
import 'dart:convert';
import 'package:flutter_app/config/config.dart';
import 'package:flutter_app/model/getCourseModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/loginModel.dart';

class LoginAPI {
  Future<Login> login(String username, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://118.69.123.51:5000/fis_dev/api//login'));
    request.body = jsonEncode(<String, String>{
      "username": username,
      "password": password,
    });
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
      throw Exception("Not Found");
    } else {
      throw Exception("Failed~!");
    }
  }
}

class GetCourseAPI {
  Future<ListCourse> getCourse() async {
    var headers = {'Authorization': 'Bearer ${userProfile.token}'};
    var request = http.Request('GET',
        Uri.parse('http://118.69.123.51:5000/fis_dev1/api/edu/get_all_course'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var result = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      Map<String, dynamic> resultJSON = jsonDecode(result);
      // ignore: avoid_print
      var addJson = ListCourse.fromJson(resultJSON);

      return addJson;
    } else if (response.statusCode == 404) {
      // ignore: avoid_print
      throw Exception("Not Found");
    } else {
      throw Exception("Failed~!");
    }
  }
}
