import 'package:flutter/material.dart';

import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'edit_raw_materials.dart';
import 'insert_product.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'edit_product.dart';
import 'view_product.dart';
import 'manual_carbon3.dart';
import 'manual_carbon5.dart';

class manualCarbon4 extends StatefulWidget {
  @override
  manualCarbon4State createState() => manualCarbon4State();
}

class manualCarbon4State extends State<manualCarbon4> {
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
                        right: 10, left: 19, bottom: 0, top: 0),
                    child: Container(
                      child: Text(
                          "ขอบเขตการหาคาร์บอนฟุตปริ้นของการผลิตฟิล์มโพอีเอทีลีน \n\n (PET FILM PRODUCTION CARBON FOOTPRINT SCOPE)",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
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
                        height: 800,
                        width: 2000,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 10),
                              child: Container(
                                height: 100,
                                width: 270,
                                decoration: BoxDecoration(
                                    color: Colors.orange, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80, right: 0, bottom: 10, top: 10),
                                  child: Text("การรับวัตถุดิบ \n\n (Receiving)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, left: 170),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 50.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 0),
                              child: Container(
                                height: 120,
                                width: 290,
                                decoration: BoxDecoration(
                                    color: Colors.orange, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 28, right: 20, bottom: 10, top: 10),
                                  child: Text(
                                      "  การผลิตฟิล์มโพลีเอทีลีน \n\n (PET FLIM PRODUCTION)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, left: 170),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 50.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 0),
                              child: Container(
                                height: 100,
                                width: 270,
                                decoration: BoxDecoration(
                                    color: Colors.orange, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 75, right: 0, bottom: 10, top: 10),
                                  child: Text("การบรรจุหีบห่อ \n\n   (Packing)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, left: 170),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 50.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 0),
                              child: Container(
                                height: 130,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Colors.orange, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 0, bottom: 10, top: 10),
                                  child: Text(
                                      "   การจัดเรียงสินค้าโดยรถโฟร์คลิฟท์ \n\n   (Product Arrangement by Forklift)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, left: 170),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 50.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 0, top: 0),
                              child: Container(
                                height: 100,
                                width: 270,
                                decoration: BoxDecoration(
                                    color: Colors.orange, // background
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 55, right: 0, bottom: 10, top: 10),
                                  child: Text(
                                      "  การขนส่งสินค้า \n\n (Product Delivery)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
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
                                return manualCarbon3();
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
