import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cartes/les carte.dart';
class affich_carte extends StatefulWidget {
  final String title;
  final String image;
  affich_carte({Key? key,required this.title,required this.image}) : super(key: key);
  @override
  State<affich_carte> createState() => _affich_carteState();
}
class _affich_carteState extends State<affich_carte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Card(
          child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 0,
                      top: 20,
                      bottom:11,
                    ),
                   alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: new Icon(Icons.arrow_back),
                      //highlightColor: Colors.pink,
                      onPressed: () {
                      },
                    ),
                  ),
              Center(
                child: Column(
                  children: [
                    Text(widget.title),
                    Image.asset(widget.image,width:125,),

                  ],
                ),


              ),
                   Column(
                     children: [
                       Container(
                           alignment: Alignment.topLeft,
                           child: Image.asset(widget.image,width:125,)
                       ),
                       Column(
                         children: [
                           Container(
                             //alignment: Alignment.bottomLeft,
                             child:Text(widget.title,
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.poppins(
                                   textStyle: TextStyle(
                                       color: Color(0xFF3F414E),
                                       letterSpacing: .5,
                                       fontWeight: FontWeight.w600,
                                       fontSize: 14),
                                 )
                             ),
                           ),
                           Column(
                             children: [
                               Container(
                                 child:Text("Service Client"),
                               ),
                               Container(
                                 child:Text(" N° Vert: 80 103 456 8h à 20h - 7/7 Jours"),
                               ),
                               Container(
                                 child:Text("E-mail: contact@monoprix.tn"),
                               ),
                             ],
                           ),
                           SizedBox(height: 100,),
                           Container(
                             child: RaisedButton(
                               elevation: 0,
                               //Row(
                               //  mainAxisAlignment: MainAxisAlignment.center,
                               // children: [
                               // TextButton(
                               onPressed: () {
                                 /*Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => connexion(),
                                   ),
                                 );*/
                               },
                               color: Colors.white,
                               shape:

                               // MaterialStateProperty.all<RoundedRectangleBorder>(
                               RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(30.0),
                                 side: BorderSide(
                                   color: Color(0xFF8E97FD),
                                 ),
                               ),
                               //)
                               //),
                               child: Text(
                                   'Voir les magasins monoprix',
                                   textAlign: TextAlign.center,
                                   style: GoogleFonts.poppins(
                                     textStyle: TextStyle(
                                         color: Color(0xFF8E97FD),
                                         letterSpacing: .5,
                                         fontWeight: FontWeight.w500,
                                         fontSize: 14),
                                   )),
                             ),
                           )
                         ],
                       )

                     ],
                   )

                   // child: Image.asset(widget.image,width:125,),

                  //  child:Image.asset('assets/carrfour.png',width:125,),

                ],
              ),

            ),
        ),
        ),


    );
  }
}
