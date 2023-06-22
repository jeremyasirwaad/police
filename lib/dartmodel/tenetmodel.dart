class tenetmodel {
  List<Tenet>? tenet;

  tenetmodel({this.tenet});

  tenetmodel.fromJson(Map<String, dynamic> json) {
    if (json['tenet'] != null) {
      tenet = <Tenet>[];
      json['tenet'].forEach((v) {
        tenet!.add(new Tenet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tenet != null) {
      data['tenet'] = this.tenet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tenet {
  String? fullName;
  String? aliasName;
  String? dateOfBirth;
  String? gender;
  String? nativeAddress;
  String? currentAddress;
  String? pincode;
  String? phoneNumber;
  String? aadharNumber;
  String? uploadAadharCard;
  String? alternativeIdentity;
  String? tfullName;
  String? taliasName;
  String? tdateOfBirth;
  String? tgender;
  String? tnativeAddress;
  String? tcurrentAddress;
  String? tpurposeofStay;
  String? taadharNumber;
  String? tuploadAadharCard;
  String? talternativeIdentity;

  Tenet(
      {this.fullName,
      this.aliasName,
      this.dateOfBirth,
      this.gender,
      this.nativeAddress,
      this.currentAddress,
      this.pincode,
      this.phoneNumber,
      this.aadharNumber,
      this.uploadAadharCard,
      this.alternativeIdentity,
      this.tfullName,
      this.taliasName,
      this.tdateOfBirth,
      this.tgender,
      this.tnativeAddress,
      this.tcurrentAddress,
      this.tpurposeofStay,
      this.taadharNumber,
      this.tuploadAadharCard,
      this.talternativeIdentity});

  Tenet.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    aliasName = json['aliasName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    nativeAddress = json['nativeAddress'];
    currentAddress = json['currentAddress'];
    pincode = json['pincode'];
    phoneNumber = json['phoneNumber'];
    aadharNumber = json['aadharNumber'];
    uploadAadharCard = json['uploadAadharCard'];
    alternativeIdentity = json['alternativeIdentity'];
    tfullName = json['tfullName'];
    taliasName = json['taliasName'];
    tdateOfBirth = json['tdateOfBirth'];
    tgender = json['tgender'];
    tnativeAddress = json['tnativeAddress'];
    tcurrentAddress = json['tcurrentAddress'];
    tpurposeofStay = json['tpurposeofStay'];
    taadharNumber = json['taadharNumber'];
    tuploadAadharCard = json['tuploadAadharCard'];
    talternativeIdentity = json['talternativeIdentity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['aliasName'] = this.aliasName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['nativeAddress'] = this.nativeAddress;
    data['currentAddress'] = this.currentAddress;
    data['pincode'] = this.pincode;
    data['phoneNumber'] = this.phoneNumber;
    data['aadharNumber'] = this.aadharNumber;
    data['uploadAadharCard'] = this.uploadAadharCard;
    data['alternativeIdentity'] = this.alternativeIdentity;
    data['tfullName'] = this.tfullName;
    data['taliasName'] = this.taliasName;
    data['tdateOfBirth'] = this.tdateOfBirth;
    data['tgender'] = this.tgender;
    data['tnativeAddress'] = this.tnativeAddress;
    data['tcurrentAddress'] = this.tcurrentAddress;
    data['tpurposeofStay'] = this.tpurposeofStay;
    data['taadharNumber'] = this.taadharNumber;
    data['tuploadAadharCard'] = this.tuploadAadharCard;
    data['talternativeIdentity'] = this.talternativeIdentity;
    return data;
  }
}
