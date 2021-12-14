import 'dart:convert';
import 'package:greenhousegas/staple.dart';
import 'package:greenhousegas/view_table_use_elec.dart';
import 'package:greenhousegas/view_use_energy.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'view_table_raw_materials.dart';

class viewUseElec extends StatefulWidget {
  final list;
  final dataMonth;
  final i;
  final x;
  viewUseElec({this.list, this.i, this.x, this.dataMonth});
  @override
  _viewUseElecState createState() => _viewUseElecState();
}

class _viewUseElecState extends State<viewUseElec> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List mon = [];
  List yea = [];

  String caValue = null;
  // TextEditingController mon_Start = TextEditingController();
  //   TextEditingController mon_Start = TextEditingController();
  String mon_Start = null;
  String mon_End = null;
  String yaerSave = null;

  @override
  Future uploaddata() async {
    final sum = int.parse(mon_End) - int.parse(mon_Start);
    print(sum);

    if (sum >= 2) {
      // Navigator.pushNamed(context, '/viewTable', arguments: mon_End);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  viewUseElecTable(mon_Start, mon_End, yaerSave)));
    } else {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "เลือกมากกว่า 3 เดือนขึ้นไป",
          ));
    }
    // final uri =

    //     Uri.parse("http://${ipcon}/greenhousegas/insert_raw_materials.php");
    // var request = http.MultipartRequest('POST', uri);
    // request.fields['company_id'] = selectedValue;
    // request.fields['car_id'] = caValue;
    // request.fields['rawname'] = rawname.text;
    // request.fields['rawweight'] = rawweight.text;

    // var response = await request.send();
    // if (response.statusCode == 200) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => staple()));
    //   ArtSweetAlert.show(
    //       context: context,
    //       artDialogArgs: ArtDialogArgs(
    //         type: ArtSweetAlertType.,
    //         title: "เพิ่มข้อมูลสำเร็จ",
    //       ));
    // } else {
    //   ArtSweetAlert.show(
    //       context: context,
    //       artDialogArgs: ArtDialogArgs(
    //         type: ArtSweetAlertType.danger,
    //         title: "เพิ่มข้อมูลไม่สำเร็จ",
    //       ));
    //   print(response.statusCode);
    // }
  }

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
                    child: Text("ข้อมูลการใช้พลังงาน",
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
                    height: 520,
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
                                      right: 0, top: 15, bottom: 5),
                                  child: Text("การใช้ ไฟฟ้า",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
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
                                //       controller: rawname,
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
                                  child: Text("เดือนเริ่มต้น",
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
                                        "-----เดือนเริ่มต้น-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: mon_Start,
                                    items: mon2,
                                    onChanged: (e) {
                                      setState(() {
                                        mon_Start = e.toString();
                                      });
                                      print(mon_Start);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 165, top: 20, bottom: 5),
                                  child: Text("เดือนสิ้นสุด",
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
                                        "-----เดือนสิ้นสุด-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: mon_End,
                                    items: mon2,
                                    onChanged: (e) {
                                      setState(() {
                                        mon_End = e.toString();
                                      });
                                      print(mon_End);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 180, top: 20, bottom: 5),
                                  child: Text("เลือกปี",
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
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       right: 190, top: 15, bottom: 5),
                                //   child: Text("นํ้าหนัก",
                                //       style: TextStyle(
                                //           fontSize: 16,
                                //           color: Colors.grey[700])),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //     left: 40,
                                //     right: 40,
                                //     bottom: 10,
                                //   ),
                                //   child: Container(
                                //     height: 20,
                                //     child: TextFormField(
                                //       validator: RequiredValidator(
                                //           errorText: 'กรุณากรอกให้ถูกต้อง'),
                                //       controller: rawweight,
                                //       decoration: InputDecoration(
                                //         contentPadding: EdgeInsets.all(10),
                                //         filled: true,
                                //         fillColor: Colors.white,
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                        gradient: LinearGradient(
                                            colors: [Colors.blue, Colors.blue]),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("แสดงห์ข้อมูล",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
                                    child: Text("วิเคราะห์ข้อมูล",
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
