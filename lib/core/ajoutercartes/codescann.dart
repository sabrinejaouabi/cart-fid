import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../scanner/affichescann.dart';

class codescann extends StatefulWidget {
   String? value;
  codescann({Key? key,this.value }) : super(key: key );
  //const codescann({Key? key}) : super(key: key);

  @override
  State<codescann> createState() => _codescannState();
}

class _codescannState extends State<codescann> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image:AssetImage('assets/scancarte.png')),
          Text("${widget.value}"),
        ],
      ),
    );
  }
}
