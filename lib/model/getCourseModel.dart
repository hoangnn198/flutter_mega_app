// ignore: file_names
class ListCourse {
  int? resultCode;
  String? message;
  List<Data>? data;

  ListCourse({this.resultCode, this.message, this.data});

  ListCourse.fromJson(Map<String, dynamic> json) {
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
  String? courseId;
  String? courseName;
  String? trainer;
  String? startedDate;
  String? endedDate;
  String? buildingId;
  String? buildingName;
  String? roomId;
  String? roomName;
  String? createdBy;

  Data(
      {this.courseId,
      this.courseName,
      this.trainer,
      this.startedDate,
      this.endedDate,
      this.buildingId,
      this.buildingName,
      this.roomId,
      this.roomName,
      this.createdBy});

  Data.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseName = json['courseName'];
    trainer = json['trainer'];
    startedDate = json['startedDate'];
    endedDate = json['endedDate'];
    buildingId = json['buildingId'];
    buildingName = json['buildingName'];
    roomId = json['roomId'];
    roomName = json['roomName'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_id'] = courseId;
    data['courseName'] = courseName;
    data['trainer'] = trainer;
    data['startedDate'] = startedDate;
    data['endedDate'] = endedDate;
    data['buildingId'] = buildingId;
    data['buildingName'] = buildingName;
    data['roomId'] = roomId;
    data['roomName'] = roomName;
    data['created_by'] = createdBy;
    return data;
  }
}
