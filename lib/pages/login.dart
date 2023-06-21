import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/dartmodel/loginresponse.dart';
import 'package:police/pages/options.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  void registerdata() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> requestBody = {
        "companyEmail": emailController.text,
        "password": passwordController.text,
      };

      // Convert the body to JSON
      String jsonBody = json.encode(requestBody);

      // Send the POST request
      var response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api/auth'),
        headers: {'Content-Type': 'application/json'},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        var loginresponse1 = loginresponse.fromJson(jsonDecode(response.body));

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => option(loginresponse1.data!)));
      } else {
        print(response.body);
        showAlertDialog(
            context, "Login Failed", "Check Email and password!", "close");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: height * 0.48,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
              color: Colors.blue.shade900,
            ),
          ),
          Center(
            child: Container(
                width: double.infinity,
                child: Container(
                    height: 320,
                    margin: EdgeInsets.only(
                        top: 10, left: 30, right: 30, bottom: 40),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  "Employer Login",
                                  style: GoogleFonts.roboto(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Company Email Id",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: validateNotEmpty,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: validateNotEmpty,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    registerdata();
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 40,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.blue.shade900,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      elevation: 10,
                    ))),
          ),
        ],
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
