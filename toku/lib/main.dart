import 'package:flutter/material.dart';
import 'package:toku/screens/home_page.dart';

void main() {
  runApp(const TokoApp());
  //adb tcpip 5555
  //adb connect 192.168.1.3:5555
  //flutter devices
}

class TokoApp extends StatelessWidget {
  const TokoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

