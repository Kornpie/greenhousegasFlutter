import 'package:flutter/material.dart';
import 'package:greenhousegas/show_waste_recycle.dart';

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

class RecycleAdata extends StatefulWidget {
  @override
  _RecycleAdataState createState() => _RecycleAdataState();
}

class _RecycleAdataState extends State<RecycleAdata> {
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
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 65,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text('ข้อมูลของเสียรีไซเคิล',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text('ของเสียรีไซเคิล A',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text('เดือนเริ่มต้น',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text('เดือนสิ้นสุด',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text('แสดงข้อมูล',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text('วิเคราะห์ข้อมูล',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          'ข้อมูลอื่น',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return show_waste_recycle();
            }),
          );
        },
      ),
    );
  }
}
