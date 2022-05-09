
import 'package:cartefid/core/profile/btn_edit_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'editer_les_informations.dart';
import 'form_edit_info.dart';
import 'formprofile.dart';

class bodyedit extends StatefulWidget {
  const bodyedit({Key? key}) : super(key: key);

  @override
  State<bodyedit> createState() => _bodyeditState();
}

class _bodyeditState extends State<bodyedit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              edit_info(),
             SizedBox(height: 10,),
              form_edit_info(),
             SizedBox(height:200,),
              btn_edit_info(),

            ],
          ),
        ),
      ),


    );
  }
}
