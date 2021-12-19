import 'dart:convert';
import 'package:greenhousegas/edit_waste_recycle.dart';
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
import 'edit_raw_materials.dart';

class editWasteMonth extends StatefulWidget {
  final list;
  final i;
  final x;
  editWasteMonth({this.list, this.i, this.x});
  @override
  _editWasteMonthState createState() => _editWasteMonthState();
}

class _editWasteMonthState extends State<editWasteMonth> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String waste_day = null;
  String waste_month = null;
  String waste_year = null;
  String waste_id = null;
  String waste_car_codeid = null;
  String waste_cars = null;
  // String comid = null;
  List mon = [];
  List yea = [];
  String yeaSave = null;
  String monSave = null;
  TextEditingController waste_distance = TextEditingController();
  TextEditingController comid = TextEditingController();
  TextEditingController waste_name = TextEditingController();
  TextEditingController waste_weight = TextEditingController();

  @override
  void initState() {
    print(widget.list[widget.i]);
    jojo();
    getmonth();
    super.initState();
  }

  List a = List.empty();
  String id = "";
  void jojo() async {
    comid = TextEditingController(text: widget.list[widget.i]['company_id']);
    // waste_id = widget.list[widget.i]['raw_id'];
    // waste_day = widget.list[widget.i]['raw_date'];
    // waste_month = widget.list[widget.i]['waste_month'];
    // waste_year = widget.list[widget.i]['waste_year'];
    // waste_cars = widget.list[widget.i]['waste_cars'];
    // waste_car_codeid = widget.list[widget.i]['waste_car_codeid'];
    // waste_distance =
    //     TextEditingController(text: widget.list[widget.i]['waste_distance']);
    // waste_name = TextEditingController(text: widget.list[widget.i]['raw_name']);
    // waste_weight =
    //     TextEditingController(text: widget.list[widget.i]['raw_weight']);
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

  Future uploaddata() async {
    // print(comid.text);
    // print(monSave);
    // print(yeaSave);
    final idcom = comid.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => editWaste(monSave, yeaSave, idcom)));
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
                    child: Text("เลือกเดือนที่ต้องการ ",
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
                    height: 300,
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
                                      right: 150, top: 10, bottom: 5),
                                  child: Text("เลือก เดือน/ปี",
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
                                  height: 45,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (monSave == null) {
                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.danger,
                                            title: "กรุณาเลือกเดือน",
                                          ));
                                    } else if (yeaSave == null) {
                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.danger,
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
