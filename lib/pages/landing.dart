import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/pages/login.dart';
import 'package:police/pages/register.dart';

class landingpage extends StatefulWidget {
  landingpage({Key? key}) : super(key: key);

  @override
  State<landingpage> createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: height * 0.28,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              color: Colors.blue.shade900,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  width: width * 0.8,
                  child: Image.asset('assets/cbepolicelogo.png')),
              Text(
                "COIMBATORE CITY POLICE",
                style: GoogleFonts.roboto(
                    fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Container(
                  width: 170,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  // color: Colors.blue.shade900,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue.shade900,
                  ),
                  child: Center(
                      child: Text("Register",
                          style: TextStyle(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => login()));
                },
                child: Container(
                  width: 170,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue.shade900,
                  ),
                  child: Center(
                      child:
                          Text("Login", style: TextStyle(color: Colors.white))),
                ),
              )
            ]),
          ),
          Positioned(
              bottom: 10,
              child: Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Copyright © 2023",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Provided by Prompt infotech Pvt Ltd")
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
