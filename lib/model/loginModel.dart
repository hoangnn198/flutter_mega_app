// ignore: file_names
class Login {
  int? resultCode;
  String? message;
  Data? data;

  Login({this.resultCode, this.message, this.data});

  Login.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCode'] = resultCode;
    // ignore: unnecessary_this
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  String? userId;
  int? etmsId;
  String? employeeId;
  String? username;
  String? fullName;
  String? email;
  String? avatarUrl;
  int? deviceStatus;
  bool? medicalStatus;
  String? formTitle;
  String? adminRole;
  bool? covidFpt;
  bool? olympic;
  bool? iPaper;
  bool? stayInterview;

  Data(
      {this.token,
      this.userId,
      this.etmsId,
      this.employeeId,
      this.username,
      this.fullName,
      this.email,
      this.avatarUrl,
      this.deviceStatus,
      this.medicalStatus,
      this.formTitle,
      this.adminRole,
      this.covidFpt,
      this.olympic,
      this.iPaper,
      this.stayInterview});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['userId'];
    etmsId = json['etmsId'];
    employeeId = json['employeeId'];
    username = json['username'];
    fullName = json['fullName'];
    email = json['email'];
    avatarUrl = json['avatarUrl'];
    deviceStatus = json['deviceStatus'];
    medicalStatus = json['medicalStatus'];
    formTitle = json['formTitle'];
    adminRole = json['adminRole'];
    covidFpt = json['covid_fpt'];
    olympic = json['olympic'];
    iPaper = json['iPaper'];
    stayInterview = json['stayInterview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['userId'] = userId;
    data['etmsId'] = etmsId;
    data['employeeId'] = employeeId;
    data['username'] = username;
    data['fullName'] = fullName;
    data['email'] = email;
    data['avatarUrl'] = avatarUrl;
    data['deviceStatus'] = deviceStatus;
    data['medicalStatus'] = medicalStatus;
    data['formTitle'] = formTitle;
    data['adminRole'] = adminRole;
    data['covid_fpt'] = covidFpt;
    data['olympic'] = olympic;
    data['iPaper'] = iPaper;
    data['stayInterview'] = stayInterview;
    return data;
  }
}
