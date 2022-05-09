import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth/connexion.dart';
import 'auth/inscription.dart';
class onbolding extends StatefulWidget {
  const onbolding({Key? key}) : super(key: key);
  @override
  State<onbolding> createState() => _onboldingState();
}
class _onboldingState extends State<onbolding> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image.asset('assets/onbording1.png'),
                  ),

                  //Spacer(flex: 2),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image.asset('assets/onbording2.png'),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Text(
                        'Avec carteFid, toutes vos cartes sont à un click prés.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF3F414E),
                              letterSpacing: .5,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => inscription(),
                            ),
                          );
                        },
                        color: Color(0xFF8E97FD),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all((Radius.circular(30.0))),
                        ),
                        child: Text(
                          "INSCRIPTION ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 5, right: 5, bottom: 40),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 48,
                          //margin: EdgeInsets.all(12),
                          // padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            elevation: 0,
                            //Row(
                            //  mainAxisAlignment: MainAxisAlignment.center,
                            // children: [
                            // TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => connexion(),
                                ),
                              );
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
                              'CONNEXION',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xFF8E97FD),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                          // style: ButtonStyle(
                          //padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(30.0)),
                          //foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF8E97FD)),
                        ),
                        //          ],
                        //      ),
                        //),

// ),
                      ]),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );

  }
}
