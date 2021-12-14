import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'show_water.dart';

class viewwaterAll extends StatefulWidget {
  final list;
  final i;
  final x;
  viewwaterAll({this.list, this.i, this.x});
  @override
  _viewwaterAllState createState() => _viewwaterAllState();
}

class _viewwaterAllState extends State<viewwaterAll> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String monStart = null;
  String monEnd = null;
  String ySt = null;
  String yed = null;

  List company = [];
  List companyname = [];
  List car = [];
  List carname = [];
  // String selectedValue = null;
  // String caValue = null;
  // TextEditingController product_name = TextEditingController();
  // TextEditingController product_weight = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> month = [
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value.toString(),
        child: Text(value.toString()),
      );
    }).toList();
    List<DropdownMenuItem<String>> water_yaer = [
      '2564',
      '2565',
      '2566',
      '2567',
      '2568',
      '2569',
      '2570',
      '2571',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value.toString(),
        child: Text(value.toString()),
      );
    }).toList();
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
                    child: Text("ข้อมูลการใช้น้ำประปาทั้งหมด",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 70,
                    width: 320,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white, // background
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'การใช้น้ำประปา',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 250,
                    width: 320,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white, // background
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 140, top: 10, bottom: 5),
                                  child: Text("เดือนเริ่มต้น",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(),
                                    isExpanded: true,
                                    hint: Center(
                                      child: Text(
                                        "-----เดือนเริ่มต้น-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: monStart,
                                    items: month,
                                    onChanged: (v) {
                                      setState(() {
                                        monStart = v.toString();
                                      });
                                      print(monStart);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(),
                                    isExpanded: true,
                                    hint: Center(
                                      child: Text(
                                        "-----ปี-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: ySt,
                                    items: water_yaer,
                                    onChanged: (v) {
                                      setState(() {
                                        ySt = v.toString();
                                      });
                                      print(ySt);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 140, top: 10, bottom: 5),
                                  child: Text("เดือนสิ้นสุด",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(),
                                    isExpanded: true,
                                    hint: Center(
                                      child: Text(
                                        "-----เดือนสิ้นสุด-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: monEnd,
                                    items: month,
                                    onChanged: (v) {
                                      setState(() {
                                        monEnd = v.toString();
                                      });
                                      print(monEnd);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(),
                                    isExpanded: true,
                                    hint: Center(
                                      child: Text(
                                        "-----ปี-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: yed,
                                    items: water_yaer,
                                    onChanged: (v) {
                                      setState(() {
                                        yed = v.toString();
                                      });
                                      print(yed);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // if (selectedValue == null &&
                                    //     caValue == null &&
                                    //     water_cubic.text == "") {
                                    //   ArtSweetAlert.show(
                                    //       context: context,
                                    //       artDialogArgs: ArtDialogArgs(
                                    //         type: ArtSweetAlertType.warning,
                                    //         title: "กรุณากรอกข้อมูล",
                                    //       ));
                                    // } else if (selectedValue == null) {
                                    //   ArtSweetAlert.show(
                                    //       context: context,
                                    //       artDialogArgs: ArtDialogArgs(
                                    //         type: ArtSweetAlertType.warning,
                                    //         title: "กรุณาเลือกเดือน",
                                    //       ));
                                    // } else {
                                    //   uploaddata();
                                    // }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 150,
                                    height: 43,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.blue, Colors.blue]),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("แสดงข้อมูล",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // if (selectedValue == null &&
                                    //     caValue == null &&
                                    //     water_cubic.text == "") {
                                    //   ArtSweetAlert.show(
                                    //       context: context,
                                    //       artDialogArgs: ArtDialogArgs(
                                    //         type: ArtSweetAlertType.warning,
                                    //         title: "กรุณากรอกข้อมูล",
                                    //       ));
                                    // } else if (selectedValue == null) {
                                    //   ArtSweetAlert.show(
                                    //       context: context,
                                    //       artDialogArgs: ArtDialogArgs(
                                    //         type: ArtSweetAlertType.warning,
                                    //         title: "กรุณาเลือกเดือน",
                                    //       ));
                                    // } else {
                                    //   uploaddata();
                                    // }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 150,
                                    height: 43,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.blue, Colors.blue]),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("วิเคาระห์ข้อมูล",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 150, right: 0, top: 0, bottom: 0),
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
                  alignment: Alignment.center,
                  // width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(25),
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.yellow[500], // background
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("ข้อมูลอื่นๆ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
