import 'dart:convert';
import 'package:greenhousegas/staple.dart';
import 'package:greenhousegas/view_use_energy.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import '../login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class formaddLPG extends StatefulWidget {
  final list;
  final i;
  final x;
  formaddLPG({this.list, this.i, this.x});
  @override
  _formaddLPGState createState() => _formaddLPGState();
}

class _formaddLPGState extends State<formaddLPG> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List company = [];
  List companyname = [];
  List car = [];
  List carname = [];
  List factors = [];
  List day = [];
  List mon = [];
  List yea = [];
  String lpg_id = null;
  String daySave = null;
  String monSave = null;
  String yeaSave = null;
  String selectedValue = null;
  String caValue = null;
  TextEditingController lpg_distance = TextEditingController();
  TextEditingController car_codeid = TextEditingController();
  TextEditingController lpg_name = TextEditingController(text: "การใช้LPG");
  TextEditingController lpg_weight = TextEditingController();

  @override
  void initState() {
    getsubname();
    getcar();
    // print(widget.list[widget.i]);
    // jojo();
    getmonth();
    geteq();
    super.initState();
  }

  List a = List.empty();
  String id = "";

  Future uploaddata() async {
    final data_lpg_eq = double.parse(lpg_weight.text) *
        double.parse(factors[0]['factor_value']);
    print(data_lpg_eq);

    final uri = Uri.parse("http://${ipcon}/greenhousegas/add_lpg.php");
    var request = http.MultipartRequest('POST', uri);
    // request.fields['lpg_id'] = widget.list[widget.i]['lpg_id'];
    request.fields['company_id'] = selectedValue;
    request.fields['car_id'] = caValue;
    request.fields['lpg_name'] = lpg_name.text;
    request.fields['lpg_weight'] = lpg_weight.text;
    request.fields['lpg_weight_eq'] = data_lpg_eq.toString();
    request.fields['lpg_distance'] = lpg_distance.text;
    // request.fields['lpg_distance_eq'] = data_distance_eq.toString();
    // request.fields['lpg_total_eq'] = total.toString();
    request.fields['lpg_car_codeid'] = car_codeid.text;
    request.fields['lpg_day'] = daySave;
    request.fields['lpg_month'] = monSave;
    request.fields['lpg_year'] = yeaSave;

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

  Future geteq() async {
    final response = await http.get(Uri.parse(
        "http://${ipcon}/greenhousegas/getfactors.php?nameFac=LpgEq"));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        factors = jsonData;
      });
    }
    print(factors);
  }

  Future getsubname() async {
    final response = await http
        .get(Uri.parse("http://${ipcon}/greenhousegas/get_company.php"));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        companyname = jsonData;
      });
    }
    // print(subjectname);
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

  Future getcar() async {
    final response =
        await http.get(Uri.parse("http://${ipcon}/greenhousegas/get_car.php"));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        carname = jsonData;
      });
    }
    // print(subjectname);
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> companyname2 = companyname.map((e) {
      return DropdownMenuItem<String>(
        value: e['company_id'].toString(),
        child: Text(e['company_name'].toString()),
      );
    }).toList();
    List<DropdownMenuItem<String>> carname2 = carname.map((e) {
      return DropdownMenuItem<String>(
        value: e['car_id'].toString(),
        child: Text(e['car_name'].toString()),
      );
    }).toList();
    List<DropdownMenuItem<String>> monthdata = mon.map((e) {
      return DropdownMenuItem<String>(
        value: e['mon_id'].toString(),
        child: Text(e['mon_name'].toString()),
      );
    }).toList();

    List<DropdownMenuItem<String>> day = [
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
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value.toString(),
        child: Text(value.toString()),
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
                    child: Text("เพิ่มการใช้ LPG",
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
                                  child: Text("ชื่อบริษัทต้นทาง",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       left: 40, right: 40),
                                //   child: DropdownButtonFormField<String>(
                                //     decoration: const InputDecoration(),
                                //     isExpanded: true,
                                //     hint: Center(
                                //       child: Text(
                                //         "-----เลือกบริษัท-----",
                                //         style: TextStyle(
                                //             fontSize: 18, color: Colors.black),
                                //       ),
                                //     ),
                                //     value: selectedValue,
                                //     items: companyname2,
                                //     // onChanged: (v) {
                                //     //   setState(() {
                                //     //     selectedValue = v.toString();
                                //     //   });
                                //     //   print(selectedValue);
                                //     // },
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(),
                                    isExpanded: true,
                                    hint: Center(
                                      child: Text(
                                        "-----เลือกบริษัท-----",
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
                                      right: 165, top: 20, bottom: 5),
                                  child: Text("รถที่ใช้ขนส่ง",
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
                                        "-----เลือกรถขนส่ง-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: caValue,
                                    items: carname2,
                                    onChanged: (e) {
                                      setState(() {
                                        caValue = e.toString();
                                      });
                                      print(caValue);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 170, top: 15, bottom: 5),
                                  child: Text("ทะเบียนรถ",
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
                                      controller: car_codeid,
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
                                      right: 170, top: 15, bottom: 5),
                                  child: Text("ระยะทาง",
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
                                      controller: lpg_distance,
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
                                      right: 190, top: 15, bottom: 5),
                                  child: Text("นํ้าหนัก",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    height: 20,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: lpg_weight,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 150, top: 10, bottom: 5),
                                  child: Text("เลือก วัน/เดือน/ปี",
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
                                        "-----เลือกวัน-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: daySave,
                                    items: day,
                                    onChanged: (v) {
                                      setState(() {
                                        daySave = v.toString();
                                      });
                                      print(daySave);
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
                                        "-----เลือกเดือน-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: monSave,
                                    items: monthdata,
                                    onChanged: (v) {
                                      setState(() {
                                        monSave = v.toString();
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
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (lpg_weight.text == "" &&
                                        car_codeid.text == "" &&
                                        lpg_distance.text == "") {
                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.warning,
                                            title: "กรุณากรอกข้อมูล",
                                          ));
                                    } else if (monSave == null) {
                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.warning,
                                            title: "กรุณาเลือกเดือน",
                                          ));
                                    } else if (yeaSave == null) {
                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.warning,
                                            title: "กรุณาเลือกปี",
                                          ));
                                    } else {
                                      uploaddata();
                                    }
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
                                    child: Text("ตกลง",
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200, right: 0, bottom: 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return staple();
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
