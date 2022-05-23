import 'package:cartefid/core/auth/connexion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../profile/monprofilepage.dart';
import '../profile/profile.dart';
class changer_pass extends StatefulWidget {
  changer_pass({Key? key}) : super(key: key);
  @override
  State<changer_pass> createState() => _changer_passState();
}

TextEditingController _passController = new TextEditingController();
TextEditingController _confirmPassController = new TextEditingController();


class _changer_passState extends State<changer_pass> {
  final _formKey = GlobalKey<FormState>();
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
                         // Navigator.pop(context);

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
                                  top: 20,
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
                        'Changer mon mot de passe',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF3F414E),
                              //  letterSpacing: .5,
                              fontWeight: FontWeight.w600,
                              fontSize:20),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          obscureText: false,
                          controller: _passController,
                          validator: (value) {
                            print('value $value');
                            return value!.isEmpty ? 'password required' : null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: " Mot de passe",
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
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        obscureText: false,
                        controller: _confirmPassController,
                        validator: (value) {
                          print('value $value');
                          return value!.isEmpty ? 'field required' : null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: " Nouveau mot de passe",
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
                    Container(
                      width: MediaQuery.of(
                        context,
                      ).size.width,
                      margin: EdgeInsets.all(15),
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
                      child: Text(
                      'Changer mot de passe',
                     style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                      color: Color(0xFFF6F1FB),
                        letterSpacing: .5,
                    fontWeight: FontWeight.w500,
                     fontSize: 14),
                       )),
                        onPressed: () {
                          if (_passController.text.isEmpty &&
                              _confirmPassController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('les chapms vide...')));
                          }
                          else if(_passController.text!=_confirmPassController.text){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('pass invalide...')));
                          }
                          else{
                          Navigator.push(context, CupertinoPageRoute(
                          builder: (context) => profilepage()));
                          }
                        }

                    /*if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('loading...')),
                      );*/


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


