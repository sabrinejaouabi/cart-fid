import 'package:cartefid/models/Company.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'btn_ajouter_cartes.dart';
import 'codescann.dart';
import 'headeracceuilajoutercartes.dart';
class monacceuil extends StatefulWidget {
  monacceuil ({Key? key, this.value}) : super(key: key);
  String? value;
  @override
  State<monacceuil> createState() => _monacceuilState();
}
class _monacceuilState extends State<monacceuil> {
  Company? itemSelect;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // headeracceuil(),
              headeracc(),
              SizedBox(
                height: 10,
              ),
              codescann(value:widget.value!),
              // iconscan(),
              SizedBox(
                height: 10,
              ),
              btn_ajouter_cartes(
                  value:widget.value!
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height:50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
