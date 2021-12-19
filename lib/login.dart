import 'dart:convert';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'constans.dart';
import 'home.dart';
import 'data.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'ipcon.dart';

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Login() async {
    var url = 'http://$ipcon/greenhousegas/login.php';
    var response = await http.post(Uri.parse(url),
        body: {'email': email.text, 'password': password.text});
    var data = json.decode(response.body);
    if (data != 'Error') {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('user_id', data[0]['user_id']);
      preferences.setString('user_fullname', data[0]['user_fullname']);
      preferences.setString('user_type', data[0]['user_type']);
      print(data[0]['user_fullname']);
      if (data[0]['user_status'] == '0') {
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.warning,
              title: "ไม่สามารถใช้งานบัญชีนี้ได้",
            ));
      } else {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddData(),
            ),
          );
        });
      }
    } else if (email.text == "" && password.text == "") {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.warning,
            title: "กรุณากรอกอีเมลและรหัสผ่านของท่าน",
          ));
    } else {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "Email หรือ Password ของท่านผิดค่ะ",
          ));
    }
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
                    height: 70,
                  ),
                  Container(
                    child: Text("   เข้าสู่ระบบ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Container(
                    child: Text("    ____________",
                        style: TextStyle(fontSize: 26, color: Colors.white)),
                  ),
                  Container(
                    height: 30,
                    child: Text("   Login",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 300,
                    width: 320,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white, // background
                        borderRadius: BorderRadius.circular(40)),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 30, bottom: 20),
                              child: TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: 'อีเมล',
                                  prefixIcon:
                                      Icon(Icons.account_circle_rounded),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 10, bottom: 10),
                              child: TextFormField(
                                controller: password,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[100],
                                  hintText: 'รหัสผ่าน',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              height: 50,
                              width: 150,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                color: Colors.blue[700], // background
                                onPressed: () {
                                  Login();
                                },
                                child: Text("เข้าสู่ระบบ",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ),
                            ),
                          ],
                        )),
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
