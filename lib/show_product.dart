import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/edit_product.dart';
import 'package:greenhousegas/edit_product_selectMonth.dart';
import 'package:greenhousegas/insert_product.dart';
import 'package:greenhousegas/view_product.dart';
import 'typeuser_regis.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'login.dart';
import 'insert_raw_materials.dart';
import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constans.dart';
import 'edit_raw_materials.dart';
import 'view_raw_materials.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class showproduct extends StatefulWidget {
  @override
  _showproductState createState() => _showproductState();
}

class _showproductState extends State<showproduct> {
  Future<List> getdata() async {
    final response = await http
        .get(Uri.parse("http://$ipcon/greenhousegas/show_product.php"));
    return json.decode(response.body);
  }

  String username = "";
  String utype = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('user_fullname');
      utype = preferences.getString('user_type');
    });
    print('ชื่อ' + username);
    print('ประเภท' + utype);
  }

  @override
  void initState() {
    //initsete คือทำงานตอนเข้าหน้านั้นๆ ในหน้านี้เราใช้เรีกหาข้อมูลของ user
    getEmail();
    super.initState();
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 250, right: 0, top: 0, bottom: 0),
                    child: Container(
                      child: Text(username,
                          style: GoogleFonts.prompt(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  Container(
                    child: Text("ข้อมูลสินค้า",
                        style: GoogleFonts.prompt(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  utype == "3"
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return addRaw();
                              }),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            // width: MediaQuery.of(context).size.width,
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.grey[300], // background
                                borderRadius: BorderRadius.circular(30)),

                            child: Text("เพิ่มข้อมูล",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[500])),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            // width: MediaQuery.of(context).size.width,
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.grey[300], // background
                                borderRadius: BorderRadius.circular(30)),

                            child: Text("เพิ่มข้อมูล",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[500])),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450,
                    width: 390,
                    child: new FutureBuilder<List>(
                      future: getdata(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);

                        return snapshot.hasData
                            ? new Itemlist(list: snapshot.data)
                            : new Center(
                                child: new CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
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
                      return AddData();
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

class Itemlist extends StatefulWidget {
  final list;
  Itemlist({this.list});
  @override
  _ItemlistState createState() => _ItemlistState();
}

class _ItemlistState extends State<Itemlist> {
  void deleteData(String product_id) {
    var url = Uri.parse("http://$ipcon/greenhousegas/delete_raw_materials.php");
    http.post(url, body: {'id': product_id});
  }

  void confirm(context, String product_id, product_name) async {
    ArtDialogResponse response = await ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
            denyButtonText: "ยกเลิก",
            title: "คุณแน่ใจว่าต้องการลบ?",
            text: "วัตถุดิบ : ${product_name}",
            confirmButtonText: "ยืนยัน",
            type: ArtSweetAlertType.warning));

    if (response == null) {
      return;
    }
    if (response.isTapConfirmButton) {
      setState(() {
        deleteData(product_id);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => showproduct()));
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.success,
              title: "ลบข้อมูลเรียบร้อย",
            ));
      });
    }
  }

  String username = "";
  String utype = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('user_fullname');
      utype = preferences.getString('user_type');
    });
    print('ชื่อ' + username);
    print('ประเภท' + utype);
  }

  @override
  void initState() {
    //initsete คือทำงานตอนเข้าหน้านั้นๆ ในหน้านี้เราใช้เรีกหาข้อมูลของ user
    getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, i) {
          // print("ffff");
          return Container(
            height: 80,
            child: Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 5),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => addproduct(
                                  list: widget.list,
                                  i: i,
                                )));
                  },
                  title: Text(
                      'ข้อมูลสินค้า:' +
                          '' +
                          widget.list[i]['product_company_origin'],
                      style: GoogleFonts.prompt(
                          fontSize: 16, color: Colors.black)),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => viewproduct(
                                        list: widget.list,
                                        i: i,
                                      )));
                        },
                      ),
                      utype == "2"
                          ? IconButton(
                              color: Colors.orange,
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => editProductMonth(
                                              list: widget.list,
                                              i: i,
                                            )));
                              },
                            )
                          : IconButton(
                              color: Colors.orange,
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
