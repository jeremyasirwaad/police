import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/pages/addforeigner.dart';
import 'package:police/pages/addguestemployee.dart';
import 'package:police/pages/addtenantinfo.dart';
import 'package:police/pages/foreignerlist.dart';
import 'package:police/pages/landing.dart';
import 'package:police/pages/listguests.dart';
import 'package:police/pages/profile.dart';
import 'package:police/pages/tenetlist.dart';

class viewdata extends StatefulWidget {
  viewdata(this.userId);

  final String userId;

  @override
  State<viewdata> createState() => _viewdataState();
}

class _viewdataState extends State<viewdata> {
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
          title: Text("View Entries"),
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
                          builder: (context) => guestlist(widget.userId)));
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
                              "View Guest Employees",
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
                          builder: (context) => foreignerList(widget.userId)));
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
                            Text("View Foreigner Details",
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
                          builder: (context) => tenetList(widget.userId)));
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
                            Text("View Tenet Information",
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
