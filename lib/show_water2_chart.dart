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
  // Strin;
  String yearSave;

  runApp(MaterialApp());

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  runApp(MaterialApp(home: water2Chart(mon_Start, mon_End, yearSave)));
}

class water2Chart extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  String mon_Start;
  String mon_End;
  // Strin;
  String yearSave;
  water2Chart(String mon_Start, mon_End, yearSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;
    this.yearSave = yearSave;

    print(mon_Start + mon_End + "Chart" + yearSave);
  }

  @override
  _water2ChartState createState() =>
      new _water2ChartState(mon_Start, mon_End, yearSave);
}

class _water2ChartState extends State<water2Chart> {
  String mon_Start;
  String mon_End;
  // Strin;
  String yearSave;
  _water2ChartState(String mon_Start, mon_End, yearSave) {
    this.mon_Start = mon_Start;
    this.mon_End = mon_End;

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
                      "http://$ipcon/greenhousegas/Chart/chart_water2.php?mon_Start=${mon_Start}&mon_End=${mon_End}&water_year=${yearSave}"),
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
