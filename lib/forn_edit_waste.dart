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

class editwasteForm extends StatefulWidget {
  final list;
  final i;
  final x;
  editwasteForm({this.list, this.i, this.x});
  @override
  _editwasteFormState createState() => _editwasteFormState();
}

class _editwasteFormState extends State<editwasteForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String waste_day = null;
  String waste_month = null;
  String waste_year = null;
  String waste_id = null;
  String waste_car_codeid = null;
  String waste_cars = null;
  TextEditingController waste_distance = TextEditingController();
  TextEditingController waste_name = TextEditingController();
  TextEditingController waste_weight = TextEditingController();

  @override
  void initState() {
    print(widget.list[widget.i]);
    jojo();
    super.initState();
  }

  List a = List.empty();
  String id = "";
  void jojo() async {
    waste_id = widget.list[widget.i]['waste_id'];
    waste_day = widget.list[widget.i]['waste_day'];
    waste_month = widget.list[widget.i]['waste_month'];
    waste_year = widget.list[widget.i]['waste_year'];
    waste_cars = widget.list[widget.i]['waste_cars'];
    waste_car_codeid = widget.list[widget.i]['waste_car_codeid'];
    waste_distance =
        TextEditingController(text: widget.list[widget.i]['waste_distance']);
    waste_name =
        TextEditingController(text: widget.list[widget.i]['waste_name']);
    waste_weight =
        TextEditingController(text: widget.list[widget.i]['waste_weight']);
  }

  Future uploaddata() async {
    final data_waste_eq = double.parse(waste_weight.text) * 1.5;
    print(data_waste_eq);

    final uri = Uri.parse("http://${ipcon}/greenhousegas/edit_waste.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['waste_eq'] = data_waste_eq.toString();
    request.fields['waste_weight'] = waste_weight.text;
    request.fields['waste_id'] = waste_id.toString();

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
                    child: Text("แก้ไขของเสียรีไซเคิล ",
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
                                          waste_day +
                                          '/' +
                                          waste_month +
                                          '/' +
                                          waste_year,
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
                                      controller: waste_name,
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
                                  child: Text(waste_cars.toString(),
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
                                      controller: waste_weight,
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
                                      right: 165, top: 20, bottom: 5),
                                  child: Text("ทะเบียนรถ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 165, top: 0, bottom: 5),
                                  child: Text(waste_car_codeid.toString(),
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
            Padding(
              padding:
                  const EdgeInsets.only(left: 150, right: 0, top: 0, bottom: 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return show_waste_recycle();
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
