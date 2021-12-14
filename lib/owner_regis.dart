import 'package:flutter/material.dart';
import 'constans.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:art_sweetalert/art_sweetalert.dart';
import 'login.dart';
import 'ipcon.dart';



class ownerregis extends StatefulWidget {
  @override
  _ownerregisState createState() => _ownerregisState();
}

class _ownerregisState extends State<ownerregis> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController taxpayer = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  void ownerregis() async {
    final uri = Uri.parse("http://$ipcon/greenhousegas/insert_user.php");
    var request = http.MultipartRequest('POST', uri);

    request.fields['fullname'] = fullname.text;
    request.fields['companyname'] = companyname.text;
    request.fields['email'] = email.text;
    request.fields['taxpayer'] = taxpayer.text;
    request.fields['phone'] = phone.text;
    request.fields['password'] = password.text;
    request.fields['user_type'] = '4';

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
                    child: Text("ลงทะเบียน",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Container(
                    child: Text("____________",
                        style: TextStyle(fontSize: 26, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text("REGISTER",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 390,
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
                                  height: 7,
                                ),
                                Container(
                                  child: Text("Owner",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, bottom: 10, top: 30),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: fullname,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'ชื่อ-นามสกุล',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, bottom: 10, top: 20),
                                  child: Container(
                                    height: 20,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: companyname,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'ชื่อบริษัท',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, bottom: 10, top: 20),
                                  child: Container(
                                    height: 20,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: email,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'อีเมล',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, bottom: 10, top: 20),
                                  child: Container(
                                    height: 25,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: taxpayer,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'ทะเบียนผู้เสียภาษี',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, bottom: 10, top: 20),
                                  child: Container(
                                    height: 20,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: phone,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'เบอร์โทรศัพท์',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, bottom: 10, top: 20),
                                  child: Container(
                                    height: 20,
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText: 'กรุณากรอกให้ถูกต้อง'),
                                      controller: password,
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'รหัสผ่าน',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (fullname.text == "" &&
                          companyname.text == "" &&
                          email.text == "" &&
                          taxpayer.text == "" &&
                          phone.text == "" &&
                          password.text == "") {
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
                      } else if (companyname.text == "") {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.warning,
                              title: "กรุณากรอกชื่อบริษัทของท่าน",
                            ));
                      } else if (email.text == "") {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.warning,
                              title: "กรุณากรอกอีเมลของท่าน",
                            ));
                      } else if (taxpayer.text == "") {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.warning,
                              title: "กรุณากรอกทะเบียนผู้เสียภาษีของท่าน",
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
                        ownerregis();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue[600], Colors.blue[600]]),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text("SING UP",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
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
