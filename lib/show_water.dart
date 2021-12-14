import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/insert_water1.dart';
import 'package:greenhousegas/insert_water2.dart';
import 'package:greenhousegas/insert_water3.dart';
import 'package:greenhousegas/view_water.dart';
import 'package:greenhousegas/view_water2.dart';
import 'package:greenhousegas/view_water3.dart';
import 'typeuser_regis.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'login.dart';
import 'insert_raw_materials.dart';
import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constans.dart';
import 'edit_raw_materials.dart';
import 'view_raw_materials.dart';


class showwater extends StatefulWidget {
  @override
  _showwaterState createState() => _showwaterState();
}

class _showwaterState extends State<showwater> {
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
                    height: 60,
                  ),
                  Container(
                    child: Center(
                      child: Text("ข้อมูลการใช้น้ำประปาประจำเดือน",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) {
                    //       return addpollution();
                    //     }),
                    //   );
                    // },
                    child: Container(
                      alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.width,
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.grey[300], // background
                          borderRadius: BorderRadius.circular(30)),
                      child: Text("เพิ่มข้อมูล",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[500])),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return addwater();
                          }),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined),
                              iconSize: 35,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return viewwater();
                                  }),
                                );
                              },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 100, right: 0, top: 0, bottom: 0),
                              child: Text('การใช้น้ำประปาการนิคมฯ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            )),
                          ],
                        ),
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
                            return addwater2();
                          }),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined),
                              iconSize: 35,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return viewwater2();
                                  }),
                                );
                              },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 200, right: 0, top: 0, bottom: 0),
                              child: Text('การใช้น้ำอ่อน',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            )),
                          ],
                        ),
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
                            return addwater3();
                          }),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined),
                              iconSize: 35,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return viewwater3();
                                  }),
                                );
                              },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 210, right: 0, top: 0, bottom: 0),
                              child: Text('การใช้น้ำRO',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 225, right: 0, bottom: 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return AddData();
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
                      child: Text("ข้อมูลอื่น",
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
    );
  }
}