import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/show_com_lpg.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'insert_lpg.dart';
import 'insert_electricity.dart';
import 'insert_ng.dart';
import 'use_electricity_data.dart';
import 'use_lpg_data.dart';
import 'use_ng_data.dart';

class viewenergy extends StatefulWidget {
  @override
  _viewenergyState createState() => _viewenergyState();
}

class _viewenergyState extends State<viewenergy> {
  String username = "";
  String utype = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('user_fullname');
      utype = preferences.getString('user_type');
    });
    print('ชื่อ' + username);
    print('ประเภท' + utype);
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
                    height: 60,
                  ),
                  Container(
                    child: Center(
                      child: Text("ข้อมูลการใช้พลังงานประจำเดือน",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        utype == "2"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return formaddelectricity();
                                }),
                              )
                            : null;
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
                                    return viewUseElec();
                                  }),
                                );
                              },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 200, right: 0, top: 0, bottom: 0),
                              child: Text('การใช้ ไฟฟ้า+',
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
                            return showlpgcom();
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
                              // onPressed: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) {
                              //       return UseLPGData();
                              //     }),
                              //   );
                              // },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 200, right: 0, top: 0, bottom: 0),
                              child: Text('การใช้ LPG+',
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
                        utype == "2"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return formaddNG();
                                }),
                              )
                            : null;
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
                                    return UseNGData();
                                  }),
                                );
                              },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 80, right: 0, top: 0, bottom: 0),
                              child: Text('การใช้ก๊าซธรรมชาติ (NG)+',
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
