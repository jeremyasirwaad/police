import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/const.dart';
import 'package:police/dartmodel/foreignermodel.dart';
import 'package:police/dartmodel/guestlistmodel.dart';
import 'package:police/pages/addforeigner.dart';
import 'package:police/pages/addguestemployee.dart';
import 'package:police/pages/addtenantinfo.dart';
import 'package:police/pages/landing.dart';
import 'package:police/pages/profile.dart';
import 'package:police/pages/viewdata.dart';

class foreignerList extends StatefulWidget {
  foreignerList(this.userId);

  final String userId;

  @override
  State<foreignerList> createState() => _foreignerListState();
}

class _foreignerListState extends State<foreignerList> {
  List<Foreigner> gustdata = [];
  bool loading = true;

  void getdata() async {
    var response = await http.get(
      Uri.parse('${domain}/manage/foreignerlist'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': widget.userId
      },
    );

    if (response.statusCode == 200) {
      var data = ForeignerList.fromJson(jsonDecode(response.body));
      setState(() {
        gustdata = data.foreigner!;
        loading = false;
      });
    } else {
      print("Error in fetching");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print("hit");
    getdata();
    super.initState();
  }

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
          title: Text("Foreigners List"),
          backgroundColor: Colors.blue.shade900,
          elevation: 6,
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
            top: 20,
          ),
          child: loading
              ? Center(child: Text("Loading"))
              : gustdata.isEmpty
                  ? Text("No Guest Employees Added")
                  : ListView(
                      children: [
                        ...List.generate(
                            gustdata.length,
                            (index) => Card(
                                  elevation: 7,
                                  child: Container(
                                      padding: EdgeInsets.all(25),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              gustdata[index].fullName!,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text("DOB: " +
                                                gustdata[index].homeCountry!),
                                            Text("Phone Number: " +
                                                gustdata[index].phoneNumber!),
                                            Text("Job Role: " +
                                                gustdata[index].pov!),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary: Colors.white,
                                                        backgroundColor:
                                                            Color.fromRGBO(
                                                                255,
                                                                96,
                                                                85,
                                                                1), // Background Color
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Delete",
                                                      )),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary: Colors.white,
                                                        backgroundColor: Colors
                                                            .blue
                                                            .shade900, // Background Color
                                                      ),
                                                      onPressed: () {},
                                                      child: Text("Update"))
                                                ],
                                              ),
                                            )
                                          ])),
                                )),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
        ));
  }
}
