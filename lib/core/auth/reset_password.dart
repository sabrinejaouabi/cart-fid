
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
class reset_screen extends StatefulWidget {
  const reset_screen({Key? key}) : super(key: key);
  @override
  State<reset_screen> createState() => _reset_screenState();
}
TextEditingController _emailController = new TextEditingController();

class _reset_screenState extends State<reset_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                       Container(
                         child: InkWell(
                          onTap: () {
                            //Navigator.pop(context);
                           /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>connexion(),
                              ),
                            );*/
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 0,
                                    top: 15,
                                    bottom: 10,
                                  ),
                                  child: FloatingActionButton(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Color(0xFFEBEAEC)),
                                    ),
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    /*  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>connexion(),
                                        ),
                                      );*/
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 28,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                       ),
                    SizedBox(height: 15,),
                    Container(
                      child: Text(
                        'Mot de passe oublié',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF3F414E),
                              //  letterSpacing: .5,
                              fontWeight: FontWeight.w600,
                              fontSize: 28),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.start,
                        obscureText: false,
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "Adresse email",
                          hintStyle: TextStyle(
                            color: Color(0xFFA1A4B2),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            letterSpacing: .5,
                            fontSize: 16,
                          ),
                          fillColor: Color(
                            0xfff3f3f4,
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(
                        context,
                      ).size.width,
                      margin: EdgeInsets.all(15),
                      /*padding: EdgeInsets.symmetric(
                        vertical:10,
                      ),*/
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30.0,
                          ),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0xFF8E97FD),
                          ),
                        ],
                      ),
                      child: CupertinoButton(
                        onPressed: ()  {
                       /*  *//* auth.sendPasswordResetEmail(email:_emailController.text )
                              .then((value) =>*//*
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>connexion()));
                          //Navigator.pop(context);

*/
                          Navigator.pop(context);
                        },
                        child: Text(
                            'Reset',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFFF6F1FB),
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            )),
                      ),
                    )

                  ]

              ),
            ),
          ),
        ),
      ),
    );
  }
}
