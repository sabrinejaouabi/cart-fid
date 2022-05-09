import 'package:cartefid/core/cartes/Mescartes.dart';
import 'package:cartefid/core/cartes/Progressindicators.dart';
import 'package:cartefid/core/cartes/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cartefid/components/header.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  @override
  State<profile> createState() => _profileState();
}
class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Colors.white,
      body:SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              header(),
           progin(),
              SizedBox(
                height:10,
              ),
              mescartes(),
              SizedBox(
                height: 50,
              ),
              btn(),

            ],
          ),
        ),
      ) ,


      //)
    );
  }
}
