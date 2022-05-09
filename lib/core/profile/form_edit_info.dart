import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class form_edit_info extends StatefulWidget {
  const form_edit_info({Key? key}) : super(key: key);
  @override
  State<form_edit_info> createState() => _form_edit_infoState();
}
class _form_edit_infoState extends State<form_edit_info> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
        return Form(
          key: _formKey,
          child:Column(
            children: [
              Container(
                width: 341,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom et Prénom',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                    ),

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
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                    ),
                    labelText: 'Date de naissance',
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
              Container(
                width: 341,
                child: TextFormField(
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
            ],
          ),
        );

  }
}
