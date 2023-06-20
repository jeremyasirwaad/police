import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class addtenetinfo extends StatefulWidget {
  addtenetinfo({Key? key}) : super(key: key);

  @override
  State<addtenetinfo> createState() => _addtenetinfoState();
}

class _addtenetinfoState extends State<addtenetinfo> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  "Property Owner Information",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Full Name",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Atlas Name",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Date of birth",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Phone Number",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Hospital Name",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Gender",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Native Address",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Current Address",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Aadhaar Number",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Upload Aadhaar Card",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
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
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Full Name",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Atlas Name",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Date of birth",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Phone Number",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Hospital Name",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Gender",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Native Address",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Current Address",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Purpose of Stay",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Aadhar Number",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Upload Aadhar Card",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Alternative Identity",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 170,
                                  height: 40,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.blue.shade900,
                                  ),
                                  child: Center(
                                      child: Text("Register Details",
                                          style:
                                              TextStyle(color: Colors.white))),
                                )
                              ])),
                      elevation: 10,
                    ))),
          ],
        ),
      ),
    );
  }
}
