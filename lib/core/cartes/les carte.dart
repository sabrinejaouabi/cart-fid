import 'dart:convert';
import 'dart:ui';
import 'package:cartefid/components/header.dart';
import 'package:cartefid/core/affichecartes/affichecarte.dart';
import 'package:cartefid/models/list_carte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ajoutercartes/type_carte.dart';
import 'package:http/http.dart' as http;
class cartes extends StatefulWidget {
   cartes({Key? key}) : super(key: key);
  @override
  State<cartes> createState() => _cartesState();
}
class _cartesState extends State<cartes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Container(
          child: Column(
            children: [
              header(),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(20),
                child: Text('Mes cartes',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins( textStyle:TextStyle(
                      color: Color(0xff3F414E),
                      fontSize:22,
                      letterSpacing: .5,
                      fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              //typecarte(),
              Expanded
                (child: GridView.count(crossAxisCount:2,
                children: [
                  Container(
                    child: Card(
                      child:Column(
                        children: [
                          Container(child: Image.asset('assets/carrfour.png',width:125,)),
                         SizedBox(height:15,),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) =>affich_carte(title: 'HA', image: 'assets/carrfour.png',),
                                  )
                              );
                            },
                            child: Text('HA',
                              style:GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF3F414E),
                                    fontWeight: FontWeight.w500,
                                    fontSize:14),
                            ),
                          ),
                          )
                        ],
                      ),
                      //  fit: BoxFit.fill,
                    ),
                  ),
                  /*Container(
                    child: Card(
                      child:Column(
                        children: [
                      Container(child: Image.asset('assets/carrfour.png',width:125,)),
                    SizedBox(height:15,),
                    TextButton(
                      onPressed: () {
                       */
                  /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>affich_carte(),
                          )
                        );*/
                  /*
                      },
                      child: Text('HA',
                        style:GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF3F414E),
                              fontWeight: FontWeight.w500,
                              fontSize:14),

                        ),
                          )
                    )
                        ],
                      ),
                      //  fit: BoxFit.fill,
                    ),
                  ),*/
                  /*Container(
                    child: Card(
                      child:Column(
                        children: [
                          Container(child: Image.asset('assets/carrfour.png',width:125,)),
                          SizedBox(height:15,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>affich_carte()),
                                );
                              },
                              child: Text('HA',
                                style:GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF3F414E),
                                      fontWeight: FontWeight.w500,
                                      fontSize:14),

                                ),
                              )
                          )
                        ],
                      ),
                      //  fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Card(
                      child:Column(
                        children: [
                          Container(child: Image.asset('assets/carrfour.png',width:125,)),
                          SizedBox(height:15,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>affich_carte()),
                                );
                              },
                              child: Text('HA',
                                style:GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF3F414E),
                                      fontWeight: FontWeight.w500,
                                      fontSize:14),

                                ),
                              )
                          )
                        ],
                      ),
                      //  fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Card(
                      child:Column(
                        children: [
                          Container(child: Image.asset('assets/carrfour.png',width:125,)),
                          SizedBox(height:15,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>affich_carte()),
                                );
                              },
                              child: Text('HA',
                                style:GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF3F414E),
                                      fontWeight: FontWeight.w500,
                                      fontSize:14),

                                ),
                              )
                          )
                        ],
                      ),
                      //  fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Card(
                      child:Column(
                        children: [
                          Container(child: Image.asset('assets/carrfour.png',width:125,)),
                          SizedBox(height:15,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>affich_carte()),
                                );
                              },
                              child: Text('HA',
                                style:GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF3F414E),
                                      fontWeight: FontWeight.w500,
                                      fontSize:14),

                                ),
                              )
                          )
                        ],
                      ),
                      //  fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Card(
                      child:Column(
                        children: [
                          Container(child: Image.asset('assets/carrfour.png',width:125,)),
                          SizedBox(height:15,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>affich_carte()),
                                );
                              },
                              child: Text('HA',
                                style:GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF3F414E),
                                      fontWeight: FontWeight.w500,
                                      fontSize:14),

                                ),
                              )
                          )
                        ],
                      ),
                      //  fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Card(
                      child:Column(
                        children: [
                          Container(child: Image.asset('assets/carrfour.png',width:125,)),
                          SizedBox(height:15,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>affich_carte()),
                                );
                              },
                              child: Text('HA',
                                style:GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF3F414E),
                                      fontWeight: FontWeight.w500,
                                      fontSize:14),

                                ),
                              )
                          )
                        ],
                      ),
                      //  fit: BoxFit.fill,
                    ),
                  ),
*/
                ],
                   ),
                  ),
              ],
              )),
          ),
        );
  }
}
