import 'dart:convert';
import 'package:flutter/material.dart';
import 'ipcon.dart';
import 'package:http/http.dart' as http;

class Homecraftsman extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Homecraftsman> {
  Future<List> getdata() async {
    final response = await http
        .get(Uri.parse("http://$ipcon/flutter/show_typecatshome.php"));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

