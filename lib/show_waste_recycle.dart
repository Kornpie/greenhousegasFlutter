import 'package:flutter/material.dart';
import 'package:greenhousegas/add_waste_recycle.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/edit_waste_recycle.dart';
import 'package:greenhousegas/edit_waste_selectMonth.dart';
import 'package:greenhousegas/recycle_a_data.dart';
import 'package:greenhousegas/view_waste_recycle.dart';
import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'insert_recycle.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'edit_recyc.dart';
import 'view_recyc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class show_waste_recycle extends StatefulWidget {
  @override
  showwasterecycleState createState() => showwasterecycleState();
}

class showwasterecycleState extends State<show_waste_recycle> {
  Future<List> getdata() async {
    final response = await http
        .get(Uri.parse("http://$ipcon/greenhousegas/show_recycle.php"));
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
    print('ชื่อหน้า recyc' + username);
    print('ประเภท recyc' + utype);
  }

  @override
  void initState() {
    //initsete คือทำงานตอนเข้าหน้านั้นๆ ในหน้านี้เราใช้เรีกหาข้อมูลของ user
    getdata();
    print(getdata());
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
                          style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  Container(
                    child: Text("ข้อมูลของเสียรีไซเคิล",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 800,
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
  void deleteData(String waste_id) {
    var url = Uri.parse("http://$ipcon/greenhousegas/delete_recyc.php");
    http.post(url, body: {'id': waste_id});
  }

  void confirm(context, String waste_id, waste_name) async {
    ArtDialogResponse response = await ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
            denyButtonText: "ยกเลิก",
            title: "คุณแน่ใจว่าต้องการลบ?",
            text: "ของเสีย : ${waste_name}",
            confirmButtonText: "ยืนยัน",
            type: ArtSweetAlertType.warning));

    if (response == null) {
      return;
    }

    if (response.isTapConfirmButton) {
      setState(() {
        deleteData(waste_id);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => show_waste_recycle()));
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
    print('ชื่อหน้า recyc' + username);
    print('ประเภท recyc' + utype);
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
                              builder: (context) => addWaste(
                                    list: widget.list,
                                    i: i,
                                  )))
                      : null;
                },
                title: Text('WASTE PET FILM ' + widget.list[i]['company_name'],
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                trailing: Wrap(
                  children: [
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => viewRecycle(
                                      list: widget.list,
                                      i: i,
                                    )));
                      },
                    ),
                    utype == "2"
                        ? IconButton(
                            color: Colors.orange,
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => editWasteMonth(
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
      },
    );
  }
}
