import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/manual_carbon4.dart';
import 'package:greenhousegas/manual_carbon5.dart';

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

class manualCarbon3 extends StatefulWidget {
  @override
  manualCarbon3State createState() => manualCarbon3State();
}

class manualCarbon3State extends State<manualCarbon3> {
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
  Widget showlogo() {
    return Container(
        width: 180, height: 110, child: Image.asset('assets/images/MC1.png'));
  }

  Widget showlogo1() {
    return Container(
        width: 180, height: 110, child: Image.asset('assets/images/MC2.png'));
  }

  Widget showlogo3() {
    return Container(
        width: 180, height: 110, child: Image.asset('assets/images/MC3.png'));
  }

  Widget showlogo4() {
    return Container(
        width: 172, height: 110, child: Image.asset('assets/images/MC4.png'));
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 0, bottom: 0),
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
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text(
                              '   ประเมินคาร์บอนฟุตพริ้นท์\n  สำหรับบริษัทผลิตแผ่นฟิล์ม\n       โพลีเอทิลีนแห่งหนึ่ง',
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
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.orange, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text(
                              'Carbon Footprint Assessment \n       of a Polyethylene Film \n        Production Company',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: showlogo(),
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0, top: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0),
                            child: GestureDetector(
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.green, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  child: Text('Raw Material\n   PET CHIP',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: showlogo1(),
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0),
                            child: GestureDetector(
                              child: Container(
                                height: 45,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.green, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 10, top: 0, bottom: 0),
                                  child: Text(' Product\nPET Film',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: showlogo3(),
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0, top: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 0),
                            child: GestureDetector(
                              child: Container(
                                height: 45,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.green, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  child: Text('     Product\nPET MET Film',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: showlogo4(),
                            padding: const EdgeInsets.only(
                                left: 0, right: 40, bottom: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 40, bottom: 0),
                            child: GestureDetector(
                              child: Container(
                                height: 48,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.green, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  child: Text('   End Product\nPET Packaging',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                                return manualCarbon4();
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
                  SizedBox(
                    height: 20,
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
