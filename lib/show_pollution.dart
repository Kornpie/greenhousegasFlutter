import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'package:greenhousegas/insert__waterpollution.dart';
import 'package:greenhousegas/insert__weatherpollution.dart';
import 'package:greenhousegas/insert_industrialpollution_.dart';
import 'package:greenhousegas/view_pollution_industry.dart';
import 'package:greenhousegas/view_pollution_waste.dart';
import 'package:greenhousegas/view_pollution_water.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'edit_raw_materials.dart';
import 'insert_product.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'edit_product.dart';
import 'view_product.dart';

class showpollution extends StatefulWidget {
  @override
  showpollutionState createState() => showpollutionState();
}

class showpollutionState extends State<showpollution> {
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
                    child: Text("ข้อมูลมลพิษสิ่งแวดล้อม",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        utype == "2"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return addwaterr();
                                }),
                              )
                            : null;
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined),
                              iconSize: 35,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return viewpollutionwater();
                                  }),
                                );
                              },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 210, right: 0, top: 0, bottom: 0),
                              child: Text('มลพิษน้ำA',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        utype == "2"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return weatherpollution();
                                }),
                              )
                            : null;
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined),
                              iconSize: 35,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return viewpollutionwaste();
                                  }),
                                );
                              },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 180, right: 0, top: 0, bottom: 0),
                              child: Text('มลพิษอากาศA',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        utype == "2"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return industrialpollution();
                                }),
                              )
                            : null;
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined),
                              iconSize: 35,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return viewpollutionindustry();
                                  }),
                                );
                              },
                            ),
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 100, right: 0, top: 0, bottom: 0),
                              child: Text('มลพิษกากอุสาหกรรมA',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 225, right: 0, bottom: 0),
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

 













// class Itemlist extends StatefulWidget {
//   final list;
//   Itemlist({this.list});
//   @override
//   _ItemlistState createState() => _ItemlistState();
// }

// class _ItemlistState extends State<Itemlist> {
  

//   @override


  
//   Widget build(BuildContext context) {
             
//     return new ListView.builder(
//       itemCount: widget.list == null ? 0 : widget.list.length,
//       itemBuilder: (context, i) {
//         return Container(
//           height: 80,
//           child: Padding(
           
//             padding: EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 5),
            
//             child: Card(
            
//               child: ListTile(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => viewproduct(
//                                 list: widget.list,
//                                 i: i,
//                               )));
//                 },
                
//                 title: Text('การใช้น้ำประปา :' + ' ' + widget.list[i]['water_cubic'] +' ' +'ลบ.ม',
//                     style: TextStyle(fontSize: 19, color: Colors.black) 
                  
//                     ),
                    
//                 trailing: Wrap(
//                   children: [
//                     IconButton(
//                       color: Colors.black,
//                       icon: Icon(Icons.remove_red_eye),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => viewwater(
//                                       list: widget.list,
//                                       i: i,
//                                     )));
//                       },
//                     ),
                    
                   
//                   ],
//                 ),
//               ),
//             ),
//           ),
       
//         );
//       },
//     );
//   }
// }
