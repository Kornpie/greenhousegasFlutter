import 'package:flutter/material.dart';
import 'constans.dart';
import 'login.dart';
import 'insert_raw_materials.dart';
import 'typeuser_regis.dart';
import 'staple.dart';
import 'data.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My home',
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{},
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/star.jpg"),
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
                  height: 120,
                  decoration: BoxDecoration(
                    color: myconstans.dark, // background
                  ),
                  child: Text(
                      "      การพัฒนาโปรแกรมประยุกต์ \n    สำหรับอุปกรณ์เคลื่อนที่เพื่อการ \n ประเมินคาร์บอนฟุตพริ้นท์ของบริษัท \n   ผลิตแผ่นฟิล์มโพลีเอทิลีนแห่งหนึ่ง",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: myconstans.dark, // background
                  ),
                  child: Text(
                      "    นายไพศาลศิลป์ สุขศรี \n รหัสนักศึกษา 2595000361",
                      style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginApp();
                      }),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.black, // background
                        borderRadius: BorderRadius.circular(30)),
                    child: Text("เข้าสู่ระบบ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return typeregis();
                      }),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.black, // background
                        borderRadius: BorderRadius.circular(30)),
                    child: Text("ลงทะเบียน",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: myconstans.dark, // background
                  ),
                  child: Text(
                      "      วิทยานิพนธ์นี้เป็นส่วนหนึ่งของการศึกษา  \n  ตามหลักสูตรปริญญาวิทยาศาสตรมหาบัณฑิต   \n     วิชาเอกการจัดการสิ่งแวดล้อมอุตสาหกรรม     \n                สาขาวิชาวิทยาศาสตร์สุขภาพ     \n    มหาวิทยาลัยสุโขทัยธรรมาธิราช พ.ศ. 2563",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
