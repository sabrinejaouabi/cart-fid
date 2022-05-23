import 'package:cartefid/core/auth/connexion.dart';
import 'package:cartefid/core/auth/signin_google.dart';
import 'package:cartefid/core/onbolding.dart';
import 'package:cartefid/core/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cartefid/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/end_users.dart';
import 'dart:async';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//import 'facebook_auth.dart';

class inscription extends StatefulWidget {
  const inscription({Key? key}) : super(key: key);

  @override
  State<inscription> createState() => _inscriptionState();
}

//controller le filed text
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
Authservices _authServices = new Authservices();
TextEditingController _emailController = new TextEditingController();
TextEditingController _passController = new TextEditingController();
TextEditingController _nomController = new TextEditingController();

class _inscriptionState extends State<inscription> {
  final _formKey = GlobalKey<FormState>();
  Enduser endUser = Enduser(
      username: 'testUser',
      fullname: 'test user',
      email: 'testuser@mail.com',
      phone: '34434',
      uid: '076665542');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body:SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            // height: height,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          height: 90,
                        ),
                        Text(
                          'Crée un compte',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF3F414E),
                                //  letterSpacing: .5,
                                fontWeight: FontWeight.w600,
                                fontSize: 28),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (!RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value!)) {
                                        return 'nom invalide';
                                      }
                                      if (value.isEmpty) {
                                        return 'entrer votre nom et prénom';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.start,
                                    obscureText: false,
                                    controller: _nomController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: "Nom et Prénom",
                                      fillColor: Color(
                                        0xfff3f3f4,
                                      ),
                                      hintStyle: GoogleFonts.poppins(
                                        color: Color(0xFFA1A4B2),
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          letterSpacing:.5,
                                          fontSize: 16,
                                        ),
                                      ),
                                      filled: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value!)) {
                                        return 'email invalide';
                                      }
                                      if (value.isEmpty) {
                                        return 'entrer votre adresse email';
                                      }
                                      return null;
                                    },
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: "Adresse email",
                                      fillColor: Color(
                                        0xfff3f3f4,
                                      ),
                                      hintStyle: GoogleFonts.poppins(
                                        color: Color(0xFFA1A4B2),
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          letterSpacing:.5,
                                          fontSize: 16,
                                        ),
                                      ),
                                      filled: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (!RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                          .hasMatch(value!)) {
                                        return 'Veuillez entrer le mot de passe';
                                      }
                                      if (value.isEmpty) {
                                        return 'Entrez un mot de passe valide';
                                      }
                                      return null;
                                    },

                                    obscureText: true,
                                    controller: _passController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: "Mot de passe",
                                      fillColor: Color(
                                        0xfff3f3f4,
                                      ),
                                        hintStyle: GoogleFonts.poppins(
                                          color: Color(0xFFA1A4B2),
                                          textStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          letterSpacing:.5,
                                          fontSize: 16,
                                        ),
                                        ),
                                      filled: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(
                            context,
                          ).size.width,
                          padding: EdgeInsets.symmetric(
                            vertical:10,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                38.0,
                              ),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color(0xFF8E97FD),
                              ),
                            ],
                          ),
                          child: CupertinoButton(
                            onPressed: () async {
                              if (_nomController.text.trim().isNotEmpty &&
                                  _emailController.text.trim().isNotEmpty &&
                                  _passController.text.trim().isNotEmpty) {
                                dynamic credentials =
                                    await _authServices.inscriptionnuser(

                                     _emailController.text.trim(),
                                      _passController.text.trim(),
                                     // _nomController.text.trim(),
                                );
                                if (credentials == null) {
                                  const snackBar = SnackBar(
                                    content: Text('Email/Password are invalid'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  _authServices
                                      .createUserDocument(
                                          _firebaseAuth.currentUser!.uid, endUser)
                                      .then((value) =>  Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => connexion())));
                                }
                              }
                            },
                            child: Text(
                              'COMMENCER',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFFF6F1FB),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Row(
                            children: const <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height:70,
                          //height: 50,
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff7583CA),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                38.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                //flex: 1,
                                child: Container(
                                  //alignment: Alignment.center,
                                  child: Image.asset('assets/facebook.png'),
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    onTap: () {
                                      Future<UserCredential> signInWithFacebook() async {
                                        // Trigger the sign-in flow
                                        final LoginResult loginResult = await FacebookAuth.instance.login();
                                        // Create a credential from the access token
                                        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
                                        // Once signed in, return the UserCredential
                                        return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
                                      }
                                     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>fb(plugin: plugin)));
                                      //
                                    },
                                    //  alignment: Alignment.center,
                                    child: Text(
                                      'CONTINUER AVEC FACEBOOK',
                                      //textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFFF6F1FB),
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height:70,
                          //height: 50,
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              //color: Color(0xffEBEAEC),
                              borderRadius: BorderRadius.all(
                                Radius.circular(38.0),
                              ),
                              border: Border.all(
                                color: Color(0xffEBEAEC),
                              )),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                //flex: 1,
                                child: Container(
                                  //alignment: Alignment.center,
                                  child: Image.asset('assets/google.png'),
                                ),
                              ),
                              Expanded(
                                flex:3,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInDemo()));
                                    },
                                    // alignment: Alignment.center,
                                    child: Text(
                                      'CONTINUER AVEC GOOGLE',
                                      //textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF3F414E),
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => connexion(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            padding: EdgeInsets.all(
                              15,
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'VOUS AVEZ UN COMPTE?',
                                  style: TextStyle(
                                    color: Color(0xFFA1A4B2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    letterSpacing: .5,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'SE CONNECTER',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF8E97FD,
                                    ),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                     //Navigator.pop(context);
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
                              top: 10,
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
                               /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => onbolding(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
