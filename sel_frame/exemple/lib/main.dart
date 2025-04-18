import 'package:exemple/ui/drawer/layered_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late double asd;

  @override
  Widget build(BuildContext context) {
    asd = MediaQuery.of(context).size.height;
    print(asd.toString());
    return MaterialApp(
      home: Scaffold(
        body: EXLayeredDrawer(),
      ),
    );
  }
}
