import 'package:cartefid/core/cartes/Mescartes.dart';
import 'package:cartefid/core/cartes/Progressindicators.dart';
import 'package:cartefid/core/cartes/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cartefid/components/header.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  @override
  State<profile> createState() => _profileState();
}
class _profileState extends State<profile> {
  @override
  void initState() {
    OneSignal.shared.setAppId("d86e6c53-fe13-416c-a469-cafaab1f7359");
    super.initState();
  }
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
