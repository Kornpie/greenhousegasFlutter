import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/manual_carbon1.dart';
import 'package:greenhousegas/show_display.dart';

import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'edit_raw_materials.dart';
import 'insert_product.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'edit_product.dart';
import 'view_product.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'manual_carbon1.dart';

class showcarbon extends StatefulWidget {
  @override
  showcarbonState createState() => showcarbonState();
}

class showcarbonState extends State<showcarbon> {
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

  Future uploaddata() async {
    final sum = int.parse(mon_End) - int.parse(mon_Start);
    print(sum);

    if (sum >= 2) {
      // ArtSweetAlert.show(
      //     context: context,
      //     artDialogArgs: ArtDialogArgs(
      //       type: ArtSweetAlertType.success,
      //       title: "ได้",
      //     ));

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => showdispaly(mon_Start, mon_End, yaerSave)));
    } else {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "เลือกมากกว่า 3 เดือนขึ้นไป",
          ));
    }
  }

  List mon = [];
  List yea = [];
  String mon_Start = null;
  String mon_End = null;
  String yaerSave = null;
  String monSave = null;
  @override
  void initState() {
    getmonth();
    super.initState();
  }

  Future getmonth() async {
    final response = await http
        .get(Uri.parse("http://${ipcon}/greenhousegas/get_month.php"));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        mon = jsonData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> monthdata = mon.map((e) {
      return DropdownMenuItem<String>(
        value: e['mon_id'].toString(),
        child: Text(e['mon_name'].toString()),
      );
    }).toList();

    List<DropdownMenuItem<String>> yea = [
      '2021',
      '2022',
      '2023',
      '2024',
      '2025',
      '2026',
      '2027',
      '2028',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value.toString(),
        child: Text(value.toString()),
      );
    }).toList();

    return Scaffold(
      body: Container(
        // height: 600,
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 250, right: 0, top: 0, bottom: 0),
                    child: Container(
                      child: Text(username,
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        children: [
                          Text("การประเมินคาร์บอนฟุตพริ้นท์ ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Text("CARBON FOOTPRINT ASSESSMENT",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 240, top: 20, bottom: 5),
                    child: Text("เดือนเริ่มต้น",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Container(
                      height: 49,
                      decoration: BoxDecoration(
                          color: Colors.white, // background
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(),
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            "-----เดือนเริ่มต้น-----",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        value: mon_Start,
                        items: monthdata,
                        onChanged: (e) {
                          setState(() {
                            mon_Start = e.toString();
                          });
                          print(mon_Start);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 240, top: 20, bottom: 5),
                    child: Text("เดือนสิ้นสุด",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Container(
                      height: 49,
                      decoration: BoxDecoration(
                          color: Colors.white, // background
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(),
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            "-----เดือนสิ้นสุด-----",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        value: mon_End,
                        items: monthdata,
                        onChanged: (e) {
                          setState(() {
                            mon_End = e.toString();
                          });
                          print(mon_End);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 270, top: 20, bottom: 5),
                    child: Text("เลือกปี",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                    child: Container(
                      height: 49,
                      decoration: BoxDecoration(
                          color: Colors.white, // background
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(),
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            "-----เลือกปี-----",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        value: yaerSave,
                        items: yea,
                        onChanged: (v) {
                          setState(() {
                            yaerSave = v.toString();
                          });
                          print(yaerSave);
                        },
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: GestureDetector(
                  //     child: Container(
                  //       height: 50,
                  //       decoration: BoxDecoration(
                  //           color: Colors.white, // background
                  //           borderRadius: BorderRadius.circular(5)),
                  //       child: const Center(
                  //           child: Padding(
                  //         padding: const EdgeInsets.only(
                  //             left: 0, right: 0, top: 0, bottom: 0),
                  //         child: Text('เดือนเริ่มต้น ( FROM )',
                  //             style:
                  //                 TextStyle(fontSize: 18, color: Colors.black)),
                  //       )),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: GestureDetector(
                  //     child: Container(
                  //       height: 50,
                  //       decoration: BoxDecoration(
                  //           color: Colors.white, // background
                  //           borderRadius: BorderRadius.circular(5)),
                  //       child: const Center(
                  //           child: Padding(
                  //         padding: const EdgeInsets.only(
                  //             left: 0, right: 0, top: 0, bottom: 0),
                  //         child: Text('เดือนสิ้นสุด ( END )',
                  //             style:
                  //                 TextStyle(fontSize: 18, color: Colors.black)),
                  //       )),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        uploaddata();
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.yellow[100], // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Center(
                            child: Text(
                                'แสดงผลการประเมินคาร์บอนฟุตพริ้นท์\n\n                       ( Display )',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
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
                            return manualCarbon1();
                          }),
                        );
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text(
                              'คู่มือการประเมินคาร์บอนฟุตพริ้นท์\n\n                   ( Manual )',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('ข้อมูลอื่น'),
        icon: const Icon(Icons.arrow_back_ios_new),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddData();
            }),
          );
        },
      ),
    );
  }
}
