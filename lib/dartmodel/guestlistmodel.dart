class GuestList {
  List<Message>? message;

  GuestList({this.message});

  GuestList.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? id;
  String? fullName;
  String? aliasName;
  String? familyName;
  String? dateOfBirth;
  String? gender;
  String? nativeAddress;
  String? currentAddress;
  String? pincode;
  String? phoneNumber;
  String? policeJurisdiction;
  String? policeJurisdictionOfAddress;
  String? fatherName;
  String? ownerPhone;
  String? aadharNumber;
  String? uploadAadharCard;
  String? alternativeIdentity;
  String? jobRole;
  String? dateOfJoining;
  String? employmentPeriod;
  String? employmentID;
  String? photo;

  Message(
      {this.id,
      this.fullName,
      this.aliasName,
      this.familyName,
      this.dateOfBirth,
      this.gender,
      this.nativeAddress,
      this.currentAddress,
      this.pincode,
      this.phoneNumber,
      this.policeJurisdiction,
      this.policeJurisdictionOfAddress,
      this.fatherName,
      this.ownerPhone,
      this.aadharNumber,
      this.uploadAadharCard,
      this.alternativeIdentity,
      this.jobRole,
      this.dateOfJoining,
      this.employmentPeriod,
      this.employmentID,
      this.photo});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    aliasName = json['aliasName'];
    familyName = json['familyName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    nativeAddress = json['nativeAddress'];
    currentAddress = json['currentAddress'];
    pincode = json['pincode'];
    phoneNumber = json['phoneNumber'];
    policeJurisdiction = json['policeJurisdiction'];
    policeJurisdictionOfAddress = json['policeJurisdictionOfAddress'];
    fatherName = json['fatherName'];
    ownerPhone = json['ownerPhone'];
    aadharNumber = json['aadharNumber'];
    uploadAadharCard = json['uploadAadharCard'];
    alternativeIdentity = json['alternativeIdentity'];
    jobRole = json['jobRole'];
    dateOfJoining = json['dateOfJoining'];
    employmentPeriod = json['employmentPeriod'];
    employmentID = json['employmentID'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['aliasName'] = this.aliasName;
    data['familyName'] = this.familyName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['nativeAddress'] = this.nativeAddress;
    data['currentAddress'] = this.currentAddress;
    data['pincode'] = this.pincode;
    data['phoneNumber'] = this.phoneNumber;
    data['policeJurisdiction'] = this.policeJurisdiction;
    data['policeJurisdictionOfAddress'] = this.policeJurisdictionOfAddress;
    data['fatherName'] = this.fatherName;
    data['ownerPhone'] = this.ownerPhone;
    data['aadharNumber'] = this.aadharNumber;
    data['uploadAadharCard'] = this.uploadAadharCard;
    data['alternativeIdentity'] = this.alternativeIdentity;
    data['jobRole'] = this.jobRole;
    data['dateOfJoining'] = this.dateOfJoining;
    data['employmentPeriod'] = this.employmentPeriod;
    data['employmentID'] = this.employmentID;
    data['photo'] = this.photo;
    return data;
  }
}
