import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:police/dartmodel/guestlistmodel.dart';
import 'package:police/pages/listguests.dart';
import '../../const.dart';
import 'package:police/pages/login.dart';

class UpdateGuest extends StatefulWidget {
  UpdateGuest(this.userId, this.guestinfo);

  final String userId;
  final Message guestinfo;

  @override
  State<UpdateGuest> createState() => _UpdateGuestState();
}

class _UpdateGuestState extends State<UpdateGuest> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController fullname =
      TextEditingController(text: widget.guestinfo.fullName);
  late TextEditingController alaisname =
      TextEditingController(text: widget.guestinfo.aliasName);
  late TextEditingController familyname =
      TextEditingController(text: widget.guestinfo.familyName);
  late TextEditingController dateofbirth =
      TextEditingController(text: widget.guestinfo.dateOfBirth);
  late TextEditingController gender =
      TextEditingController(text: widget.guestinfo.gender);
  late TextEditingController nativeaddress =
      TextEditingController(text: widget.guestinfo.nativeAddress);
  late TextEditingController phonenumber =
      TextEditingController(text: widget.guestinfo.phoneNumber);
  late TextEditingController policejurisdiction =
      TextEditingController(text: widget.guestinfo.policeJurisdiction);
  late TextEditingController fathername =
      TextEditingController(text: widget.guestinfo.fatherName);
  // late TextEditingController fathernobnum= TextEditingController(text: widget.guestinfo.);
  // late TextEditingController mothername= TextEditingController(text:widget.guestinfo. );
  // late TextEditingController mothermobnum= TextEditingController(text: );
  // late TextEditingController brothernsister= TextEditingController(text:widget.guestinfo. );
  late TextEditingController currentaddress =
      TextEditingController(text: widget.guestinfo.currentAddress);
  late TextEditingController pincode =
      TextEditingController(text: widget.guestinfo.pincode);
  late TextEditingController policejusaddress =
      TextEditingController(text: widget.guestinfo.policeJurisdiction);
  late TextEditingController ownerphone =
      TextEditingController(text: widget.guestinfo.ownerPhone);
  late TextEditingController aadharnumber =
      TextEditingController(text: widget.guestinfo.aadharNumber);
  late TextEditingController uploadaadharcard =
      TextEditingController(text: widget.guestinfo.uploadAadharCard);
  late TextEditingController alternativeidentity =
      TextEditingController(text: widget.guestinfo.alternativeIdentity);
  late TextEditingController jobrole =
      TextEditingController(text: widget.guestinfo.jobRole);
  late TextEditingController dateofjoining =
      TextEditingController(text: widget.guestinfo.dateOfJoining);
  late TextEditingController employmentperiod =
      TextEditingController(text: widget.guestinfo.employmentPeriod);
  late TextEditingController employmentId =
      TextEditingController(text: widget.guestinfo.employmentID);
  late TextEditingController uploadphoto =
      TextEditingController(text: widget.guestinfo.photo);
  @override
  void initState() {
    super.initState();
    late TextEditingController fullname;
    late TextEditingController alaisname;
    late TextEditingController familyname;
    late TextEditingController dateofbirth;
    late TextEditingController gender;
    late TextEditingController nativeaddress;
    late TextEditingController phonenumber;
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
      print(widget.guestinfo.id);
      if (_formKey.currentState!.validate()) {
        Map<String, dynamic> requestBody = {
          "id": widget.guestinfo.id,
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
        var response = await http.put(
          Uri.parse('${domain}/manage/guest'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': widget.userId
          },
          body: jsonBody,
        );

        if (response.statusCode == 200) {
          showAlertDialog(context, "Successfully",
              "Foreigner details has been updated successfully", "close");
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
        title: Text("Update Guest Employee"),
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
                                  // SizedBox(
                                  //   height: 15,
                                  // ),
                                  // TextFormField(
                                  //   controller: fathernobnum,
                                  //   validator: (value) {
                                  //     return validateNotEmpty(
                                  //         value, "Father's Phone");
                                  //   },
                                  //   decoration: InputDecoration(
                                  //       hintText: "Father's Phone number",
                                  //       border: OutlineInputBorder()),
                                  // ),
                                  // SizedBox(
                                  //   height: 15,
                                  // ),
                                  // TextFormField(
                                  //   controller: mothername,
                                  //   validator: (value) {
                                  //     return validateNotEmpty(
                                  //         value, "Mother's Name");
                                  //   },
                                  //   decoration: InputDecoration(
                                  //       hintText: "Mother's Name",
                                  //       border: OutlineInputBorder()),
                                  // ),
                                  // SizedBox(
                                  //   height: 15,
                                  // ),
                                  // TextFormField(
                                  //   controller: mothermobnum,
                                  //   validator: (value) {
                                  //     return validateNotEmpty(
                                  //         value, "Mother's Phone");
                                  //   },
                                  //   decoration: InputDecoration(
                                  //       hintText: "Mother's Phone Number",
                                  //       border: OutlineInputBorder()),
                                  // ),
                                  // SizedBox(
                                  //   height: 15,
                                  // ),
                                  // TextFormField(
                                  //   controller: brothernsister,
                                  //   validator: (value) {
                                  //     return validateNotEmpty(
                                  //         value, "Brother/Sister Name");
                                  //   },
                                  //   decoration: InputDecoration(
                                  //       hintText: "Brother/Sister Name",
                                  //       border: OutlineInputBorder()),
                                  // ),
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
                                          child: Text("Update Details",
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
