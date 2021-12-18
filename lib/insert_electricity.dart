import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:greenhousegas/view_use_energy.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ipcon.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:form_field_validator/form_field_validator.dart';

class formaddelectricity extends StatefulWidget {
  @override
  _formaddelectricityState createState() => _formaddelectricityState();
}

String _valueChanged = '';
String _valueToValidate = '';

class _formaddelectricityState extends State<formaddelectricity> {
  List mon = [];
  List yea = [];
  List factors = [];
  String monSave = null;
  String yeaSave = null;
  TextEditingController eg_name = TextEditingController(text: "การใช้ไฟฟ้า");
  TextEditingController eg_unit = TextEditingController();
  Future uploaddata() async {
    // final date_regis = monSave + '-' + yeaSave;
    // // print(date_regis);
    // final data_waste_eq = double.parse(waste_weight.text) * 1.5;
    // // print(data_waste_eq);
    final eg_unit_eq =
        double.parse(eg_unit.text) * double.parse(factors[0]['factor_value']);
    print(eg_unit_eq);

    final uri = Uri.parse("http://${ipcon}/greenhousegas/add_use_eg.php");
    var request = http.MultipartRequest('POST', uri);

    request.fields['eg_name'] = eg_name.text;
    request.fields['eg_unit'] = eg_unit.text;
    request.fields['eg_unit_eq'] = eg_unit_eq.toString();

    request.fields['eg_month'] = monSave;
    request.fields['eg_year'] = yeaSave;

    var response = await request.send();
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => viewenergy()));
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "เพิ่มข้อมูลสำเร็จ",
          ));
    } else {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "เพิ่มข้อมูลไม่สำเร็จ",
          ));
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    getmonth();
    geteq();
    super.initState();
  }

  Future geteq() async {
    final response = await http.get(Uri.parse(
        "http://${ipcon}/greenhousegas/getfactors.php?nameFac=ElecEq"));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        factors = jsonData;
      });
    }
    print(factors);
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
    // print(subjectname);
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> mon2 = mon.map((e) {
      return DropdownMenuItem<String>(
        value: e['mon_id'].toString(),
        child: Text(e['mon_name'].toString()),
      );
    }).toList();
    // List<DropdownMenuItem<String>> mon = [
    //   '01',
    //   '02',
    //   '03',
    //   '04',
    //   '05',
    //   '06',
    //   '07',
    //   '08',
    //   '09',
    //   '10',
    //   '11',
    //   '12',
    // ].map((String value) {
    //   return DropdownMenuItem<String>(
    //     value: value.toString(),
    //     child: Text(value.toString()),
    //   );
    // }).toList();
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
    //print(eg_name.text);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("เพิ่มข้อมูล"),
      // ),
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
                    child: Text("เพิ่มข้อมูลการใช้การใช้ ไฟฟ้า",
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
                    height: 350,
                    width: 320,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Form(
                            child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Column(
                                children: [
                                  Text(
                                    "เพิ่มข้อมูล",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 150, top: 10, bottom: 5),
                                    child: Text("เลือกเดือน ปี",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[700])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 40,
                                      right: 40,
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(),
                                      isExpanded: true,
                                      hint: Center(
                                        child: Text(
                                          "-----เลือกเดือน-----",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      value: monSave,
                                      items: mon2,
                                      onChanged: (e) {
                                        setState(() {
                                          monSave = e.toString();
                                        });
                                        print(monSave);
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
                                      value: yeaSave,
                                      items: yea,
                                      onChanged: (v) {
                                        setState(() {
                                          yeaSave = v.toString();
                                        });
                                        print(yeaSave);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 50, top: 10, bottom: 5),
                                    child: Text("กรอกตัวเลข หน่วย KW/H",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[700])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: Container(
                                      height: 20,
                                      child: TextFormField(
                                        validator: RequiredValidator(
                                            errorText: 'กรุณากรอกให้ถูกต้อง'),
                                        controller: eg_unit,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      uploaddata();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      height: 43,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.blue,
                                            Colors.blue
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Text("ตกลง",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
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
                          return viewenergy();
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
