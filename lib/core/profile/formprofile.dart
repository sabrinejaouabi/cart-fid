import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user.dart';
class formprofil extends StatefulWidget {
   formprofil({Key? key}) : super(key: key);
  @override
  State<formprofil> createState() => _formprofilState();
}
class _formprofilState extends State<formprofil> {
  TextEditingController _emailController =  TextEditingController();
  TextEditingController _nomcontroller =  TextEditingController();
  TextEditingController _prenomcontroller =  TextEditingController();
  TextEditingController _numcontroller =  TextEditingController();
  late SharedPreferences prefs ;
  @override
  void initState() {
    super.initState();
    initial();
  }
  void initial() async {
    prefs= await SharedPreferences.getInstance();
    setState(() {
      User user = User.fromJson(jsonDecode(prefs.getString('user')!)) ;
     _nomcontroller.text= user.fname?? "";
     _prenomcontroller.text= user.lname?? "";
     _emailController.text= user.email?? "";
     _numcontroller.text=user.phone??"";
    });
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child:Column(
        children: [
          //nom
          Container(
            width: 341,
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller:_nomcontroller,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zá-úÁ-ÚwÀ-Üà-øoù-ÿŒœ ]+|\s')),
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                ),
                labelText: 'Nom',
                labelStyle:GoogleFonts.poppins(
                    textStyle:TextStyle(
                        color: Color(0xFFC0C2CA),
                        fontWeight: FontWeight.w400,
                        fontSize:12
                ),
                ),
              ),

            ),
          ),
          SizedBox(
            height:20,
          ),
          Container(
            width: 341,
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller:_prenomcontroller,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zá-úÁ-ÚwÀ-Üà-øoù-ÿŒœ ]+|\s')),
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                ),
                labelText: 'Prénom',
                labelStyle:GoogleFonts.poppins(
                  textStyle:TextStyle(
                      color: Color(0xFFC0C2CA),
                      fontWeight: FontWeight.w400,
                      fontSize:12
                  ),
                ),
              ),

            ),
          ),
          SizedBox(
            height:20,
          ),
          //adresse mail
          Container(
            width: 341,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                ),
                labelText: 'Adresse email',
                labelStyle:GoogleFonts.poppins(
                  textStyle:TextStyle(
                      color: Color(0xFFC0C2CA),
                      fontWeight: FontWeight.w400,
                      fontSize:12
                  ),
                ),
              ),

            ),
          ),
          SizedBox(
            height: 20,
          ),
          //telephone
          Container(
            width: 341,
            child: TextFormField(
              maxLength: 8,
              maxLengthEnforced: true,
              keyboardType: TextInputType.phone,
              controller: _numcontroller,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                ),
                labelText: 'Numero de tèléphone',
                labelStyle:GoogleFonts.poppins(
                  textStyle:TextStyle(
                      color: Color(0xFFC0C2CA),
                      fontWeight: FontWeight.w400,
                      fontSize:12
                  ),
                ),
              ),

            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),

    );
  }
}
