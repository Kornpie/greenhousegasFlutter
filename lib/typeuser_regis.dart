import 'package:flutter/material.dart';
import 'constans.dart';
import 'owner_regis.dart';
import 'manager_regis.dart';
import 'supervisor_regis.dart';
import 'recorder_regis.dart';


class typeregis extends StatefulWidget {
  @override
  _typeregisState createState() => _typeregisState();
}

class _typeregisState extends State<typeregis> {
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
                    child: Text("เลือกประเภทผู้ใช้",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                  Container(
                    child: Text("_________________",
                        style: TextStyle(fontSize: 26, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    height: 400,
                    width: 320,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white, // background
                        borderRadius: BorderRadius.circular(40)),
                    child: ListView(
                      padding: EdgeInsets.only(top: 20),
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ownerregis();
                              }),
                            );
                          },
                          child: Container(
                            height: 80,
                            color: Colors.lightBlue[200],
                            child: const Center(
                                child: Text('Owner',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return managerregis();
                              }),
                            );
                          },
                          child: Container(
                            height: 80,
                            color: Colors.lightBlue[100],
                            child: const Center(
                                child: Text('  Manager',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return supervisorregis();
                              }),
                            );
                          },
                          child: Container(
                            height: 80,
                            color: Colors.lightBlue[200],
                            child: const Center(
                                child: Text('  Supervisor',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return recorderregis();
                              }),
                            );
                          },
                          child: Container(
                            height: 80,
                            color: Colors.lightBlue[100],
                            child: const Center(
                                child: Text('  Recorder',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black))),
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
