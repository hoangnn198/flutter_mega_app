import 'dart:convert';

import 'package:flutter_app/config/config.dart';
import 'package:flutter_app/model/buildingRoomModel.dart';
import 'package:http/http.dart' as http;

class getBuildingAPI {
  Future<Building> getBuilding() async {
    var headers = {'Authorization': 'Bearer ${userProfile.token}'};
    var request = http.Request('GET',
        Uri.parse('http://118.69.123.51:5000/fis_dev1/api/edu/get_building'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var result = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      Map<String, dynamic> resultJSON = jsonDecode(result);
      // ignore: avoid_print
      var addJson = Building.fromJson(resultJSON);
      return addJson;
    } else if (response.statusCode == 404) {
      // ignore: avoid_print
      throw Exception("Not Found");
    } else {
      throw Exception("Failed~!");
    }
  }
}
