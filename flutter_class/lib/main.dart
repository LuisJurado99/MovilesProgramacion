import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/HomeScreen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeScreen(),
    );
  }
}