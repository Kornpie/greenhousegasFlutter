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

class viewtablewater3 extends StatefulWidget {
  // final list;
  // final i;
  // final x;
  String mon_Start;
  String mon_End;
  String yearSave;

  viewtablewater3(String mon_Start, mon_End, yearSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yearSave = yearSave;

    print(mon_Start + mon_End + "dd" + yearSave);
  }

  @override
  // State<StatefulWidget> createState() {
  //   return _viewtablewater3State(mon_Start);
  // }
  _viewtablewater3State createState() =>
      _viewtablewater3State(mon_Start, mon_End, yearSave);
}

class _viewtablewater3State extends State<viewtablewater3> {
  String mon_Start;
  String mon_End;
  String yearSave;
  _viewtablewater3State(String mon_Start, mon_End, yearSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yearSave = yearSave;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // List company = [];
  // List companyname = [];
  // List car = [];
  // List carname = [];
  // List mon = [];
  List dataTable = [];

  @override
  void initState() {
    getDataToTable();
    //print(getDataToTable());
    // getcar();
    // jojo();
    super.initState();
  }

  Future<List> getDataToTable() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_water_table3.php?water_year=${yearSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    //print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        dataTable = json.decode(response.body);
      });
    }
    // String jsonsDataString = response.body
    //     .toString(); // toString of Response's body is assigned to jsonDataString
    // data = jsonDecode(jsonsDataString);
    // print(data.toString());
    print(dataTable);
    return dataTable;
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
                    height: 60,
                  ),
                  Container(
                    child: Text(
                        "  ??????????????????????????????????????????????????????????????????????????????????????? " +
                            '' +
                            '\n                     ' +
                            mon_Start +
                            '-' +
                            mon_End +
                            ' ' +
                            yearSave,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 1000,
                    width: 320,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white, // background
                      // borderRadius: BorderRadius.circular(40)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Table(
                          border: TableBorder(
                              verticalInside: BorderSide(
                                  width: 1,
                                  color: Colors.blue,
                                  style: BorderStyle.solid)),
                          // border: TableBorder.all(color: Colors.black),
                          columnWidths: {
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),
                          },
                          children: [
                            TableRow(
                              children: <Widget>[
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 20, bottom: 5, right: 0, top: 5),
                                    height: 64,
                                    color: Colors.white,
                                    child: Text("???????????????",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("??????????????????????????????????????????????????????",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("??????????????????????????????????????? EQ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            for (var item in dataTable)
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 0, bottom: 10, left: 20),
                                  child: Text(item['water_month'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 0, bottom: 10, left: 20),
                                  child: Text(
                                      item['water_cubic'] + ' ' + '??????.???',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 0, bottom: 10, left: 20),
                                  child: Text(
                                      item['water_cubic_eq'] + ' ' + '??????.???.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                              ])
                          ],
                        )
                      ],
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
