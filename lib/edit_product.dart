import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenhousegas/edit_productform.dart';
import 'package:greenhousegas/forn_edit_waste.dart';
import 'package:greenhousegas/show_product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'ipcon.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'staple.dart';

class editproduct extends StatefulWidget {
  String monSave;
  String yeaSave;
  String idcom;
  editproduct(String monSave, yaerSave, idcom) {
    this.monSave = monSave;
    this.yeaSave = yeaSave;
    this.idcom = idcom;
    print('เดือน' + monSave + "ปี" + yaerSave + "บริษัท" + idcom);
  }

  @override
  _editproductState createState() => _editproductState(monSave, yeaSave, idcom);
}

class _editproductState extends State<editproduct> {
  String monSave;
  String yeaSave;
  String idcom;
  _editproductState(String monSave, yaerSave, idcom) {
    this.monSave = monSave;
    this.yeaSave = yeaSave;
    this.idcom = idcom;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List company = [];
  List companyname = [];
  List car = [];
  List carname = [];
  List dataProductloop = [];
  String selectedValue = null;
  String caValue = null;
  TextEditingController product_name = TextEditingController();
  TextEditingController company_name = TextEditingController();
  TextEditingController product_weight = TextEditingController();

  @override
  void initState() {
    getsubname();
    getcar();
    // print(widget.list[widget.i]);
    // jojo();
    getDataProductforEdit();
    super.initState();
  }

  // List a = List.empty();
  // String id = "";
  // void jojo() async {
  //   selectedValue = widget.list[widget.i]['raw_company_origin'];
  //   caValue = widget.list[widget.i]['raw_cars'];
  //   product_name = TextEditingController(text: widget.list[widget.i]['raw_name']);
  //   company_name =
  //       TextEditingController(text: widget.list[widget.i]['company_name']);
  //   product_weight =
  //       TextEditingController(text: widget.list[widget.i]['raw_weight']);
  // }

  Future<List> getDataProductforEdit() async {
    // var now = DateTime.now();
    // var current_mon = now.month;
    // print(monSave);
    // final current_mon = "6";
    final comid = "1";
    //print(comid);
    final response = await http.get(Uri.parse(
        "http://$ipcon/greenhousegas/selectproductforedit.php?comid=${comid}&month=${monSave}"));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // setState(() {
      dataProductloop = jsonData;
      // });
      //print(dataProductloop);
      return dataProductloop;
    }
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
                    child: Text("แก้ไขข้อมูลสินค้า" + company_name.text,
                        style: TextStyle(
                            fontSize: 20,
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
                      future: getDataProductforEdit(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);

                        return snapshot.hasData
                            ? new Itemlist(
                                productdata: snapshot.data,
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
  final productdata;
  final datacom;
  Itemlist({this.productdata, this.datacom});

  @override
  _ItemlistState createState() => _ItemlistState();
}

class _ItemlistState extends State<Itemlist> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widget.productdata == null ? 0 : widget.productdata.length,
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
                    //               list: widget.productdata,
                    //               i: i,
                    //             )));
                  },
                  title: Text(
                      widget.productdata[i]['product_day'] +
                          '/' +
                          widget.productdata[i]['product_month'] +
                          '/' +
                          widget.productdata[i]['product_year'] +
                          ' ทะเบียนรถ ' +
                          widget.productdata[i]['product_car_codeid'] +
                          ' น้ำหนัก ' +
                          widget.productdata[i]['product_weight'],
                      style: GoogleFonts.prompt(
                          fontSize: 16, color: Colors.black)),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        color: Colors.orange,
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editproductForm(
                                        list: widget.productdata,
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
                      //     confirm(context, widget.list[i]['raw_id'],
                      //         widget.list[i]['raw_name']);
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
