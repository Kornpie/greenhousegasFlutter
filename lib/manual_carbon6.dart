import 'package:flutter/material.dart';
import 'package:greenhousegas/manual_carbon5.dart';
import 'package:greenhousegas/manual_carbon7.dart';
import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'edit_raw_materials.dart';
import 'insert_product.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'edit_product.dart';
import 'view_product.dart';

class manualCarbon6 extends StatefulWidget {
  @override
  manualCarbon6State createState() => manualCarbon6State();
}

class manualCarbon6State extends State<manualCarbon6> {
  Future<List> getdata() async {
    final response =
        await http.get(Uri.parse("http://$ipcon/greenhousegas/show_water.php"));
    return json.decode(response.body);
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
                    height: 20,
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, bottom: 0, top: 0),
                    child: Container(
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent, // background
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 0, bottom: 10, top: 20),
                        child: Text(
                            "    บัญชีรายการผลิตฟิล์มโพลีเอทีลีน \n(Inventory of PET FILM PRODUCTION \n   CARBONFOOTPRINT Assessment)",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return addwaterr();
                      //     }),
                      //   );
                      // },

                      child: Container(
                        height: 650,
                        width: 2000,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Table(
                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),
                                2: IntrinsicColumnWidth(),
                                3: FlexColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      color: Colors.white,
                                      child: Text("  รายการที่นำมา\n   คำนวณ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "   ข้อมูลที่นำมา\n       คำนวณ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("  หน่วย",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(
                                          "   ค่าสัมประสิทธิ์\n      Emission\n        Factor",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" การขนส่งวัตถุดิบ"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "  ระยะทางที่รถ\nบรรทุกสินค้ามาส่ง"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กิโลกรัม"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "   ระยะทางที่รถ\nบรรทุกสินค้ามาส่ง"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กิโลเมตร"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(
                                          "   การใช้วัตถุดิบ\n         PET"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text("   น้ำหนักสุทธิ"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กิโลเมตร"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(
                                          "   การใช้วัตถุดิบ\n สนับสนุนการผลิต"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text("    น้ำหนักสุทธิ"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กิโลกรัม"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child:
                                          Text("    การใช้วัตถุ\n    สารเคมี"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text("    น้ำหนักสุทธิ"),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("   ลิตร"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("  การขนส่งสินค้า"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "  ระยะทางที่รถ\nบรรทุกสินค้ามาส่ง "),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กิโลเมตร"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "  ระยะทางที่รถ\nบรรทุกสินค้ามาส่ง "),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กิโลเมตร"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(" การขนส่งของเสีย"),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "   ระยะทางที่รถ\n   มารับของเสีย "),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กิโลเมตร"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: <Widget>[
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Container(
                                        height: 64,
                                        color: Colors.white,
                                        child: Text(
                                            "   ระยะทางที่รถ\n   นำของเสียไป\n       กำจัด "),
                                      ),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text("กิโลเมตร"),
                                    ),
                                    Container(
                                      height: 64,
                                      color: Colors.white,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 0, bottom: 0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return manualCarbon5();
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
                            child: Text("Back",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return manualCarbon7();
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
                            child: Text("Next",
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
                    height: 20,
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
