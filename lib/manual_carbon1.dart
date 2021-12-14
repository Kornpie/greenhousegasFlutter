import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';

import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'edit_raw_materials.dart';
import 'insert_product.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'edit_product.dart';
import 'view_product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'show_carbon_fp.dart';
import 'manual_carbon2.dart';
import 'manual_carbon3.dart';

class manualCarbon1 extends StatefulWidget {
  @override
  manualCarbon1State createState() => manualCarbon1State();
}

class manualCarbon1State extends State<manualCarbon1> {
  Future<List> getdata() async {
    final response = await http
        .get(Uri.parse("http://$ipcon/greenhousegas/show_product.php"));
    return json.decode(response.body);
  }

  String username = "";
  String utype = "";

  // Future getEmail() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = preferences.getString('user_fullname');
  //     utype = preferences.getString('user_type');
  //   });
  //   print('ชื่อหน้า Prod' + username);
  //   print('ประเภท Prod' + utype);
  // }

  @override
  // void initState() {
  //   //initsete คือทำงานตอนเข้าหน้านั้นๆ ในหน้านี้เราใช้เรีกหาข้อมูลของ user
  //   getEmail();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 250, right: 0, top: 0, bottom: 0),
                    child: Container(
                      child: Text(username,
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                            color: Colors.orange, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text(
                              'Developing of Mobile\nApplication for Carbon\nFootprint Assessment\nof a Polyethylene Film\nProduction Company',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text('Paisansin Suksri\nCode 2595000361',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) {
                        //     return showdispaly();
                        //   }),
                        // );
                      },
                      child: Container(
                        height: 240,
                        decoration: BoxDecoration(
                            color: Colors.grey, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Center(
                            child: Text(
                                'A Thesis Submitted in Partial\nFulfillment of the Requirements\nfor the Degree of Master of\n Science in Industrial Environment\n Management School of Health \nScience Sukhothai Thammathirat \nOpen University B.E. 2020',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 0, bottom: 0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return showcarbon();
                              }),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 155,
                            height: 43,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("Back",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return manualCarbon2();
                              }),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 155,
                            height: 43,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("Next",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
