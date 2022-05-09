
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mescartes extends StatefulWidget {
  const mescartes({Key? key}) : super(key: key);

  @override
  State<mescartes> createState() => _mescartesState();
}

class _mescartesState extends State<mescartes> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      //padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(10.0),

              child: Text('Mes cartes',textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF3F414E),
                      fontWeight: FontWeight.w600,
                      fontSize:22),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("vous n'avez pas encore des cartes ",
              style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Color(0xFF5D5F6D),
                  fontWeight: FontWeight.w400,
                  fontSize:14,
                letterSpacing: .5,),
            ),),
            SizedBox(
             height:30,
            ),
            Image.asset('assets/onbording2.png', width:200, ),
          ],
        ),
      ),
    );
  }
}
