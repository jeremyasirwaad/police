import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/const.dart';
import 'package:police/dartmodel/tenetmodel.dart';
import 'package:police/pages/login.dart';

class UpdateTenet extends StatefulWidget {
  UpdateTenet(this.userId, this.tenetinfo);

  final String userId;
  final Tenet tenetinfo;

  @override
  State<UpdateTenet> createState() => _UpdateTenetState();
}

class _UpdateTenetState extends State<UpdateTenet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController fullname;
  late TextEditingController alaisname;
  late TextEditingController dateofbirth;
  late TextEditingController gender;
  late TextEditingController nativeaddress;
  late TextEditingController phonenumber;
  late TextEditingController hospitalname;

  late TextEditingController tfullname;
  late TextEditingController talaisname;
  late TextEditingController tdateofbirth;
  late TextEditingController tgender;
  late TextEditingController tnativeaddress;
  late TextEditingController tphonenumber;
  late TextEditingController thospitalname;
  late TextEditingController tcurrentaddress;
  late TextEditingController tpurposeofstay;
  late TextEditingController taadharnumber;
  late TextEditingController tuploadaadharcard;
  late TextEditingController talternativeidentity;

  late TextEditingController policejurisdiction;
  late TextEditingController fathername;
  late TextEditingController fathernobnum;
  late TextEditingController mothername;
  late TextEditingController mothermobnum;
  late TextEditingController brothernsister;
  late TextEditingController currentaddress;
  late TextEditingController pincode;
  late TextEditingController policejusaddress;
  late TextEditingController ownerphone;
  late TextEditingController aadharnumber;
  late TextEditingController uploadaadharcard;
  late TextEditingController alternativeidentity;
  late TextEditingController jobrole;
  late TextEditingController dateofjoining;
  late TextEditingController employmentperiod;
  late TextEditingController employmentId;
  late TextEditingController uploadphoto;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullname = TextEditingController(text: widget.tenetinfo.fullName);
    alaisname = TextEditingController(text: widget.tenetinfo.aliasName);
    dateofbirth = TextEditingController(text: widget.tenetinfo.dateOfBirth);
    gender = TextEditingController(text: widget.tenetinfo.gender);
    nativeaddress = TextEditingController(text: widget.tenetinfo.nativeAddress);
    phonenumber = TextEditingController(text: widget.tenetinfo.phoneNumber);
    hospitalname = TextEditingController();

    tfullname = TextEditingController(text: widget.tenetinfo.tfullName);
    talaisname = TextEditingController(text: widget.tenetinfo.taliasName);
    tdateofbirth = TextEditingController(text: widget.tenetinfo.tdateOfBirth);
    tgender = TextEditingController(text: widget.tenetinfo.tgender);
    tnativeaddress =
        TextEditingController(text: widget.tenetinfo.tnativeAddress);
    tphonenumber = TextEditingController();
    thospitalname = TextEditingController();
    tcurrentaddress =
        TextEditingController(text: widget.tenetinfo.tcurrentAddress);
    tpurposeofstay =
        TextEditingController(text: widget.tenetinfo.tpurposeofStay);
    taadharnumber = TextEditingController(text: widget.tenetinfo.taadharNumber);
    tuploadaadharcard =
        TextEditingController(text: widget.tenetinfo.tuploadAadharCard);
    talternativeidentity =
        TextEditingController(text: widget.tenetinfo.talternativeIdentity);

    // policejurisdiction = TextEditingController(text: widget.tenetinfo.);
    // fathername = TextEditingController(text: widget.tenetinfo);
    // fathernobnum = TextEditingController(text: widget.tenetinfo);
    // mothername = TextEditingController(text: widget.tenetinfo);
    // mothermobnum = TextEditingController(text: widget.tenetinfo);
    // brothernsister = TextEditingController(text: widget.tenetinfo);
    currentaddress =
        TextEditingController(text: widget.tenetinfo.currentAddress);
    pincode = TextEditingController(text: widget.tenetinfo.pincode);
    // policejusaddress = TextEditingController(text: widget.tenetinfo);
    // ownerphone = TextEditingController(text: widget.tenetinfo);
    aadharnumber = TextEditingController(text: widget.tenetinfo.aadharNumber);
    uploadaadharcard =
        TextEditingController(text: widget.tenetinfo.uploadAadharCard);
    alternativeidentity =
        TextEditingController(text: widget.tenetinfo.alternativeIdentity);
    // jobrole = TextEditingController(text: widget.tenetinfo);
    // dateofjoining = TextEditingController(text: widget.tenetinfo);
    // employmentperiod = TextEditingController(text: widget.tenetinfo);
    // employmentId = TextEditingController(text: widget.tenetinfo);
    // uploadphoto = TextEditingController(text: widget.tenetinfo.);
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String? validateNotEmpty(String? value, String label) {
      if (value == null || value.isEmpty) {
        return '${label} cannot be empty';
      }
      return null;
    }

    void registerdata() async {
      if (_formKey.currentState!.validate()) {
        Map<String, dynamic> requestBody = {
          "id": widget.tenetinfo.id,
          "fullName": fullname.text,
          "aliasName": alaisname.text,
          "dateOfBirth": dateofbirth.text,
          "gender": gender.text,
          "nativeAddress": nativeaddress.text,
          "currentAddress": currentaddress.text,
          "pincode": pincode.text,
          "phoneNumber": phonenumber.text,
          "aadharNumber": aadharnumber.text,
          "uploadAadharCard": uploadaadharcard.text,
          "alternativeIdentity": alternativeidentity.text,
          "tfullName": tfullname.text,
          "taliasName": talaisname.text,
          "tdateOfBirth": tdateofbirth.text,
          "tgender": tgender.text,
          "tnativeAddress": tnativeaddress.text,
          "tcurrentAddress": tcurrentaddress.text,
          "tpurposeofStay": tpurposeofstay.text,
          "taadharNumber": taadharnumber.text,
          "tuploadAadharCard": tuploadaadharcard.text,
          "talternativeIdentity": talternativeidentity.text
        };

        // Convert the body to JSON
        String jsonBody = json.encode(requestBody);

        // Send the POST request
        var response = await http.put(
          Uri.parse('${domain}/manage/tenet'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': widget.userId
          },
          body: jsonBody,
        );

        if (response.statusCode == 200) {
          showAlertDialog(context, "Successfully",
              "Tenet details has been updated successfully", "close");
        } else {
          print(response.body);
          showAlertDialog(
              context, "Failed to Register", "Server Error", "close");
        }
      } else {
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Tenet Information "),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              // height: double.infinity,
              width: double.infinity,
            ),
            Container(
              height: height * 0.28,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
                color: Colors.blue.shade900,
              ),
            ),
            Container(
                // height: double.infinity,
                width: double.infinity,
                child: Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 40),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    "Property Owner Information",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: fullname,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Full Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Full Name",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: alaisname,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Atlas Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Atlas Name",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: dateofbirth,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Date of birth");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Date of birth",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: gender,
                                    validator: (value) {
                                      return validateNotEmpty(value, "Gender");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Gender",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: nativeaddress,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Native Address");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Native Address",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: currentaddress,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Current Address");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Current Address",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: aadharnumber,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Aadhaar Number");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Aadhaar Number",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: uploadaadharcard,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Upload Aadhaar Card");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Upload Aadhaar Card",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: alternativeidentity,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Alternative Identity");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Alternative Identity",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Add Tenet Info",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: tfullname,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Full Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Full Name",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: talaisname,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Atlas Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Atlas Name",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: tdateofbirth,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Date of birth");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Date of birth",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: tgender,
                                    validator: (value) {
                                      return validateNotEmpty(value, "Gender");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Gender",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: tnativeaddress,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Native Address");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Native Address",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: tcurrentaddress,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Current Address");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Current Address",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: tpurposeofstay,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Purpose of Stay");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Purpose of Stay",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: taadharnumber,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Aadhar Number");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Aadhar Number",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: tuploadaadharcard,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Upload Aadhar Card");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Upload Aadhar Card",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: talternativeidentity,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Alternative Identity");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Alternative Identity",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      registerdata();
                                    },
                                    child: Container(
                                      width: 170,
                                      height: 40,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.blue.shade900,
                                      ),
                                      child: Center(
                                          child: Text("Update Details",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    ),
                                  )
                                ])),
                      ),
                      elevation: 10,
                    ))),
          ],
        ),
      ),
    );
  }
}
