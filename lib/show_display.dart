import 'package:flutter/material.dart';
import 'package:greenhousegas/data.dart';
import 'dart:io';
import 'ipcon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String mon_Start;
  String mon_End;
  String selectedValue;
  String yaerSave;

  runApp(MaterialApp());

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  runApp(MaterialApp(home: showdispaly(mon_Start, mon_End, yaerSave)));
}

class showdispaly extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  String mon_Start;
  String mon_End;
  String yaerSave;
  @override
  showdispaly(String mon_Start, mon_End, yaerSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yaerSave = yaerSave;

    print(mon_Start + mon_End + "dd" + yaerSave);
  }
  showdispalyState createState() =>
      showdispalyState(mon_Start, mon_End, yaerSave);
  // showdispalyState createState() => showdispalyState();
}

class showdispalyState extends State<showdispaly> {
  String mon_Start;
  String mon_End;
  String yaerSave;
  List datarawTable = [];
  List datawasteTable = [];
  List dataproductTable = [];
  List datawaterTable = [];
  List datawater2Table = [];
  List datawater3Table = [];
  List data_eg_elecTable = [];
  List data_eg_lpgTable = [];
  List data_eg_NGTable = [];
  List resultDataraw = [];

  showdispalyState(String mon_Start, mon_End, yaerSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yaerSave = yaerSave;

    print(mon_Start + mon_End + "ss" + yaerSave);
  }
  @override
  void initState() {
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));
    getRawData();
    getWasteData();
    getProductData();
    getwatertData();
    getwater2Data();
    getwater3Data();
    getegElecData();
    getegLPGData();
    getegNGData();
    super.initState();
  }

  //List dataProTable = [5555];

  Future<List> getRawData() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_raw_data.php?raw_yaer=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      datarawTable = json.decode(response.body);
    }
    return datarawTable;
  }

  Future<List> getProductData() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_product_data.php?product_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      dataproductTable = json.decode(response.body);
    }
    return dataproductTable;
  }

  Future<List> getWasteData() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_waste_data.php?waste_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      datawasteTable = json.decode(response.body);
    }
    return datawasteTable;
  }

  Future<List> getegElecData() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_eg_elec_data.php?eg_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      data_eg_elecTable = json.decode(response.body);
    }
    return data_eg_elecTable;
  }

  Future<List> getegLPGData() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_eg_lpg_data.php?lpg_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      data_eg_lpgTable = json.decode(response.body);
    }
    return data_eg_lpgTable;
  }

  Future<List> getegNGData() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_eg_ng_data.php?eg_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      data_eg_NGTable = json.decode(response.body);
    }
    return data_eg_NGTable;
  }

  Future<List> getwatertData() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_water_data.php?water_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      datawaterTable = json.decode(response.body);
    }
    return datawaterTable;
  }

  Future<List> getwater2Data() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_water2_data.php?water_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      datawater2Table = json.decode(response.body);
    }
    return datawater2Table;
  }

  Future<List> getwater3Data() async {
    final response = await http.get(Uri.parse(
        'http://$ipcon/greenhousegas/show_water3_data.php?water_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}'));
    if (response.statusCode == 200) {
      datawater3Table = json.decode(response.body);
    }
    return datawater3Table;
  }

  @override
  Widget build(BuildContext context) {
    // resultDataraw = double.parse(datarawTable[0]['raw_data1']) +
    //     double.parse(datarawTable[0]['raw_data2']);
    // print(datarawTable[0]['raw_data1']);
    // print(resultRaw);
    // print(dataProTable);
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
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 250, right: 0, top: 0, bottom: 0),
                    child: Container(
                      child: Text("username",
                          style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text('คาร์บอนฟุตพริ้นท์จากการใช้วัตถุดิบ',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              await widget.browser.open(
                                  url: Uri.parse(
                                      "http://$ipcon/greenhousegas/Chart/chartRaw_total.php?year=${yaerSave}&mon_start=${mon_Start}&mon_end=${mon_End}"),
                                  options: ChromeSafariBrowserClassOptions(
                                      android: AndroidChromeCustomTabsOptions(
                                          addDefaultShareMenuItem: false),
                                      ios: IOSSafariOptions(
                                          barCollapsingEnabled: true)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey, // background
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  child: Text('       กราฟ        ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                            future: getRawData(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  height: 30,
                                  width: 260,
                                  decoration: BoxDecoration(
                                    color: Colors.green[600], // background
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 156.7,
                                          right: 10,
                                          top: 0,
                                          bottom: 0),
                                      child: Text(datarawTable[0]['raw_data2'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text('คาร์บอนฟุตพริ้นท์จากการใช้สินค้า',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              await widget.browser.open(
                                  url: Uri.parse(
                                      "http://$ipcon/greenhousegas/Chart/chart_total_product.php?year=${yaerSave}&mon_start=${mon_Start}&mon_end=${mon_End}"),
                                  options: ChromeSafariBrowserClassOptions(
                                      android: AndroidChromeCustomTabsOptions(
                                          addDefaultShareMenuItem: false),
                                      ios: IOSSafariOptions(
                                          barCollapsingEnabled: true)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey, // background
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  child: Text('       กราฟ        ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                            future: getProductData(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  height: 30,
                                  width: 260,
                                  decoration: BoxDecoration(
                                    color: Colors.green[600], // background
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 156.7,
                                          right: 10,
                                          top: 0,
                                          bottom: 0),
                                      child: Text(
                                          dataproductTable[0]['product_data2'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text('คาร์บอนฟุตพริ้นท์จากของเสียรีไซเคิล',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              await widget.browser.open(
                                  url: Uri.parse(
                                      "http://$ipcon/greenhousegas/Chart/chart_total_wasterecycle.php?year=${yaerSave}&mon_start=${mon_Start}&mon_end=${mon_End}"),
                                  options: ChromeSafariBrowserClassOptions(
                                      android: AndroidChromeCustomTabsOptions(
                                          addDefaultShareMenuItem: false),
                                      ios: IOSSafariOptions(
                                          barCollapsingEnabled: true)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey, // background
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  child: Text('       กราฟ        ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                            future: getWasteData(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  height: 30,
                                  width: 260,
                                  decoration: BoxDecoration(
                                    color: Colors.green[600], // background
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 156.7,
                                          right: 10,
                                          top: 0,
                                          bottom: 0),
                                      child: Text(
                                          datawasteTable[0]['waste_data2'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text('คาร์บอนฟุตพริ้นท์จากการใช้พลังงาน',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await widget.browser.open(
                                      url: Uri.parse(
                                          "http://$ipcon/greenhousegas/Chart/chart_total_elec.php?year=${yaerSave}&mon_start=${mon_Start}&mon_end=${mon_End}"),
                                      options: ChromeSafariBrowserClassOptions(
                                          android:
                                              AndroidChromeCustomTabsOptions(
                                                  addDefaultShareMenuItem:
                                                      false),
                                          ios: IOSSafariOptions(
                                              barCollapsingEnabled: true)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Container(
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey, // background
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 0),
                                      child: Text('       กราฟ        ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              InkWell(
                                onTap: () async {
                                  await widget.browser.open(
                                      url: Uri.parse(
                                          "http://$ipcon/greenhousegas/Chart/chart_total_lpg.php?year=${yaerSave}&mon_start=${mon_Start}&mon_end=${mon_End}"),
                                      options: ChromeSafariBrowserClassOptions(
                                          android:
                                              AndroidChromeCustomTabsOptions(
                                                  addDefaultShareMenuItem:
                                                      false),
                                          ios: IOSSafariOptions(
                                              barCollapsingEnabled: true)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Container(
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey, // background
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 0),
                                      child: Text('       กราฟ        ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              InkWell(
                                onTap: () async {
                                  await widget.browser.open(
                                      url: Uri.parse(
                                          "http://$ipcon/greenhousegas/Chart/chart_total_NG.php?year=${yaerSave}&mon_start=${mon_Start}&mon_end=${mon_End}"),
                                      options: ChromeSafariBrowserClassOptions(
                                          android:
                                              AndroidChromeCustomTabsOptions(
                                                  addDefaultShareMenuItem:
                                                      false),
                                          ios: IOSSafariOptions(
                                              barCollapsingEnabled: true)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Container(
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey, // background
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 0),
                                      child: Text('       กราฟ        ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              FutureBuilder(
                                future: getegElecData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      height: 30,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.green[600], // background
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0),
                                          child: Text(
                                              "การใช้ไฟฟ้า " +
                                                  data_eg_elecTable[0]
                                                      ['elec_data2'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              FutureBuilder(
                                future: getegLPGData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      height: 30,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.green[600], // background
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0),
                                          child: Text(
                                              "การใช้LPG " +
                                                  data_eg_lpgTable[0]
                                                      ['lpg_data2'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              FutureBuilder(
                                future: getegNGData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      height: 30,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.green[600], // background
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0),
                                          child: Text(
                                              "การใช้NG " +
                                                  data_eg_NGTable[0]
                                                      ['ng_data2'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text('คาร์บอนฟุตพริ้นท์จากการใช้น้ำประปา',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await widget.browser.open(
                                      url: Uri.parse(
                                          "http://$ipcon/greenhousegas/Chart/chart_total_water1.php?water_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}"),
                                      options: ChromeSafariBrowserClassOptions(
                                          android:
                                              AndroidChromeCustomTabsOptions(
                                                  addDefaultShareMenuItem:
                                                      false),
                                          ios: IOSSafariOptions(
                                              barCollapsingEnabled: true)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Container(
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey, // background
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 0),
                                      child: Text('       กราฟ        ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              InkWell(
                                onTap: () async {
                                  await widget.browser.open(
                                      url: Uri.parse(
                                          "http://$ipcon/greenhousegas/Chart/chart_total_water2.php?water_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}"),
                                      options: ChromeSafariBrowserClassOptions(
                                          android:
                                              AndroidChromeCustomTabsOptions(
                                                  addDefaultShareMenuItem:
                                                      false),
                                          ios: IOSSafariOptions(
                                              barCollapsingEnabled: true)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Container(
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey, // background
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 0),
                                      child: Text('       กราฟ        ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              InkWell(
                                onTap: () async {
                                  await widget.browser.open(
                                      url: Uri.parse(
                                          "http://$ipcon/greenhousegas/Chart/chart_total_water3.php?water_year=${yaerSave}&mon_Start=${mon_Start}&mon_End=${mon_End}"),
                                      options: ChromeSafariBrowserClassOptions(
                                          android:
                                              AndroidChromeCustomTabsOptions(
                                                  addDefaultShareMenuItem:
                                                      false),
                                          ios: IOSSafariOptions(
                                              barCollapsingEnabled: true)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Container(
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey, // background
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 0, bottom: 0),
                                      child: Text('       กราฟ        ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              FutureBuilder(
                                future: getwatertData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      height: 30,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.green[600], // background
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0),
                                          child: Text(
                                              "การใช้น้ำประปานิคมฯ " +
                                                  datawaterTable[0]
                                                      ['water_data2'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              FutureBuilder(
                                future: getwater2Data(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      height: 30,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.green[600], // background
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0),
                                          child: Text(
                                              "การใช้น้ำประปาอ่อน " +
                                                  datawater2Table[0]
                                                      ['water2_data2'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              FutureBuilder(
                                future: getwater3Data(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      height: 30,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.green[600], // background
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0),
                                          child: Text(
                                              "การใช้น้ำRO " +
                                                  datawater3Table[0]
                                                      ['water3_data2'],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text('คาร์บอนฟุตพริ้นท์จากมลพิษสิ่งแวดล้วม',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Container(
                              height: 28,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey, // background
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 0, bottom: 0),
                                child: Text('       กราฟ        ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.green[600], // background
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 230, right: 10, top: 0, bottom: 0),
                              child: Text('0',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await widget.browser.open(
                                          url: Uri.parse(
                                              "http://$ipcon/greenhousegas/Chart/chartPieAll.php?raw_data=${datarawTable[0]['raw_data2']}&product_data=${dataproductTable[0]['product_data2']}&waste_data=${datawasteTable[0]['waste_data2']}&elec_data=${data_eg_elecTable[0]['elec_data2']}&lpg_data=${data_eg_lpgTable[0]['lpg_data2']}&ng_data=${data_eg_NGTable[0]['ng_data2']}&water_data=${datawaterTable[0]['water_data2']}&water2_data=${datawater2Table[0]['water2_data2']}&water3_data=${datawater3Table[0]['water3_data2']}"),
                                          options: ChromeSafariBrowserClassOptions(
                                              android:
                                                  AndroidChromeCustomTabsOptions(
                                                      addDefaultShareMenuItem:
                                                          false),
                                              ios: IOSSafariOptions(
                                                  barCollapsingEnabled: true)));
                                    },
                                    child: Text(
                                      "กราฟรวม",
                                      style: GoogleFonts.prompt(
                                          fontSize: 18, color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await widget.browser.open(
                                          url: Uri.parse(
                                              "http://$ipcon/greenhousegas/Chart/chartPieDist.php?year=${yaerSave}&mon_start=${mon_Start}&mon_end=${mon_End}&useelec=${data_eg_elecTable[0]['elec_data2']}&useNg=${data_eg_NGTable[0]['ng_data2']}&useWater1=${datawaterTable[0]['water_data2']}&useWater2=${datawater2Table[0]['water2_data2']}&useWater3=${datawater3Table[0]['water3_data2']}"),
                                          options: ChromeSafariBrowserClassOptions(
                                              android:
                                                  AndroidChromeCustomTabsOptions(
                                                      addDefaultShareMenuItem:
                                                          false),
                                              ios: IOSSafariOptions(
                                                  barCollapsingEnabled: true)));
                                    },
                                    child: Text(
                                      "กราฟระยะทาง",
                                      style: GoogleFonts.prompt(
                                          fontSize: 18, color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return AddData();
                                        }),
                                      );
                                    },
                                    child: Text(
                                      "ข้อมูลอื่น",
                                      style: GoogleFonts.prompt(
                                          fontSize: 18, color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    child: GestureDetector(
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                            color: Colors.blue, // background
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          child: Text(
                              'Note : \nMMTOC2Eq is million metric tons of \ncarbon dioxide equivalent',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
