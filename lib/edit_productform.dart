import 'dart:convert';
import 'package:greenhousegas/show_product.dart';
import 'package:greenhousegas/staple.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class editproductForm extends StatefulWidget {
  final list;
  final i;
  final x;
  editproductForm({this.list, this.i, this.x});
  @override
  _editproductFormState createState() => _editproductFormState();
}

class _editproductFormState extends State<editproductForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List factors = [];
  String product_day = null;
  String product_month = null;
  String product_year = null;
  String product_id = null;
  String product_car_codeid = null;
  String product_cars = null;
  TextEditingController product_distance = TextEditingController();
  TextEditingController product_name = TextEditingController();
  TextEditingController product_weight = TextEditingController();

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
    product_id = widget.list[widget.i]['product_id'];
    product_day = widget.list[widget.i]['product_day'];
    product_month = widget.list[widget.i]['product_month'];
    product_year = widget.list[widget.i]['product_year'];
    product_cars = widget.list[widget.i]['product_cars'];
    product_car_codeid = widget.list[widget.i]['product_car_codeid'];
    product_distance =
        TextEditingController(text: widget.list[widget.i]['product_distance']);
    product_name =
        TextEditingController(text: widget.list[widget.i]['product_name']);
    product_weight =
        TextEditingController(text: widget.list[widget.i]['product_weight']);
  }

  Future uploaddata() async {
    final data_product_eq = double.parse(product_weight.text) *
        double.parse(factors[0]['factor_value']);
    print(data_product_eq);

    final uri = Uri.parse("http://${ipcon}/greenhousegas/edit_product.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['product_eq'] = data_product_eq.toString();
    request.fields['product_weight'] = product_weight.text;
    request.fields['product_id'] = product_id.toString();

    var response = await request.send();
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => showproduct()));
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
        "http://${ipcon}/greenhousegas/getfactors.php?nameFac=ProductEq"));
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
                                          product_day +
                                          '/' +
                                          product_month +
                                          '/' +
                                          product_year,
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
                                      controller: product_name,
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
                                  child: Text(product_cars.toString(),
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
                                      controller: product_weight,
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
                                      controller: product_distance,
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
                                  child: Text(product_car_codeid.toString(),
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
                      return showproduct();
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
