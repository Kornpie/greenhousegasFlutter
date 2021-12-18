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

class UseNGDataTable extends StatefulWidget {
  // final list;
  // final i;
  // final x;
  String mon_Start;
  String mon_End;
  String yaerSave;

  UseNGDataTable(String mon_Start, mon_End, yaerSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yaerSave = yaerSave;

    print(mon_Start + mon_End + "dd" + yaerSave);
  }

  @override
  // State<StatefulWidget> createState() {
  //   return _UseNGDataTableState(mon_Start);
  // }
  _UseNGDataTableState createState() =>
      _UseNGDataTableState(mon_Start, mon_End, yaerSave);
}

class _UseNGDataTableState extends State<UseNGDataTable> {
  String mon_Start;
  String mon_End;

  String yaerSave;
  _UseNGDataTableState(String mon_Start, mon_End, yaerSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;

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
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_eg_ng_table.php?eg_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
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
                        "การใช้ NG" +
                            mon_Start +
                            "-" +
                            mon_End +
                            " " +
                            yaerSave,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   // width: MediaQuery.of(context).size.width,
                  //   height: 1000,
                  //   width: 320,
                  //   padding: EdgeInsets.symmetric(vertical: 20),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white, // background
                  //       borderRadius: BorderRadius.circular(40)),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       Container(
                  //         height: 450,
                  //         width: 390,
                  //         child: new FutureBuilder<List>(
                  //           future: getDataToTable(),
                  //           builder: (context, snapshot) {
                  //             if (snapshot.hasError) print(snapshot.error);

                  //             return Container(
                  //               child: ListView.builder(
                  //                   itemCount: dataTable.length,
                  //                   scrollDirection: Axis.horizontal,
                  //                   itemBuilder: (BuildContext context, i) {
                  //                     return Table(
                  //                       border: TableBorder.all(
                  //                           color: Colors.black),
                  //                       columnWidths: {
                  //                         0: FlexColumnWidth(),
                  //                         1: FlexColumnWidth(),
                  //                       },
                  //                       children: [
                  //                         TableRow(
                  //                           children: <Widget>[
                  //                             TableCell(
                  //                               verticalAlignment:
                  //                                   TableCellVerticalAlignment
                  //                                       .middle,
                  //                               child: Container(
                  //                                 height: 64,
                  //                                 color: Colors.white,
                  //                                 child: Text(
                  //                                     "  ข้อมูลที่นำมา\n      คำนวณ",
                  //                                     style: TextStyle(
                  //                                         fontSize: 14,
                  //                                         color: Colors.black,
                  //                                         fontWeight:
                  //                                             FontWeight.bold)),
                  //                               ),
                  //                             ),
                  //                             Container(
                  //                               height: 64,
                  //                               color: Colors.white,
                  //                               child: Text(
                  //                                   " ค่าสัมประสิทธิ์ \n     Emission \n        Factor",
                  //                                   style: TextStyle(
                  //                                       fontSize: 14,
                  //                                       color: Colors.black,
                  //                                       fontWeight:
                  //                                           FontWeight.bold)),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                           for (var item in dataTable)
                  //                             TableRow(children: [
                  //                               Text(item['raw_month']),
                  //                               Text(item['raw_weight_eq']),
                  //                             ])
                  //                       ],
                  //                     );

                  //                     // Text('   ' +
                  //                     //     "เดือน" +
                  //                     //     dataTable[i]['raw_month'] +
                  //                     //     ' ');
                  //                   }),
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
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
                                    child: Text("เดือน",
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
                                  child: Text("ใช้NG",
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
                                  child: Text("ใช้NG EQ",
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
                                  child: Text(item['eg_month'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 0, bottom: 10, left: 20),
                                  child: Text(item['eg_unit'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 0, bottom: 10, left: 20),
                                  child: Text(item['eg_unit_eq'],
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
