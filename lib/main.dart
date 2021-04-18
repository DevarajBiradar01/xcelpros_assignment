import 'package:flutter/material.dart';
import 'package:xcelpros_assignment/view/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF011416),
        primarySwatch: Colors.blueGrey,
        fontFamily: "Verdana",
      ),
      home: Login(),
    );
  }
}
