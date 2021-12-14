import 'package:flutter/material.dart';

import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'edit_raw_materials.dart';
import 'insert_product.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'edit_product.dart';
import 'view_product.dart';
import 'manual_carbon1.dart';
import 'manual_carbon3.dart';

class manualCarbon2 extends StatefulWidget {
  @override
  manualCarbon2State createState() => manualCarbon2State();
}

class manualCarbon2State extends State<manualCarbon2> {
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
                    height: 70,
                  ),
                  Container(
                    height: 80,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.orange, // background
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 95, right: 0, bottom: 10, top: 20),
                      child: Text("Background",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
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
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0),
                              child: Text(
                                  '     Mobile applications have evolved to \n be used in a variety of formats.\n To meet the needs of users in various\n fields including linking multiple sub-data \n to be processed by multiple users which \nin the supply chain of  midstream \n manufacturers  Where the barriers to\n evaluating a  products GHG  \nemissions or Carbon Footprint \nThis mobile applications use \nfor Carbon Footprint Assessment.\n The Carbon Footprint of the product,\n which can then be \nimplemented in the Gate to Gate scope \nassessment, is used by each company \nin the data-connected supply chain.\n Since the acquisition of raw\n materials from the manufacturer until\n the receipt of raw materials, production,\n use of various resource, production \nwaste disposal and delivery of goods',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            )),
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
                                return manualCarbon1();
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
