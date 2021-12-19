import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/show_carbon_fp.dart';
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
import 'add_raw_materials.dart';
import 'edit_raw_selectMonth.dart';

class staple extends StatefulWidget {
  @override
  _stapleState createState() => _stapleState();
}

class _stapleState extends State<staple> {
  Future<List> getdata() async {
    final response = await http
        .get(Uri.parse("http://$ipcon/greenhousegas/show_raw_materials.php"));
    return json.decode(response.body);
  }

  Future<List> getcom() async {
    final response = await http
        .get(Uri.parse("http://$ipcon/greenhousegas/get_company.php"));
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
                    child: Text("ข้อมูลวัตถุดิบ",
                        style: GoogleFonts.prompt(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // utype == "3"
                  //     ? GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(builder: (context) {
                  //               return addRaw();
                  //             }),
                  //           );
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           // width: MediaQuery.of(context).size.width,
                  //           height: 40,
                  //           width: 180,
                  //           decoration: BoxDecoration(
                  //               color: Colors.grey[300], // background
                  //               borderRadius: BorderRadius.circular(30)),

                  //           child: Text("เพิ่มข้อมูล",
                  //               style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.blue[500])),
                  //         ),
                  //       )
                  //     : GestureDetector(
                  //         onTap: () {},
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           // width: MediaQuery.of(context).size.width,
                  //           height: 40,
                  //           width: 180,
                  //           decoration: BoxDecoration(
                  //               color: Colors.grey[300], // background
                  //               borderRadius: BorderRadius.circular(30)),

                  //           child: Text("เพิ่มข้อมูล",
                  //               style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.blue[500])),
                  //         ),
                  //       ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450,
                    width: 390,
                    child: new FutureBuilder<List>(
                      future: getcom(),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 225, right: 0, bottom: 0),
                    child: Row(
                      children: [
                        GestureDetector(
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
  final list;
  Itemlist({this.list});
  @override
  _ItemlistState createState() => _ItemlistState();
}

class _ItemlistState extends State<Itemlist> {
  void deleteData(String raw_id) {
    var url = Uri.parse("http://$ipcon/greenhousegas/delete_raw_materials.php");
    http.post(url, body: {'id': raw_id});
  }

  void confirm(context, String raw_id, raw_name) async {
    ArtDialogResponse response = await ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
            denyButtonText: "ยกเลิก",
            title: "คุณแน่ใจว่าต้องการลบ?",
            text: "วัตถุดิบ : ${raw_name}",
            confirmButtonText: "ยืนยัน",
            type: ArtSweetAlertType.warning));

    if (response == null) {
      return;
    }
    if (response.isTapConfirmButton) {
      setState(() {
        deleteData(raw_id);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => staple()));
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
                    utype == "3"
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addmeterials(
                                      list: widget.list,
                                      i: i,
                                    )))
                        : null;
                  },
                  title: Text('PET CHIP ' + widget.list[i]['company_name'],
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
                                  builder: (context) => viewmeterials(
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
                                        builder: (context) => editRawMonth(
                                              list: widget.list,
                                              i: i,
                                            )));
                              },
                            )
                          : IconButton(
                              color: Colors.orange,
                              icon: Icon(
                                Icons.edit,
                                color: Colors.orange,
                              ),
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
