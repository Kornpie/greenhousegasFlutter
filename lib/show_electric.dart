// import 'package:flutter/material.dart';
// import 'ipcon.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'edit_raw_materials.dart';
// import 'insert_product.dart';
// import 'package:art_sweetalert/art_sweetalert.dart';
// import 'edit_product.dart';
// import 'view_product.dart';
// import 'package:google_fonts/google_fonts.dart';

// class showelectric extends StatefulWidget {
//   @override
//   showelectricState createState() => showelectricState();
// }

// class showelectricState extends State<showelectric> {
//   Future<List> getdata() async {
//     final response = await http
//         .get(Uri.parse("http://$ipcon/greenhousegas/show_product.php"));
//     return json.decode(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/background.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: ListView(
//           children: [
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 60,
//                   ),
//                   Container(
//                     child: Text("ข้อมูลการใช้พลังงานประจำเดือน",
//                         style: GoogleFonts.prompt(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) {
//                           return addproduct();
//                         }),
//                       );
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       // width: MediaQuery.of(context).size.width,
//                       height: 40,
//                       width: 180,
//                       decoration: BoxDecoration(
//                           color: Colors.grey[300], // background
//                           borderRadius: BorderRadius.circular(30)),
//                       child: Text("เพิ่มข้อมูล",
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue[500])),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 450,
//                     width: 390,
//                     child: new FutureBuilder<List>(
//                       future: getdata(),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasError) print(snapshot.error);

//                         return snapshot.hasData
//                             ? new Itemlist(list: snapshot.data)
//                             : new Center(
//                                 child: new CircularProgressIndicator(),
//                               );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Itemlist extends StatefulWidget {
//   final list;
//   Itemlist({this.list});
//   @override
//   _ItemlistState createState() => _ItemlistState();
// }

// class _ItemlistState extends State<Itemlist> {
//   void deleteData(String product_id) {
//     var url = Uri.parse("http://$ipcon/greenhousegas/delete_product.php");
//     http.post(url, body: {'id': product_id});
//   }

//   void confirm(context, String product_id, product_name) async {
//     ArtDialogResponse response = await ArtSweetAlert.show(
//         barrierDismissible: false,
//         context: context,
//         artDialogArgs: ArtDialogArgs(
//             denyButtonText: "ยกเลิก",
//             title: "คุณแน่ใจว่าต้องการลบ?",
//             text: "สินค้า : ${product_name}",
//             confirmButtonText: "ยืนยัน",
//             type: ArtSweetAlertType.warning));

//     if (response == null) {
//       return;
//     }

//     if (response.isTapConfirmButton) {
//       setState(() {
//         deleteData(product_id);
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => showelectric()));
//         ArtSweetAlert.show(
//             context: context,
//             artDialogArgs: ArtDialogArgs(
//               type: ArtSweetAlertType.success,
//               title: "ลบข้อมูลเรียบร้อย",
//             ));
//       });
//     }
//   }

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
//                 title: Text('สินค้า :' + ' ' + widget.list[i]['product_name'],
//                     style: TextStyle(fontSize: 20, color: Colors.black)),
//                 trailing: Wrap(
//                   children: [
//                     IconButton(
//                       color: Colors.black,
//                       icon: Icon(Icons.remove_red_eye),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => viewproduct(
//                                       list: widget.list,
//                                       i: i,
//                                     )));
//                       },
//                     ),
//                     IconButton(
//                       color: Colors.orange,
//                       icon: Icon(Icons.edit),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => editproduct(
//                                       list: widget.list,
//                                       i: i,
//                                     )));
//                       },
//                     ),
//                     IconButton(
//                       color: Colors.red,
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         confirm(context, widget.list[i]['product_id'],
//                             widget.list[i]['product_name']);
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
