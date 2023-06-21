import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/pages/login.dart';

class addtenetinfo extends StatefulWidget {
  addtenetinfo(this.userId);

  final String userId;

  @override
  State<addtenetinfo> createState() => _addtenetinfoState();
}

class _addtenetinfoState extends State<addtenetinfo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController alaisname = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController nativeaddress = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController hospitalname = TextEditingController();

  TextEditingController tfullname = TextEditingController();
  TextEditingController talaisname = TextEditingController();
  TextEditingController tdateofbirth = TextEditingController();
  TextEditingController tgender = TextEditingController();
  TextEditingController tnativeaddress = TextEditingController();
  TextEditingController tphonenumber = TextEditingController();
  TextEditingController thospitalname = TextEditingController();
  TextEditingController tcurrentaddress = TextEditingController();
  TextEditingController tpurposeofstay = TextEditingController();
  TextEditingController taadharnumber = TextEditingController();
  TextEditingController tuploadaadharcard = TextEditingController();
  TextEditingController talternativeidentity = TextEditingController();

  TextEditingController policejurisdiction = TextEditingController();
  TextEditingController fathername = TextEditingController();
  TextEditingController fathernobnum = TextEditingController();
  TextEditingController mothername = TextEditingController();
  TextEditingController mothermobnum = TextEditingController();
  TextEditingController brothernsister = TextEditingController();
  TextEditingController currentaddress = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController policejusaddress = TextEditingController();
  TextEditingController ownerphone = TextEditingController();
  TextEditingController aadharnumber = TextEditingController();
  TextEditingController uploadaadharcard = TextEditingController();
  TextEditingController alternativeidentity = TextEditingController();
  TextEditingController jobrole = TextEditingController();
  TextEditingController dateofjoining = TextEditingController();
  TextEditingController employmentperiod = TextEditingController();
  TextEditingController employmentId = TextEditingController();
  TextEditingController uploadphoto = TextEditingController();

  @override
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
        var response = await http.post(
          Uri.parse('http://10.0.2.2:8080/manage/tenet'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': widget.userId
          },
          body: jsonBody,
        );

        if (response.statusCode == 201) {
          showAlertDialog(context, "Successfully",
              "Tenet Info has been added successfully", "close");

          fullname.clear();
          alaisname.clear();
          dateofbirth.clear();
          gender.clear();
          nativeaddress.clear();
          phonenumber.clear();
          policejurisdiction.clear();
          fathername.clear();
          fathernobnum.clear();
          mothername.clear();
          mothermobnum.clear();
          brothernsister.clear();
          currentaddress.clear();
          pincode.clear();
          policejusaddress.clear();
          ownerphone.clear();
          aadharnumber.clear();
          uploadaadharcard.clear();
          alternativeidentity.clear();
          jobrole.clear();
          dateofjoining.clear();
          employmentperiod.clear();
          employmentId.clear();
          uploadphoto.clear();
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
        title: Text("Add Tenet Information "),
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
                                    controller: phonenumber,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Phone Number");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Phone Number",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: hospitalname,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Hospital Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Hospital Name",
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
                                    controller: tphonenumber,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Phone Number");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Phone Number",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: thospitalname,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Hospital Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Hospital Name",
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
                                          child: Text("Register Details",
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
