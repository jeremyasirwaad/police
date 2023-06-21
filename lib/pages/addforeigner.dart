import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/pages/register.dart';
import '../const.dart';

class AddForeigner extends StatefulWidget {
  AddForeigner(this.userId);

  final String userId;

  @override
  State<AddForeigner> createState() => _AddForeignerState();
}

class _AddForeignerState extends State<AddForeigner> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController homecountry = TextEditingController();
  var dropdownValue = null;
  TextEditingController hospitalname = TextEditingController();
  TextEditingController doctorname = TextEditingController();
  TextEditingController hospitallocation = TextEditingController();
  TextEditingController uploadpassport = TextEditingController();
  TextEditingController uploadvisa = TextEditingController();
  TextEditingController typeofbusniess = TextEditingController();
  TextEditingController timeperiod = TextEditingController();
  TextEditingController collegenuni = TextEditingController();
  TextEditingController collegelocation = TextEditingController();
  TextEditingController uploadcollegeid = TextEditingController();
  TextEditingController placeofstay = TextEditingController();

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
        if (dropdownValue == null) {
          showAlertDialog(context, "Choose Purpose",
              "Kidnly Choose the purpose of visit from the dropdown", "close");
          return;
        }

        Map<String, dynamic> requestBody = {
          "fullName": fullname.text,
          "phoneNumber": phonenumber.text,
          "homeCountry": homecountry.text,
          "pov": dropdownValue,
          "hospitalName": hospitalname.text,
          "doctorName": doctorname.text,
          "hospitalLocation": hospitallocation.text,
          "passport": uploadpassport.text,
          "visa": uploadvisa.text,
          "typeofBusniess": typeofbusniess.text,
          "timePeriod": timeperiod.text,
          "collegeuniName": collegenuni.text,
          "collegeLocation": collegelocation.text,
          "uploadcollegeId": uploadcollegeid.text,
          "placeofStay": placeofstay.text,
        };

        // Convert the body to JSON
        String jsonBody = json.encode(requestBody);

        // Send the POST request
        var response = await http.post(
          Uri.parse('${domain}/manage/foreigner'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': widget.userId
          },
          body: jsonBody,
        );

        if (response.statusCode == 201) {
          showAlertDialog(context, "Successfully",
              "Foreigner details has been added successfully", "close");

          fullname.clear();
          phonenumber.clear();
          homecountry.clear();
          hospitalname.clear();
          doctorname.clear();
          hospitallocation.clear();
          uploadpassport.clear();
          uploadvisa.clear();
          typeofbusniess.clear();
          timeperiod.clear();
          collegenuni.clear();
          collegelocation.clear();
          uploadcollegeid.clear();
          placeofstay.clear();
          setState(() {
            dropdownValue = null;
          });
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
        title: Text("Add Foreigner"),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
            ),
            Container(
              height: height * 0.28,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                color: Colors.blue.shade900,
              ),
            ),
            Container(
              width: double.infinity,
              child: Container(
                margin:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 40),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Enter Foreigner Information",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (value) {
                              return validateNotEmpty(value, "Full Name");
                            },
                            controller: fullname,
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              return validateNotEmpty(value, "Phone Numbe");
                            },
                            controller: phonenumber,
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              return validateNotEmpty(value, "Home Country");
                            },
                            controller: homecountry,
                            decoration: InputDecoration(
                              hintText: "Home Country",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              // color: Colors.lightGreen,
                              border: Border.all(
                                color: Color.fromARGB(95, 110, 110, 110),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              // boxShadow: <BoxShadow>[
                              //   BoxShadow(
                              //     color: Color.fromRGBO(0, 0, 0, 0.57),
                              //     blurRadius: 5,
                              //   ),
                              // ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: DropdownButton(
                                hint: Text("Purpose of Visit"),
                                value: dropdownValue,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Medical"),
                                    value: "Medical",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Commercial"),
                                    value: "Commercial",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Education"),
                                    value: "Education",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Tourist"),
                                    value: "Tourist",
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValue = value.toString();
                                  });
                                  print("You have selected $dropdownValue");
                                },
                                icon: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(Icons.keyboard_arrow_down_sharp),
                                ),
                                iconEnabledColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                dropdownColor: Colors.white,
                                underline: Container(),
                                isExpanded: true,
                              ),
                            ),
                          ),
                          dropdownValue == "Medical"
                              ? Column(
                                  children: [
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Hospital Name");
                                      },
                                      controller: hospitalname,
                                      decoration: InputDecoration(
                                        hintText: "Hospital Name",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Doctor Name");
                                      },
                                      controller: doctorname,
                                      decoration: InputDecoration(
                                        hintText: "Doctor Name",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Hospital Location");
                                      },
                                      controller: hospitallocation,
                                      decoration: InputDecoration(
                                        hintText: "Hospital Location",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload Passport");
                                      },
                                      controller: uploadpassport,
                                      decoration: InputDecoration(
                                        hintText: "Upload Passport",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload Visa");
                                      },
                                      controller: uploadvisa,
                                      decoration: InputDecoration(
                                        hintText: "Upload Visa",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                )
                              : Container(),
                          dropdownValue == "Education"
                              ? Column(
                                  children: [
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "College/University Name");
                                      },
                                      controller: collegenuni,
                                      decoration: InputDecoration(
                                        hintText: "College/University Name",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "College Location");
                                      },
                                      controller: collegelocation,
                                      decoration: InputDecoration(
                                        hintText: "College Location",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload College ID");
                                      },
                                      controller: uploadcollegeid,
                                      decoration: InputDecoration(
                                        hintText: "Upload College ID",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload Passport");
                                      },
                                      controller: uploadpassport,
                                      decoration: InputDecoration(
                                        hintText: "Upload Passport",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload Visa");
                                      },
                                      controller: uploadvisa,
                                      decoration: InputDecoration(
                                        hintText: "Upload Visa",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                )
                              : Container(),
                          dropdownValue == "Commercial"
                              ? Column(
                                  children: [
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Type of Business");
                                      },
                                      controller: typeofbusniess,
                                      decoration: InputDecoration(
                                        hintText: "Type of Business",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Time Period");
                                      },
                                      controller: timeperiod,
                                      decoration: InputDecoration(
                                        hintText: "Time Period",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload Passport");
                                      },
                                      controller: uploadpassport,
                                      decoration: InputDecoration(
                                        hintText: "Upload Passport",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload Visa");
                                      },
                                      controller: uploadvisa,
                                      decoration: InputDecoration(
                                        hintText: "Upload Visa",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                )
                              : Container(),
                          dropdownValue == "Tourist"
                              ? Column(
                                  children: [
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Place of Stay");
                                      },
                                      controller: placeofstay,
                                      decoration: InputDecoration(
                                        hintText: "Place of Stay",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload Passport");
                                      },
                                      controller: uploadpassport,
                                      decoration: InputDecoration(
                                        hintText: "Upload Passport",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        return validateNotEmpty(
                                            value, "Upload Visa");
                                      },
                                      controller: uploadvisa,
                                      decoration: InputDecoration(
                                        hintText: "Upload Visa",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              registerdata();
                            },
                            child: Container(
                              width: 170,
                              height: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue.shade900,
                              ),
                              child: Center(
                                child: Text(
                                  "Register Details",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  elevation: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
