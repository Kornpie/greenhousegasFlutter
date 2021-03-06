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

class viewtableproduct extends StatefulWidget {
  // final list;
  // final i;
  // final x;
  String mon_Start;
  String mon_End;
  String yearSave;
  String selectedValue;
  viewtableproduct(String mon_Start, mon_End, yearSave, selectedValue) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yearSave = yearSave;
    this.selectedValue = selectedValue;
    print(mon_Start + mon_End + "dd" + selectedValue + yearSave);
  }

  @override
  // State<StatefulWidget> createState() {
  //   return _viewtableproductState(mon_Start);
  // }
  _viewtableproductState createState() =>
      _viewtableproductState(mon_Start, mon_End, selectedValue, yearSave);
}

class _viewtableproductState extends State<viewtableproduct> {
  String mon_Start;
  String mon_End;
  String selectedValue;
  String yearSave;
  _viewtableproductState(String mon_Start, mon_End, selectedValue, yearSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.selectedValue = selectedValue;
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
    print(selectedValue + 'data');
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_product_table.php?product_year=${yearSave}&mon_Start=${mon_Start}&mon_End=${mon_End}&comid=${selectedValue}'));
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
                        "???????????????????????????????????????????????????????????????"
                        //+
                        // mon_Start +
                        // ' ' +
                        // mon_End +
                        // ' ' +
                        // yearSave
                        ,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 1000,
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
                                    width: 20,
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 5, right: 0, top: 5),
                                    height: 60,
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
                                      left: 10, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("?????????????????????",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 5, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("?????????????????????EQ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10, bottom: 5, right: 5, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("?????????????????????",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10, bottom: 5, right: 0, top: 5),
                                  height: 50,
                                  color: Colors.white,
                                  child: Text("?????????????????????EQ",
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
                                  child: Text("???????????????",
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
                                  child: Text(item['product_month'],
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
                                      right: 0, top: 20, bottom: 20, left: 10),
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