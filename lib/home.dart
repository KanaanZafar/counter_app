import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
//        child: Image.asset("assets/arrow_back.svg"),
        child: SvgPicture.asset("assets/arrow_back.svg"),
      ),
    );
  }

  apicall() async {
//    https://documenter.getpostman.com/view/10808728/SzS8rjbc
    //https://api.covid19api.com/
    //below one is required to us:
    //https://api.covid19api.com/summary
    Response response = await get("https://api.covid19api.com/summary");
//  print("-----body: ${response.body["Countries"]}");
    Map map = json.decode(response.body);
    List list = map["Countries"];
    print("--++ ${list.length}");
  }
}
