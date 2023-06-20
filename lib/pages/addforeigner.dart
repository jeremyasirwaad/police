import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddForeigner extends StatefulWidget {
  AddForeigner({Key? key}) : super(key: key);

  @override
  State<AddForeigner> createState() => _AddForeignerState();
}

class _AddForeignerState extends State<AddForeigner> {
  var dropdownValue = null;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
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
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Hospital Name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Doctor Name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Hospital Location",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Upload Passport",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
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
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "College/University Name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "College Location",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Upload College ID",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Upload Passport",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
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
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Type of Business",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Time Period",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Upload Passport",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
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
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Place of Stay",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Upload Passport",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Upload Visa",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              )
                            : Container(),
                        Container(
                          width: 170,
                          height: 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue.shade900,
                          ),
                          child: Center(
                            child: Text(
                              "Register Details",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
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
