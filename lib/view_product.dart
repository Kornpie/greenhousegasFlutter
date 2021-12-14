import 'dart:convert';
import 'package:greenhousegas/show_product.dart';
import 'package:greenhousegas/show_product_chart.dart';
import 'package:greenhousegas/staple.dart';
import 'package:greenhousegas/view_table_product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'view_table_raw_materials.dart';

class viewproduct extends StatefulWidget {
  final list;
  final dataMonth;
  final i;
  final x;
  viewproduct({this.list, this.i, this.x, this.dataMonth});
  @override
  _viewproductState createState() => _viewproductState();
}

class _viewproductState extends State<viewproduct> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List company = [];
  List companyname = [];
  List car = [];
  List carname = [];
  List mon = [];
  List yea = [];
  String selectedValue = null;
  String caValue = null;
  // TextEditingController mon_Start = TextEditingController();
  //   TextEditingController mon_Start = TextEditingController();
  String mon_Start = null;
  String mon_End = null;
  String yearSave = null;
  TextEditingController productname = TextEditingController();
  TextEditingController productweight = TextEditingController();

  @override
  void initState() {
    getsubname();
    getcar();
    getmonth();
    print(widget.list[widget.i]);
    jojo();
    super.initState();
  }

  List a = List.empty();
  String id = "";
  void jojo() async {
    selectedValue = widget.list[widget.i]['product_company_origin'];
    caValue = widget.list[widget.i]['product_cars'];
    productname =
        TextEditingController(text: widget.list[widget.i]['product_name']);
    productweight =
        TextEditingController(text: widget.list[widget.i]['product_weight']);
  }

  Future uploaddata() async {
    final sum = int.parse(mon_End) - int.parse(mon_Start);
    print(sum);

    if (sum >= 2) {
      // Navigator.pushNamed(context, '/viewtableproduct', arguments: mon_End);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => viewtableproduct(
                  mon_Start, mon_End, yearSave, selectedValue)));
    } else {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "เลือกมากกว่า 3 เดือนขึ้นไป",
          ));
    }
  }

  Future gochart() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                productChartRaw(mon_Start, mon_End, yearSave, selectedValue)));
  }

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
                    child: Text("เพิ่มข้อมูลสินค้า",
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
                    height: 600,
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
                                  child: Text("ชื่อบริษัทต้นทาง",
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
                                        "-----เลือกบริษัท-----",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    value: selectedValue,
                                    items: companyname2,
                                    // onChanged: (v) {
                                    //   setState(() {
                                    //     selectedValue = v.toString();
                                    //   });
                                    //   print(selectedValue);
                                    // },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0, top: 15, bottom: 5),
                                  child: Text("ชื่อสินค้า " + 'PET CHIP',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700])),
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
                                //       controller: productname,
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
                                    value: yearSave,
                                    items: yea,
                                    onChanged: (v) {
                                      setState(() {
                                        yearSave = v.toString();
                                      });
                                      print(yearSave);
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
                                //       controller: productweight,
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
                                    gochart();
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
