// ignore: file_names
class Building {
  int? resultCode;
  String? message;
  List<Data>? data;

  Building({this.resultCode, this.message, this.data});

  Building.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCode'] = resultCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? buildingName;
  String? value;
  String? label;
  List<Room>? room;
  int? iV;

  Data({this.sId, this.buildingName, this.room, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    value = json['_id'];
    buildingName = json['buildingName'];
    label = json['buildingName'];
    if (json['room'] != null) {
      room = <Room>[];
      json['room'].forEach((v) {
        room!.add(Room.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['value'] = sId;
    data['buildingName'] = buildingName;
    data['label'] = buildingName;
    if (room != null) {
      data['room'] = room!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Room {
  String? sId;
  String? roomName;
  String? value;
  String? label;
  String? ipGateway;
  String? ssid;
  String? location;

  Room({this.sId, this.roomName, this.ipGateway, this.ssid, this.location});

  Room.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    value = json['_id'];
    roomName = json['roomName'];
    label = json['roomName'];
    ipGateway = json['ipGateway'];
    ssid = json['ssid'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['value'] = sId;
    data['roomName'] = roomName;
    data['label'] = roomName;
    data['ipGateway'] = ipGateway;
    data['ssid'] = ssid;
    data['location'] = location;
    return data;
  }
}
