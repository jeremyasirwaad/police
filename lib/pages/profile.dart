import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:police/pages/addforeigner.dart';
import 'package:police/pages/addguestemployee.dart';
import 'package:police/pages/addtenantinfo.dart';
import 'package:police/pages/landing.dart';
import 'package:police/pages/login.dart';

class profile extends StatefulWidget {
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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
          title: Text("Profile"),
          backgroundColor: Colors.blue.shade900,
          elevation: 6,
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                      "https://www.logodesign.net/logo/line-art-house-roof-and-buildings-4485ld.png"),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Company Type", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Company Location",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Company Contact Number",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Company GST Number",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Owner Details",
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 120,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Owner info", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue.shade900,
                      ),
                      child: Center(
                          child: Text("Edit",
                              style: TextStyle(color: Colors.white))),
                    ),
                  )
                ],
              )),
        ));
  }
}
