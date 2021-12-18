import 'dart:convert';
import 'package:greenhousegas/staple.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './/ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import './/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class editrawForm extends StatefulWidget {
  final list;
  final i;
  final x;
  editrawForm({this.list, this.i, this.x});
  @override
  _editrawFormState createState() => _editrawFormState();
}

class _editrawFormState extends State<editrawForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List factors = [];
  String rawdate = null;
  String raw_month = null;
  String raw_yaer = null;
  String rawid = null;
  String raw_car_codeid = null;
  String raw_cars = null;
  TextEditingController raw_distance = TextEditingController();
  TextEditingController rawname = TextEditingController();
  TextEditingController rawweight = TextEditingController();

  @override
  void initState() {
    print(widget.list[widget.i]);
    jojo();
    geteq();
    super.initState();
  }

  List a = List.empty();
  String id = "";
  void jojo() async {
    rawid = widget.list[widget.i]['raw_id'];
    rawdate = widget.list[widget.i]['raw_date'];
    raw_month = widget.list[widget.i]['raw_month'];
    raw_yaer = widget.list[widget.i]['raw_yaer'];
    raw_cars = widget.list[widget.i]['raw_cars'];
    raw_car_codeid = widget.list[widget.i]['raw_car_codeid'];
    raw_distance =
        TextEditingController(text: widget.list[widget.i]['raw_distance']);
    rawname = TextEditingController(text: widget.list[widget.i]['raw_name']);
    rawweight =
        TextEditingController(text: widget.list[widget.i]['raw_weight']);
  }

  Future uploaddata() async {
    final data_raw_eq =
        double.parse(rawweight.text) * double.parse(factors[0]['factor_value']);
    print(data_raw_eq);

    final uri =
        Uri.parse("http://${ipcon}/greenhousegas/edit_raw_materials.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['raw_eq'] = data_raw_eq.toString();
    request.fields['rawweight'] = rawweight.text;
    request.fields['rawid'] = rawid.toString();

    var response = await request.send();
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => staple()));
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
        "http://${ipcon}/greenhousegas/getfactors.php?nameFac=RawEQ"));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        factors = jsonData;
      });
    }
    print(factors);
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
                    height: 40,
                  ),
                  Container(
                    child: Text("แก้ไขข้อมูลข้อมูลวัตถุดิบ ",
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
                    height: 550,
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
                                  child: Text(
                                      "วันที่ " +
                                          rawdate +
                                          '/' +
                                          raw_month +
                                          '/' +
                                          raw_yaer,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
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
                                    left: 40,
                                    right: 40,
                                  ),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      enabled: false,
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: rawname,
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
                                      right: 165, top: 20, bottom: 5),
                                  child: Text("รถที่ใช้ขนส่ง",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 165, top: 0, bottom: 5),
                                  child: Text(raw_cars.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
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
                                      // enabled: false,
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: rawweight,
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
                                  child: Text("ระยะทาง",
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
                                      enabled: false,
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: raw_distance,
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
                                      right: 165, top: 20, bottom: 5),
                                  child: Text("ทะเบียนรถ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 165, top: 0, bottom: 5),
                                  child: Text(raw_car_codeid.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                SizedBox(
                                  height: 45,
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
