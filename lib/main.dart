import 'package:cartefid/core/onbolding.dart';
import 'package:flutter/material.dart';
import 'core/onbolding.dart';
void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: onbolding());
  }

}



