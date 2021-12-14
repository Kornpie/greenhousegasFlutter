import 'package:flutter/material.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'ipcon.dart';
import 'constans.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  void register() async {
    final uri = Uri.parse("http://$ipcon/buildinginspec/insert_user.php");
    var request = http.MultipartRequest('POST', uri);

    request.fields['fullname'] = fullname.text;
    request.fields['email'] = email.text;
    request.fields['phone'] = phone.text;
    request.fields['password'] = password.text;
    request.fields['typeuser_id'] = "2";

    var response = await request.send();
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginApp()));
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "สมัครสมาชิกเรียบร้อยค่ะ",
          ));
    } else {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "สมัครสมาชิกไม่สำเร็จ",
          ));
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myconstans.dark,
        centerTitle: true,
        title: Text("Create Account"),
      ),
      body: Container(
        color: myconstans.primary,
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              width: 180,
              child: Image.asset("assets/images/register.png"),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, bottom: 10),
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                validator: RequiredValidator(
                                    errorText: 'กรุณากรอกให้ถูกต้อง'),
                                controller: fullname,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'ชื่อ-นามสกุล',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                validator: EmailValidator(
                                    errorText: 'กรุณากรอกให้ถูกต้อง'),
                                controller: email,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'อีเมล',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                validator: RequiredValidator(
                                    errorText: 'กรุณากรอกให้ถูกต้อง'),
                                controller: phone,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'เบอร์โทรศัพท์',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                validator: RequiredValidator(
                                    errorText: 'กรุณากรอกให้ถูกต้อง'),
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'รหัสผ่าน',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (fullname.text == "" && email.text == "" && phone.text == "" && password.text == "") {
                                  ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.warning,
                                      title: "กรุณากรอกข้อมูลของท่าน",
                                    ));
                              } else if (fullname.text == "") {
                                 ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.warning,
                                      title: "กรุณากรอก ชื่อ-นามสกุลของท่าน",
                                    ));
                              } else if (email.text == "") {
                                 ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.warning,
                                      title: "กรุณากรอกอีเมลของท่าน",
                                    ));
                              } else if (phone.text == "") {
                                 ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.warning,
                                      title: "กรุณากรอกเบอร์โทรศัพท์ของท่าน",
                                    ));
                              } else if (password.text == "") {
                                  ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.warning,
                                      title: "กรุณากรอกรหัสผ่านของท่าน",
                                    ));
                              } else {
                                register();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 150,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.black, Colors.black]),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text("สมัครสมาชิก",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
