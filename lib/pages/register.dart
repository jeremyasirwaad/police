import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/const.dart';
import 'package:police/pages/login.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController companyname = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController companylocation = TextEditingController();
  TextEditingController policejjurisdiction = TextEditingController();
  TextEditingController companyphone = TextEditingController();
  TextEditingController companyemail = TextEditingController();
  TextEditingController gstnpan = TextEditingController();
  TextEditingController companytype = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  String? validateNotEmpty(String? value, String label) {
    if (value == null || value.isEmpty) {
      return '${label} cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool validatePassword(String password) {
      // Check if the password contains an uppercase letter
      bool hasUppercase = password.contains(RegExp(r'[A-Z]'));

      // Check if the password contains a lowercase letter
      bool hasLowercase = password.contains(RegExp(r'[a-z]'));

      // Check if the password contains a digit
      bool hasNumber = password.contains(RegExp(r'[0-9]'));

      // Check if the password contains a special character
      bool hasSpecialChar =
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      // Check if the password has a minimum length of 8 characters
      bool hasMinimumLength = password.length >= 8;

      // Return true if all conditions are met, otherwise false
      if (hasUppercase &&
          hasLowercase &&
          hasNumber &&
          hasSpecialChar &&
          hasMinimumLength) {
        return true;
      } else {
        showAlertDialog(
            context,
            "Password is Weak",
            "1 Uppercase, 1 Lower Case, 1 Special Character, 8 Characters ",
            "close");
        return false;
      }
    }

    bool passwordmatch() {
      if (confirmpassword.text == password.text) {
        return true;
      } else {
        showAlertDialog(context, "Passwords Doesnt Match",
            "Check Password and try again", "close");
        return false;
      }
    }

    void registerdata() async {
      if (_formKey.currentState!.validate() &&
          validatePassword(password.text) &&
          passwordmatch()) {
        Map<String, dynamic> requestBody = {
          "companyName": companyname.text,
          "ownerName": ownername.text,
          "companyLocation": companylocation.text,
          "policeJurisdiction": policejjurisdiction.text,
          "companyPhone": companyphone.text,
          "companyEmail": companyemail.text,
          "GSTnPAN": gstnpan.text,
          "companyType": companytype.text,
          "password": password.text,
        };

        // Convert the body to JSON
        String jsonBody = json.encode(requestBody);

        // Send the POST request
        var response = await http.post(
          Uri.parse('${domain}/api/users'),
          headers: {'Content-Type': 'application/json'},
          body: jsonBody,
        );

        if (response.statusCode == 201) {
          showAlertDialog(context, "Registered Successfully",
              "Registeration Successful click login to login!", "Login");
        } else {
          print(response.body);
          showAlertDialog(
              context,
              "Check Input",
              "The Email is already registered, kindly try loggin in!",
              "Login");
        }
      } else {
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Employer Registration"),
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
                    EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 40),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 20),
                          TextFormField(
                            controller: companyname,
                            decoration: InputDecoration(
                              hintText: "Company Name",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(value, "Company Name");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: ownername,
                            decoration: InputDecoration(
                              hintText: "Name of the Owner",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(
                                  value, "Name of the Owner");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: companylocation,
                            decoration: InputDecoration(
                              hintText: "Company Location",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(
                                  value, "Company Location");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: policejjurisdiction,
                            decoration: InputDecoration(
                              hintText: "Police Jurisdiction",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(
                                  value, "Police Jurisdiction");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: companyphone,
                            decoration: InputDecoration(
                              hintText: "Company Phone Number",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(
                                  value, "Company Phone Number");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: companyemail,
                            decoration: InputDecoration(
                              hintText: "Company Email",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(value, "Company Email");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: gstnpan,
                            decoration: InputDecoration(
                              hintText: "GST/PAN Number",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(value, "GST/PAN Number");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: companytype,
                            decoration: InputDecoration(
                              hintText: "Company Type",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(value, "Company Type");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(value, "Password");
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: confirmpassword,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return validateNotEmpty(
                                  value, "Confirm Password");
                            },
                          ),
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
                                  "Create Account",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
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

showAlertDialog(
    BuildContext context, String Title, String Body, String button) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(button),
    onPressed: () {
      if (button != "close") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => login()));
      } else {
        Navigator.of(context).pop();
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(Title),
    content: Text(Body),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
