class ForeignerList {
  List<Foreigner>? foreigner;

  ForeignerList({this.foreigner});

  ForeignerList.fromJson(Map<String, dynamic> json) {
    if (json['foreigner'] != null) {
      foreigner = <Foreigner>[];
      json['foreigner'].forEach((v) {
        foreigner!.add(new Foreigner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foreigner != null) {
      data['foreigner'] = this.foreigner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Foreigner {
  String? fullName;
  String? phoneNumber;
  String? homeCountry;
  String? pov;
  String? hospitalName;
  String? doctorName;
  String? hospitalLocation;
  String? passport;
  String? visa;
  String? collegeuniName;
  String? collegeLocation;
  String? uploadcollegeId;
  String? placeofStay;
  String? id;
  String? typeofBusniess;
  String? timePeriod;

  Foreigner(
      {this.fullName,
      this.phoneNumber,
      this.homeCountry,
      this.pov,
      this.hospitalName,
      this.doctorName,
      this.hospitalLocation,
      this.passport,
      this.visa,
      this.collegeuniName,
      this.collegeLocation,
      this.uploadcollegeId,
      this.placeofStay,
      this.id,
      this.typeofBusniess,
      this.timePeriod});

  Foreigner.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    homeCountry = json['homeCountry'];
    pov = json['pov'];
    hospitalName = json['hospitalName'];
    doctorName = json['doctorName'];
    hospitalLocation = json['hospitalLocation'];
    passport = json['passport'];
    visa = json['visa'];
    collegeuniName = json['collegeuniName'];
    collegeLocation = json['collegeLocation'];
    uploadcollegeId = json['uploadcollegeId'];
    placeofStay = json['placeofStay'];
    id = json['id'];
    typeofBusniess = json['typeofBusniess'];
    timePeriod = json['timePeriod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['homeCountry'] = this.homeCountry;
    data['pov'] = this.pov;
    data['hospitalName'] = this.hospitalName;
    data['doctorName'] = this.doctorName;
    data['hospitalLocation'] = this.hospitalLocation;
    data['passport'] = this.passport;
    data['visa'] = this.visa;
    data['collegeuniName'] = this.collegeuniName;
    data['collegeLocation'] = this.collegeLocation;
    data['uploadcollegeId'] = this.uploadcollegeId;
    data['placeofStay'] = this.placeofStay;
    data['id'] = this.id;
    data['typeofBusniess'] = this.typeofBusniess;
    data['timePeriod'] = this.timePeriod;
    return data;
  }
}
