import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/pages/addforeigner.dart';
import 'package:police/pages/addguestemployee.dart';
import 'package:police/pages/addtenantinfo.dart';
import 'package:police/pages/landing.dart';
import 'package:police/pages/profile.dart';
import 'package:police/pages/viewdata.dart';

class option extends StatefulWidget {
  option(this.userId);

  final String userId;

  @override
  State<option> createState() => _optionState();
}

class _optionState extends State<option> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => landingpage()));
              },
            )
          ],
          title: Text("Home"),
          backgroundColor: Colors.blue.shade900,
          elevation: 6,
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              addguestemployee(widget.userId)));
                    },
                    child: Card(
                      elevation: 7,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.group_add_sharp,
                              size: 40,
                              color: Color.fromARGB(255, 34, 166, 39),
                            ),
                            Text(
                              "Add Guest Employee",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        height: 150,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddForeigner(widget.userId)));
                    },
                    child: Card(
                      elevation: 7,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.follow_the_signs_sharp,
                              color: Colors.orange,
                              size: 40,
                            ),
                            Text("Add Foreigner Details",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                        height: 150,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => addtenetinfo(widget.userId)));
                    },
                    child: Card(
                      elevation: 7,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.add_home_rounded,
                              color: Colors.red,
                              size: 40,
                            ),
                            Text("Add Tenet Information",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                        height: 150,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => viewdata(widget.userId)));
                    },
                    child: Card(
                      elevation: 7,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.view_carousel_sharp,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Text("View all added Data",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                        height: 150,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => profile()));
                    },
                    child: Card(
                      elevation: 7,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.person_pin_sharp,
                              size: 40,
                              color: Colors.brown,
                            ),
                            Text("View Profile",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                        height: 150,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
