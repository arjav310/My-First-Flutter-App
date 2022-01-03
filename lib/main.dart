import 'package:flutter/material.dart';
import 'package:toggle/home_page.dart';
import 'package:toggle/new_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      routes: {
        "/": (context) => HomePage(),
        '/newPage': (context) => NewPage(),
      },
    );
  }
}
