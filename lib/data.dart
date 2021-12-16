import 'package:flutter/material.dart';
import 'package:greenhousegas/show_carbon_fp.dart';
import 'package:greenhousegas/show_pollution.dart';

import 'package:greenhousegas/view_use_energy.dart';
import 'typeuser_regis.dart';
import 'dart:convert';
import 'login.dart';
import 'staple.dart';
import 'show_product.dart';
import 'show_waste_recycle.dart';
import 'show_electric.dart';
import 'show_water.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class FlutterSession {
  get(String s) {}
}

class _AddDataState extends State<AddData> {
  String username = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('user_fullname');
    });
    print(username + 'fff');
  }

  @override
  void initState() {
    //initsete คือทำงานตอนเข้าหน้านั้นๆ ในหน้านี้เราใช้เรีกหาข้อมูลของ user
    getEmail();
    super.initState();
  }

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
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 200, right: 0, top: 0, bottom: 0),
                    child: Container(
                      child: Text(username,
                          style: GoogleFonts.prompt(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 270, top: 0, bottom: 0),
                    child: Container(
                      child: Text("ข้อมูล",
                          style: GoogleFonts.prompt(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  Container(
                    child: Text("_____________________________",
                        style: TextStyle(fontSize: 26, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 500,
                    width: 360,

                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return staple();
                                }),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white, // background
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 200, top: 0, bottom: 0),
                                child: Text('ข้อมูลวัตถุดิบ',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return showproduct();
                                }),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white, // background
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 210, top: 0, bottom: 0),
                                child: Text('ข้อมูลสินค้า',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return show_waste_recycle();
                                }),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white, // background
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 130, top: 0, bottom: 0),
                                child: Text('ข้อมูลของเสียรีไซเคิล',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return viewenergy();
                                }),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white, // background
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 90, top: 0, bottom: 0),
                                child: Text('การใช้พลังงานประจำเดือน',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return showwater();
                                }),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white, // background
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 60, top: 0, bottom: 0),
                                child: Text('ข้อมูลการใช้น้ำประปารายเดือน',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return showpollution();
                                }),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white, // background
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 90, top: 0, bottom: 0),
                                child: Text('ข้อมูลมลพิษน้ำ กาก อากาศ',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return showcarbon();
                                }),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white, // background
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 90, top: 0, bottom: 0),
                                child: Text('การประเมินคาร์บอนฟุตพริ้นท์',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )),
                            ),
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
