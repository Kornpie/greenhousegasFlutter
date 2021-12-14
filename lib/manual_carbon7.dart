import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/manual_carbon4.dart';
import 'package:greenhousegas/manual_carbon5.dart';
import 'package:greenhousegas/manual_carbon6.dart';
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

class manualCarbon7 extends StatefulWidget {
  @override
  manualCarbon7State createState() => manualCarbon7State();
}

class manualCarbon7State extends State<manualCarbon7> {
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
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text(
                              'บัญชีรายการของการผลิตฟิล์มโพลีเอทีลีน\n (Inventory of PET FILM PRODUCTION \n   CARBON FOOTPRINT Assessment)',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )),
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
                        height: 650,
                        width: 2000,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Table(
                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),
                                2: IntrinsicColumnWidth(),
                                3: FlexColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("รายการที่นำมา\n      คำนวณ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "  ข้อมูลที่นำมา\n      คำนวณ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("          หน่วย",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(
                                          " ค่าสัมประสิทธิ์ \n     Emission \n        Factor",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กระบวนการผลิตฟิล์ม"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child:
                                            Text("ปริมาณฟิล์มที่ส่งให้ลูกค้า"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" กิโลกรัม "),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(
                                          "ของเสียที่เป็นพลาสติกที่นำไปรีไซเคิล"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "ปริมาณฟิล์มเสียที่นำไปขายให้ผู้รับซื้อ"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" กิโลกลัม "),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("การใช้น้ำ RO"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child:
                                            Text("บันทึกการใช้น้ำประจำเดือน"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" ลูกบาศก์เมตร "),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("การใช้น้ำอ่อน"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child:
                                            Text("บันทึกการใช้น้ำประจำเดือน"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" ลูกบาศก์เมตร "),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("การใช้น้ำประปา"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child:
                                            Text("บันทึกการใช้น้ำประจำเดือน"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" ลูกบาศก์เมตร "),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("การใช้ NG"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child:
                                            Text("บันทึกการใช้ NG ประจำเดือน"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" MJ "),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("การใช้ไฟฟ้า"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child:
                                            Text("บันทึกการใช้ไฟฟ้าประจำเดือน"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" กิโลวัตต์ต่อ ชั่วโมง "),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("การใช้LPG"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child:
                                            Text("บันทึกการใช้LPGประจำเดือน"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" กิโลกรัม "),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                              ],
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
                                return manualCarbon8();
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
