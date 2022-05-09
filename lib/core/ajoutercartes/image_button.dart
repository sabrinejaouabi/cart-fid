
import 'package:flutter/material.dart';

import 'btn_ajouter_cartes.dart';

class img_btn extends StatefulWidget {
  final String imgpath;
  const img_btn({Key? key,required this.imgpath}) : super(key: key);

  @override
  State<img_btn> createState() => _img_btnState();
}

class _img_btnState extends State<img_btn> {
  List<Map> _myJson = [
    {"id": '1', "image": "assets/carrfour.png", "name": "carrefour"},
    {"id": '2', "image": "assets/cartfiid.png", "name": "cartfiid"},
    {"id": '3', "image": "assets/moneprix.png", "name": "monoprix"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
     height: 256,
      child: Image.asset(widget.imgpath,fit: BoxFit.cover,),
    );
  }
}
