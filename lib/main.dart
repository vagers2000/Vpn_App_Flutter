import 'package:flutter/material.dart';
import 'package:vpn/src/intro/splash.dart';
import 'src/intro/splash.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splash(),
    );
  }
}
