import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:police/pages/login.dart';

class addguestemployee extends StatefulWidget {
  addguestemployee(this.userId);

  final String userId;

  @override
  State<addguestemployee> createState() => _addguestemployeeState();
}

class _addguestemployeeState extends State<addguestemployee> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController alaisname = TextEditingController();
  TextEditingController familyname = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController nativeaddress = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
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
          "familyName": familyname.text,
          "dateOfBirth": dateofbirth.text,
          "gender": gender.text,
          "nativeAddress": nativeaddress.text,
          "currentAddress": currentaddress.text,
          "pincode": pincode.text,
          "phoneNumber": phonenumber.text,
          "policeJurisdiction": policejurisdiction.text,
          "policeJurisdictionOfAddress": policejurisdiction.text,
          "fatherName": fathername.text,
          "ownerPhone": ownerphone.text,
          "aadharNumber": aadharnumber.text,
          "uploadAadharCard": uploadaadharcard.text,
          "alternativeIdentity": alternativeidentity.text,
          "jobRole": jobrole.text,
          "dateOfJoining": dateofjoining.text,
          "employmentPeriod": employmentperiod.text,
          "employmentID": employmentId.text,
          "photo": uploadphoto.text
        };

        // Convert the body to JSON
        String jsonBody = json.encode(requestBody);

        // Send the POST request
        var response = await http.post(
          Uri.parse('http://10.0.2.2:8080/manage/guest'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': widget.userId
          },
          body: jsonBody,
        );

        if (response.statusCode == 201) {
          showAlertDialog(context, "Successfully",
              "Guest has been added successfully", "close");

          fullname.clear();
          alaisname.clear();
          familyname.clear();
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
        title: Text("Add Guest Employee"),
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
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    "Personal Information",
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
                                          value, "Alais Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Alais Name",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: familyname,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Family Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Family Name",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: dateofbirth,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Date of Birth");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Date of Birth",
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
                                    controller: policejurisdiction,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Police Jurisdiction");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Police Jurisdiction",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: fathername,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Father's Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Father's Name",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: fathernobnum,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Father's Phone");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Father's Phone number",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: mothername,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Mother's Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Mother's Name",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: mothermobnum,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Mother's Phone");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Mother's Phone Number",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: brothernsister,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Brother/Sister Name");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Brother/Sister Name",
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
                                    controller: pincode,
                                    validator: (value) {
                                      return validateNotEmpty(value, "Pincode");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Pin Code",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: policejusaddress,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Police Jurisdiction");
                                    },
                                    decoration: InputDecoration(
                                        hintText:
                                            "Police Jurisdiction of Address",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: ownerphone,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Owner Phone Number");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Owner Phone Num",
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
                                    controller: alternativeidentity,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Alternative Identity");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Alternative Identity",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Job Details",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: jobrole,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Job Role");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Job Role",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: dateofjoining,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Date of Joining");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Date of Joining",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: employmentperiod,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Employment period");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Employment period",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: employmentId,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Upload Employment ID");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Upload Employment ID",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: uploadphoto,
                                    validator: (value) {
                                      return validateNotEmpty(
                                          value, "Upload Photo");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Upload Photo",
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
                                ]),
                          )),
                      elevation: 10,
                    ))),
          ],
        ),
      ),
    );
  }
}

// showAlertDialog(
//     BuildContext context, String Title, String Body, String button) {
//   // set up the button
//   Widget okButton = TextButton(
//     child: Text(button),
//     onPressed: () {
//       if (button != "close") {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => login()));
//       } else {
//         Navigator.of(context).pop();
//       }
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(Title),
//     content: Text(Body),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
