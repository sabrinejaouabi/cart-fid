import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class progin extends StatefulWidget {
  progin({Key? key}) : super(key: key);
  @override
  State<progin> createState() => _proginState();
}
class _proginState extends State<progin> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
        Radius.circular(
        8.0,
    ),
      ),
        border: Border.all(
          color:Color(0xFFFFFFFF),
          ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius:5,
            blurRadius:3,
           // offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Center(
            child:Row(
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  child:  CircularPercentIndicator(radius:35.0,
                    lineWidth: 4.0,
                    arcType:ArcType.FULL,
                    animation: true,
                    percent: 0.5,
                    progressColor: Color(0xff8E97FD),
                    center: new Text(
                      "50%",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF8E97FD),
                            //  letterSpacing: .5,
                            fontWeight: FontWeight.w700,
                            fontSize:16),
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 14,),
                            Container(
                             // alignment:Alignment.bottomLeft,
                             // margin: EdgeInsets.all(20),
                              child: Text(
                                'Profil Incomplet',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF3F414E),
                                      fontWeight: FontWeight.w600,
                                      fontSize:14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        child: Text("Compléter vos informations \n personnels",
                          //textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF898B93),
                                fontWeight: FontWeight.w400,
                                fontSize:14),
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                    ],

                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
