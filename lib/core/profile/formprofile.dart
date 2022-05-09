import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class formprofil extends StatefulWidget {
  const formprofil({Key? key}) : super(key: key);

  @override
  State<formprofil> createState() => _formprofilState();
}

class _formprofilState extends State<formprofil> {
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
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                ),
                labelText: 'Nom et Prénom',
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
        ],
      ),

    );
  }
}
