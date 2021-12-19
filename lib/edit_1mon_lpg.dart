import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenhousegas/edit_lpgform.dart';
import 'package:greenhousegas/edit_raw_form.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './/ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import './/staple.dart';

import 'edit_lpg_selectMonth.dart';

class editLPG extends StatefulWidget {
  String monSave;
  String yeaSave;
  String idcom;
  editLPG(String monSave, yaerSave, idcom) {
    this.monSave = monSave;
    this.yeaSave = yeaSave;
    this.idcom = idcom;
    print('เดือน' + monSave + "ปี" + yaerSave + "บริษัท" + idcom);
  }

  @override
  _editLPGState createState() => _editLPGState(monSave, yeaSave, idcom);
}

class _editLPGState extends State<editLPG> {
  String monSave;
  String yeaSave;
  String idcom;
  _editLPGState(String monSave, yaerSave, idcom) {
    this.monSave = monSave;
    this.yeaSave = yeaSave;
    this.idcom = idcom;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List company = [];
  List companyname = [];
  List car = [];
  List carname = [];
  List dataLPGloop = [];
  String selectedValue = null;
  String caValue = null;
  TextEditingController lpg_name = TextEditingController();
  TextEditingController company_name = TextEditingController();
  TextEditingController lpg_weight = TextEditingController();

  @override
  void initState() {
    getsubname();
    getcar();
    // print(widget.list[widget.i]);
    // jojo();
    getDataLPGforEdit();
    super.initState();
  }

  // List a = List.empty();
  // String id = "";
  // void jojo() async {
  //   selectedValue = widget.list[widget.i]['lpg_company_origin'];
  //   caValue = widget.list[widget.i]['lpg_cars'];
  //   lpg_name = TextEditingController(text: widget.list[widget.i]['lpg_name']);
  //   company_name =
  //       TextEditingController(text: widget.list[widget.i]['company_name']);
  //   lpg_weight =
  //       TextEditingController(text: widget.list[widget.i]['lpg_weight']);
  // }

  Future<List> getDataLPGforEdit() async {
    // var now = DateTime.now();
    // var current_mon = now.month;
    // print(monSave);
    // final current_mon = "6";
    final comid = idcom;
    //print(comid);
    final response = await http.get(Uri.parse(
        "http://$ipcon/greenhousegas/select_lpg_foredit.php?comid=${comid}&month=${monSave}"));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // setState(() {
      dataLPGloop = jsonData;
      // });
      //print(dataLPGloop);
      return dataLPGloop;
    }
  }

  // Future edit() async {
  //   final uri =
  //       Uri.parse("http://${ipcon}/greenhousegas/edit_lpg_materials.php");
  //   var request = http.MultipartRequest('POST', uri);
  //   request.fields['company_id'] = selectedValue;
  //   request.fields['car_id'] = caValue;
  //   request.fields['lpg_name'] = lpg_name.text;
  //   request.fields['lpg_weight'] = lpg_weight.text;
  //   request.fields['lpg_id'] = widget.list[widget.i]['lpg_id'];

  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => staple()));
  //     ArtSweetAlert.show(
  //         context: context,
  //         artDialogArgs: ArtDialogArgs(
  //           type: ArtSweetAlertType.success,
  //           title: "แก้ไขข้อมูลสำเร็จ",
  //         ));
  //   } else {
  //     ArtSweetAlert.show(
  //         context: context,
  //         artDialogArgs: ArtDialogArgs(
  //           type: ArtSweetAlertType.danger,
  //           title: "แก้ไขมูลไม่สำเร็จ",
  //         ));
  //     print(response.statusCode);
  //   }
  // }

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
                    child: Text("แก้ไขข้อมูลการใช้ LPG" + company_name.text,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 600,
                    width: 390,
                    child: new FutureBuilder<List>(
                      future: getDataLPGforEdit(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);

                        return snapshot.hasData
                            ? new Itemlist(
                                lpgdata: snapshot.data,
                                datacom: company_name.text)
                            : new Center(
                                child: new CircularProgressIndicator(),
                              );
                      },
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

class Itemlist extends StatefulWidget {
  final lpgdata;
  final datacom;
  Itemlist({this.lpgdata, this.datacom});

  @override
  _ItemlistState createState() => _ItemlistState();
}

class _ItemlistState extends State<Itemlist> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widget.lpgdata == null ? 0 : widget.lpgdata.length,
        itemBuilder: (context, i) {
          // print("ffff");
          return Container(
            height: 80,
            child: Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 5),
              child: Card(
                child: ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => addmeterials(
                    //               list: widget.lpgdata,
                    //               i: i,
                    //             )));
                  },
                  title: Text(
                      widget.lpgdata[i]['lpg_day'] +
                          '/' +
                          widget.lpgdata[i]['lpg_month'] +
                          '/' +
                          widget.lpgdata[i]['lpg_year'] +
                          ' ทะเบียนรถ ' +
                          widget.lpgdata[i]['lpg_car_codeid'] +
                          ' น้ำหนัก ' +
                          widget.lpgdata[i]['lpg_weight'],
                      style: GoogleFonts.prompt(
                          fontSize: 16, color: Colors.black)),
                  trailing: Wrap(
                    children: [
                      // IconButton(
                      //   color: Colors.black,
                      //   icon: Icon(Icons.remove_red_eye),
                      //   onPressed: () {
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) => viewmeterials(
                      //     //               list: widget.dataLPGloop,
                      //     //               i: i,
                      //     //             )));
                      //   },
                      // ),
                      // utype == "2"
                      //     ?
                      IconButton(
                        color: Colors.orange,
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editLPGform(
                                        list: widget.lpgdata,
                                        i: i,
                                      )));
                        },
                      ),
                      //     : IconButton(
                      //         color: Colors.orange,
                      //         icon: Icon(Icons.edit),
                      //         onPressed: () {},
                      //       ),
                      // utype == "2"
                      //     ?
                      // IconButton(
                      //   color: Colors.red,
                      //   icon: Icon(Icons.delete),
                      //   onPressed: () {
                      //     confirm(context, widget.list[i]['lpg_id'],
                      //         widget.list[i]['lpg_name']);
                      //   },
                      // )
                      // : IconButton(
                      //     color: Colors.red,
                      //     icon: Icon(Icons.delete),
                      //     onPressed: () {},
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
