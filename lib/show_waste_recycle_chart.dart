import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ipcon.dart';
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
  String yearSave;

  runApp(MaterialApp());

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  runApp(
      MaterialApp(home: wasterecycleChartRaw(mon_Start, mon_End, yearSave, selectedValue)));
}

class wasterecycleChartRaw extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  String mon_Start;
  String mon_End;
  String selectedValue;
  String yearSave;
  wasterecycleChartRaw(String mon_Start, mon_End, yearSave, selectedValue) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yearSave = yearSave;
    this.selectedValue = selectedValue;
    print(mon_Start + mon_End + "Chart" + selectedValue + yearSave);
  }

  @override
  _wasterecycleChartRawState createState() =>
      new _wasterecycleChartRawState(mon_Start, mon_End, selectedValue, yearSave);
}

class _wasterecycleChartRawState extends State<wasterecycleChartRaw> {
  String mon_Start;
  String mon_End;
  String selectedValue;
  String yearSave;
  _wasterecycleChartRawState(String mon_Start, mon_End, selectedValue, yearSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.selectedValue = selectedValue;
    this.yearSave = yearSave;
  }

  @override
  void initState() {
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await widget.browser.open(
                  url: Uri.parse(
                      "http://$ipcon/greenhousegas/Chart/chartRawwasterecycle.php?mon_start=${mon_Start}&mon_end=${mon_End}&year=${yearSave}&comid=${selectedValue}"),
                  options: ChromeSafariBrowserClassOptions(
                      android: AndroidChromeCustomTabsOptions(
                          addDefaultShareMenuItem: false),
                      ios: IOSSafariOptions(barCollapsingEnabled: true)));
            },
            child: Text(
              "ไปยังหน้าแสดงกราฟของวัตถุดิบ",
              style: GoogleFonts.prompt(fontSize: 22, color: Colors.white),
            )),
      ),
    );
  }
}
