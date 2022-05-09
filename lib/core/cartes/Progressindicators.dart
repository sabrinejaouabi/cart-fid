import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class progin extends StatefulWidget {
  const progin({Key? key}) : super(key: key);
  @override
  State<progin> createState() => _proginState();
}
class _proginState extends State<progin> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
        Radius.circular(
        5.0,
    ),
      ),
        border: Border.all(
          color:Colors.black12,
          ),
      ),


      child: Column(
        children: [
          Center(
            child: Row(
              children: [
                SizedBox(
                  width:10,
                ),
                Container(
                  child:  CircularPercentIndicator(radius:35.0,
                    lineWidth: 3.0,
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
                SizedBox(
                  width:20,
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Profil Incomplet',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFF3F414E),
                                  fontWeight: FontWeight.w600,
                                  fontSize:14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width:30,
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Compléter vos informations \n personnels",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF3F414E),
                                fontWeight: FontWeight.w400,
                                fontSize:14),
                          ),
                        ),
                      ),
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
