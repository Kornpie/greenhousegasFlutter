import 'dart:convert';

import 'package:greenhousegas/staple.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'show_product.dart';
import 'package:date_time_picker/date_time_picker.dart';

class weatherpollution extends StatefulWidget {
  @override
  _weatherpollutionState createState() => _weatherpollutionState();
}

class _weatherpollutionState extends State<weatherpollution> {
  @override
  void initState() {
    //getsubname();
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List company = [];
  List companyname = [];
  String selectedValue = null;
  String caValue = null;
  String yaer = null;
  TextEditingController water_cubic = TextEditingController();
  String _valueChanged = '';
  String _valueToValidate = '';

  // Future uploaddata() async {
  //   //print(yaer + selectedValue + water_cubic.text);
  //   final uri = Uri.parse("http://${ipcon}/greenhousegas/insert_water.php");
  //   var request = http.MultipartRequest('POST', uri);
  //   request.fields['water_month'] = selectedValue;
  //   request.fields['water_yaer'] = yaer;
  //   request.fields['water_cubic'] = water_cubic.text;

  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => showwater()));
  //     ArtSweetAlert.show(
  //         context: context,
  //         artDialogArgs: ArtDialogArgs(
  //           type: ArtSweetAlertType.success,
  //           title: "เพิ่มข้อมูลสำเร็จ",
  //         ));
  //   } else {
  //     ArtSweetAlert.show(
  //         context: context,
  //         artDialogArgs: ArtDialogArgs(
  //           type: ArtSweetAlertType.danger,
  //           title: "เพิ่มข้อมูลไม่สำเร็จ",
  //         ));
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> companyname2 = [
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
                    height: 50,
                  ),
                  Container(
                    child: Text("ข้อมูลมลพิษสิ่งแวดล้อม",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Text("บันทึกข้อมูลมลพิษอากาศA",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 800,
                    width: 350,
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
                                      right: 170, top: 10, bottom: 5),
                                  child: Text("กรอกเดือน/ปี",
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
                                        "-----เลือกเดือน-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: selectedValue,
                                    items: companyname2,
                                    onChanged: (v) {
                                      setState(() {
                                        selectedValue = v.toString();
                                      });
                                      print(selectedValue);
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
                                        "-----เลือกปี-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: yaer,
                                    items: water_yaer,
                                    onChanged: (v) {
                                      setState(() {
                                        yaer = v.toString();
                                      });
                                      print(yaer);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 110, top: 15, bottom: 5),
                                  child: Text("กรอกหน่วยอัตราการไหล",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                  ),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: water_cubic,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 180, top: 15, bottom: 5),
                                  child: Text("กรอกค่า SO₂",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                  ),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: water_cubic,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 180, top: 15, bottom: 5),
                                  child: Text("กรอกค่า NOx",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                  ),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: water_cubic,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 180, top: 15, bottom: 5),
                                  child: Text("กรอกค่า TDS",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                  ),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: water_cubic,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 180, top: 15, bottom: 5),
                                  child: Text("กรอกค่า CO₂",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                  ),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: water_cubic,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 180, top: 15, bottom: 5),
                                  child: Text("กรอกค่า PM10",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                  ),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: water_cubic,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       left: 25.0, right: 25.0, top: 2.0),
                                //   child: DateTimePicker(
                                //     type: DateTimePickerType.date,
                                //     dateMask: 'MM/yyyy',
                                //     firstDate: DateTime(1950),
                                //     lastDate: DateTime(2180),
                                //     calendarTitle: 'เลือกวันเดือนปีเกิด',
                                //     dateLabelText: 'วัน/เดือน/ปีเกิด *',
                                //     onChanged: (val) =>
                                //         setState(() => _valueChanged = val),
                                //     validator: (val) {
                                //       setState(
                                //           () => _valueToValidate = val ?? '');
                                //       return null;
                                //     },
                                //   ),
                                // ),

                                SizedBox(
                                  height: 45,
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 0, bottom: 0),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 155,
                                          height: 43,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Colors.blue,
                                                Colors.blue
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Text("save",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 155,
                                          height: 43,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Colors.blue,
                                                Colors.green
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Text("edit",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
