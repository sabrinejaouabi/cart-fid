import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
class saisir_nom_carte extends StatefulWidget {
  const saisir_nom_carte({Key? key}) : super(key: key);
  @override
  State<saisir_nom_carte> createState() => _saisir_nom_carteState();
}
class _saisir_nom_carteState extends State<saisir_nom_carte> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
    padding: EdgeInsets.all(10),
    margin:EdgeInsets.all(20),
      decoration:  BoxDecoration(
          border: Border.all(width:1, color: Color(0xFFE5E5E5)),
         borderRadius: BorderRadius.circular(34.0)
      ),
          child:TextFormField(
            textAlign: TextAlign.start,
            obscureText: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              hintText: "Saisissez le nom de la carte",
              hintStyle: GoogleFonts.poppins(
                color: Color(0xFFA1A4B2),
                fontWeight: FontWeight.w400,
                letterSpacing: .5,
                fontSize: 12,
              ),
              filled: true,
            ),
          ),

      );


  }
}
