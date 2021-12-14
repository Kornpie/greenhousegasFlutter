import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class addlpg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return formeditNG();
  }
}

class formeditNG extends StatefulWidget {
  @override
  _formeditNGState createState() => _formeditNGState();
}

String _valueChanged = '';
String _valueToValidate = '';

class _formeditNGState extends State<formeditNG> {
  String _selectedyear; // Option 2// Option 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("เพิ่มข้อมูล"),
      // ),
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
                    child: Text("แก้ไขข้อมูลการใช้ NG",
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
                    height: 350,
                    width: 320,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Form(
                            child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Column(
                                children: [
                                  DateTimePicker(
                                    type: DateTimePickerType.date,
                                    dateMask: 'dd/MM/yyyy',
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2100),
                                    calendarTitle: '',
                                    dateLabelText: 'วัน/เดือน/ปี * ',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey[700]),
                                    onChanged: (val) =>
                                        setState(() => _valueChanged = val),
                                    validator: (val) {
                                      setState(
                                          () => _valueToValidate = val ?? '');
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 50, top: 10, bottom: 5),
                                    child: Text("กรอกตัวเลข หน่วย ลบ.ม.",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[700])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: Container(
                                      height: 20,
                                      child: TextFormField(
                                        // validator: RequiredValidator(
                                        //     errorText: 'กรุณากรอกให้ถูกต้อง'),
                                        // controller: rawweight,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 45,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      height: 43,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.blue,
                                            Colors.blue
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Text("Submit",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
