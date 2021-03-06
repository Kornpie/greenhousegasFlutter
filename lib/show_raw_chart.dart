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
  String yaerSave;

  runApp(MaterialApp());

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  runApp(
      MaterialApp(home: ChartRaw(mon_Start, mon_End, yaerSave, selectedValue)));
}

class ChartRaw extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  String mon_Start;
  String mon_End;
  String selectedValue;
  String yaerSave;
  ChartRaw(String mon_Start, mon_End, yaerSave, selectedValue) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yaerSave = yaerSave;
    this.selectedValue = selectedValue;
    print(mon_Start + mon_End + "Chart" + selectedValue + yaerSave);
  }

  @override
  _ChartRawState createState() =>
      new _ChartRawState(mon_Start, mon_End, selectedValue, yaerSave);
}

class _ChartRawState extends State<ChartRaw> {
  String mon_Start;
  String mon_End;
  String selectedValue;
  String yaerSave;
  _ChartRawState(String mon_Start, mon_End, selectedValue, yaerSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.selectedValue = selectedValue;
    this.yaerSave = yaerSave;
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
                      "http://$ipcon/greenhousegas/Chart/chartRaw.php?mon_start=${mon_Start}&mon_end=${mon_End}&year=${yaerSave}&comid=${selectedValue}"),
                  options: ChromeSafariBrowserClassOptions(
                      android: AndroidChromeCustomTabsOptions(
                          addDefaultShareMenuItem: false),
                      ios: IOSSafariOptions(barCollapsingEnabled: true)));
            },
            child: Text(
              "???????????????????????????????????????????????????",
              style: GoogleFonts.prompt(fontSize: 22, color: Colors.white),
            )),
      ),
    );
  }
}
