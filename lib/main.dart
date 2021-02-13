import 'package:flutter/material.dart';

import './MyShop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'w4App6188045',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyShop(),
    );
  }
}
