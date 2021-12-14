import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/manual_carbon4.dart';
import 'package:greenhousegas/manual_carbon6.dart';
import 'package:greenhousegas/manual_carbon7.dart';
import 'package:greenhousegas/manual_carbon8.dart';

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

class manualCarbon5 extends StatefulWidget {
  @override
  manualCarbon5State createState() => manualCarbon5State();
}

class manualCarbon5State extends State<manualCarbon5> {
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, bottom: 0, top: 0),
                    child: Container(
                      height: 70,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent, // background
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 3, right: 0, bottom: 0, top: 25),
                        child: Text("        Environmental Impact",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return addwaterr();
                      //     }),
                      //   );
                      // },

                      child: Container(
                        height: 1600,
                        width: 2000,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 10),
                              child: Container(
                                height: 80,
                                width: 290,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3, right: 0, bottom: 0, top: 0),
                                  child: Text(
                                      "   ปริมาณมลสารจากการขนส่ง\n     วัตถุดิบTransportation in",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, left: 170),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 30.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 10),
                              child: Container(
                                height: 80,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.blue, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3, right: 0, bottom: 0, top: 0),
                                  child: Text(
                                      "             การรับ\n    วัตถุดิบ(Receipt)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 20),
                              child: Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3, right: 0, bottom: 0, top: 0),
                                  child: Text(
                                      "  การใช้น้ำWater Consumpion\n   การใช้ก๊าชธรรมชาติNatual\n    Gas Useการใช้วัตถุดิบRaw \n   Material Useการใช้สารเคมี\n   Chemical Useการใช้ไฟฟ้า\n   Electical Useการใช้วัตถุดิบ\n  สนับสนุนSupport Material Use",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, left: 100),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_downward_outlined,
                                        size: 30.0,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, left: 130),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_downward_outlined,
                                        size: 30.0,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 0,
                                          bottom: 0,
                                          top: 0),
                                      child: GestureDetector(
                                        child: Container(
                                          height: 100,
                                          width: 190,
                                          decoration: BoxDecoration(
                                              color: Colors.blue, // background
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Center(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Text(
                                                '  การผลิตฟิล์ม\n   โพลีเอพีลีน\n   PET FLIM\nPRODUCTION',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 0,
                                          bottom: 18,
                                          top: 0),
                                      child: GestureDetector(
                                        child: Container(
                                          height: 80,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.blue, // background
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Center(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Text(
                                                'การบรรจุหีบห่อ \n    (Packing)',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, left: 100),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 30.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 0),
                              child: Container(
                                height: 310,
                                width: 320,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3, right: 0, bottom: 0, top: 0),
                                  child: Text(
                                      "  ปริมาณมลสารจาการขนส่งของ\nเสียที่จะขายเป็นวัสดุรีไซเคิลและของเสียประเภทอื่น Transportation outปริมาณมลสารจากการกัดของเสียโดยวิธีต่าง ๆ  Pollution From\nWater Menagement น้ำจากการระบายความร้อน(ไม่เข้าข่าย)\nCooling Water not related\nปริมาณมลสารจากปล่องระบายของหม้อต้มน้ำมันร้อน\nNG Emissions (Not-Signficant)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 20),
                              child: Container(
                                height: 90,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3, right: 0, bottom: 0, top: 5),
                                  child: Text(
                                      "การใช้ก๊าซธรรมชาติเหลวสำหรับโฟร์คลิฟท์ LPG Use for Forklift",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, left: 180),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 30.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 0, bottom: 0, top: 0),
                              child: GestureDetector(
                                child: Container(
                                  height: 100,
                                  width: 320,
                                  decoration: BoxDecoration(
                                      color: Colors.blue, // background
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 0, bottom: 0),
                                    child: Text(
                                        'การจัดเรียงสินค้าโดยรถโฟร์คลิฟท์\n(Product Arrangement by Forklift)',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, left: 180),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 30.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 0, bottom: 0, top: 0),
                              child: Container(
                                height: 100,
                                width: 290,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3, right: 0, bottom: 0, top: 5),
                                  child: Text(
                                      "  ปริมาณมลสารจากการใช้ก๊าซธรรมชาติเหลวสำหรับโฟร์คลิฟท์ LPG Emission(Non-Significant)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 0, bottom: 0, top: 20),
                              child: GestureDetector(
                                child: Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.blue, // background
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 0, bottom: 0),
                                    child: Text(
                                        '  การขนส่งสินค้า \n(Product Delivery)',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 0, bottom: 0, top: 30),
                              child: GestureDetector(
                                child: Container(
                                  height: 100,
                                  width: 310,
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent, // background
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 0, bottom: 0),
                                    child: Text(
                                        ' ปริมาณมลสารจากการขนส่งสินค้า \n           Transportation out',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                return manualCarbon6();
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
