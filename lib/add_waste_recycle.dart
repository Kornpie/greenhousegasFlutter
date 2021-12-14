import 'dart:convert';
import 'package:greenhousegas/show_waste_recycle.dart';
import 'package:greenhousegas/staple.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class addWaste extends StatefulWidget {
  final list;
  final i;
  final x;
  addWaste({this.list, this.i, this.x});
  @override
  _addWasteState createState() => _addWasteState();
}

class _addWasteState extends State<addWaste> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List company = [];
  List companyname = [];
  List car = [];
  List carname = [];
  List mon = [];
  List yea = [];
  List day = [];
  String waste_id = null;
  String monSave = null;
  String yeaSave = null;
  String daySave = null;
  String selectedValue = null;
  String caValue = null;
  TextEditingController waste_distance = TextEditingController();
  TextEditingController car_codeid = TextEditingController();
  TextEditingController waste_ename = TextEditingController();
  TextEditingController waste_weight = TextEditingController();

  @override
  void initState() {
    getsubname();
    getcar();
    getmonth();
    print(widget.list[widget.i]);
    jojo();
    super.initState();
  }

  List a = List.empty();
  String id = "";
  void jojo() async {
    selectedValue = widget.list[widget.i]['waste_company_destination'];
    caValue = widget.list[widget.i]['waste_cars'];
    waste_id = widget.list[widget.i]['waste_id'];
    waste_ename = TextEditingController(text: "WASTE PET FILM");
    // waste_ename = TextEditingController(text: widget.list[widget.i]['waste_name']);
    // waste_weight =
    //     TextEditingController(text: widget.list[widget.i]['waste_weight']);
  }

  Future uploaddata() async {
    final date_regis = monSave + '-' + yeaSave;
    // print(date_regis);
    final data_waste_eq = double.parse(waste_weight.text) * 1.5;
    // print(data_waste_eq);
    final data_distance_eq = double.parse(waste_distance.text) * 2;
    // print(data_distance_eq);

    print(selectedValue);
    print(waste_ename.text);
    print(waste_weight.text);
    print(data_waste_eq.toString());
    print(waste_distance.text);
    print(waste_distance.text);
    print(waste_ename.text);

    final total = data_waste_eq + data_distance_eq;
    print(total);
    print(waste_id);
    final uri =
        Uri.parse("http://${ipcon}/greenhousegas/add_waste_recycle.php");
    var request = http.MultipartRequest('POST', uri);

    request.fields['company_id'] = selectedValue;
    request.fields['car_id'] = caValue;
    request.fields['waste_name'] = waste_ename.text;
    request.fields['waste_weight'] = waste_weight.text;
    request.fields['waste_eq'] = data_waste_eq.toString();
    request.fields['waste_distance'] = waste_distance.text;
    // request.fields['waste_distance_eq'] = data_distance_eq.toString();
    request.fields['waste_total_eq'] = total.toString();
    request.fields['waste_car_codeid'] = car_codeid.text;
    request.fields['waste_day'] = daySave;
    request.fields['waste_month'] = monSave;
    request.fields['waste_year'] = yeaSave;

    var response = await request.send();
    if (response.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => show_waste_recycle()));
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
    List<DropdownMenuItem<String>> mon2 = mon.map((e) {
      return DropdownMenuItem<String>(
        value: e['mon_id'].toString(),
        child: Text(e['mon_name'].toString()),
      );
    }).toList();
    List<DropdownMenuItem<String>> carname2 = carname.map((e) {
      return DropdownMenuItem<String>(
        value: e['car_id'].toString(),
        child: Text(e['car_name'].toString()),
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
      '31',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value.toString(),
        child: Text(value.toString()),
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
                    child: Text("ข้อมูลของเสียรีไซเคิล",
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
                                //       right: 170, top: 15, bottom: 5),
                                //   child: Text(selectedValue,
                                //       style: TextStyle(
                                //           fontSize: 16,
                                //           color: Colors.grey[700])),
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
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                    ),
                                    value: selectedValue,
                                    items: companyname2,
                                    // onChanged: (v) {
                                    //   setState(() {
                                    //     selectedValue = v.toString();
                                    //   });
                                    //   print(selectedValue);
                                    // },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 170, top: 15, bottom: 5),
                                  child: Text("ชื่อวัตถุดิบ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 15, bottom: 5),
                                  child: Text(waste_ename.text,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //     left: 40,
                                //     right: 40,
                                //   ),
                                //   child: Container(
                                //     height: 25,
                                //     child: TextFormField(
                                //       validator: RequiredValidator(
                                //           errorText: 'กรุณากรอกให้ถูกต้อง'),
                                //       controller: waste_ename,
                                //       decoration: InputDecoration(
                                //         contentPadding: EdgeInsets.all(10),
                                //         filled: true,
                                //         fillColor: Colors.white,
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                      controller: waste_distance,
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
                                      controller: waste_weight,
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
                                  child: Text("เลือกวัน เดือน ปี",
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
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (waste_weight.text == "" &&
                                        car_codeid.text == "" &&
                                        waste_distance.text == "") {
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
          ],
        ),
      ),
    );
  }
}
