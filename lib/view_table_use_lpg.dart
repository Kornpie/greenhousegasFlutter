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

class UseLPGDataTable extends StatefulWidget {
  // final list;
  // final i;
  // final x;
  String mon_Start;
  String mon_End;
  String yaerSave;
  String selectedValue;
  UseLPGDataTable(String mon_Start, mon_End, yaerSave, selectedValue) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yaerSave = yaerSave;
    this.selectedValue = selectedValue;
    print(mon_Start + mon_End + "dd" + selectedValue + yaerSave);
  }

  @override
  // State<StatefulWidget> createState() {
  //   return _UseLPGDataTableState(mon_Start);
  // }
  _UseLPGDataTableState createState() =>
      _UseLPGDataTableState(mon_Start, mon_End, selectedValue, yaerSave);
}

class _UseLPGDataTableState extends State<UseLPGDataTable> {
  String mon_Start;
  String mon_End;
  String selectedValue;
  String yaerSave;
  _UseLPGDataTableState(String mon_Start, mon_End, selectedValue, yaerSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.selectedValue = selectedValue;
    this.yaerSave = yaerSave;
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
    print(selectedValue + 'data');
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_eg_lpg_table.php?lpg_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}&comid=${selectedValue}'));
    //print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        dataTable = json.decode(response.body);
      });
    }
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
                        "แสดงตารางข้อมูล LPG" +
                            ' ' +
                            mon_Start +
                            ' ' +
                            mon_End +
                            ' ' +
                            yaerSave,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 1200,
                    width: 400,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white, // background
                      // borderRadius: BorderRadius.circular(40)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Table(
                          // border: TableBorder.all(color: Colors.black),
                          columnWidths: {
                            0: FlexColumnWidth(0.8),
                            1: FlexColumnWidth(0.8),
                            2: FlexColumnWidth(0.8),
                            3: FlexColumnWidth(0.8),
                            4: FlexColumnWidth(1),
                            5: FlexColumnWidth(0.6),
                          },
                          children: [
                            TableRow(
                              children: <Widget>[
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Container(
                                    width: 20,
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 5, right: 0, top: 5),
                                    height: 60,
                                    color: Colors.white,
                                    child: Text("Month",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 5, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("Weight",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 0, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("WeightEQ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 0, bottom: 5, right: 5, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("Distance",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 0, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("DistanceEQ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 0, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("Total",
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
                                      right: 0, top: 20, bottom: 20, left: 20),
                                  child: Text(item['lpg_month'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 20, bottom: 20, left: 10),
                                  child: Text(item['sumweight'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 20, bottom: 20, left: 10),
                                  child: Text(item['sumweight_eq'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 20, bottom: 20, left: 10),
                                  child: Text(item['sum_dis'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 20, bottom: 20, left: 10),
                                  child: Text(item['sum_diseq'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 20, bottom: 20, left: 0),
                                  child: Text(item['sum_total'],
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
