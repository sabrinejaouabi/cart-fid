import 'package:cartefid/core/auth/inscription.dart';
import 'package:cartefid/core/auth/reset_password.dart';
import 'package:cartefid/core/auth/signin_google.dart';
import 'package:cartefid/core/onbolding.dart';
import 'package:cartefid/core/profile/profile.dart';
import 'package:cartefid/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class connexion extends StatefulWidget {
  const connexion({Key? key}) : super(key: key);
  @override
  State<connexion> createState() => _connexionState();
}
//controller le filed text
Authservices _authservices=new Authservices();
TextEditingController _emailController = new TextEditingController();
TextEditingController _passController = new TextEditingController();
bool _ispassvisible = true;

class _connexionState extends State<connexion> {
  final _formKey = GlobalKey<FormState>();
  //static final FacebookLogin facebookSignIn = new FacebookLogin();
  @override
  Widget build(BuildContext context) {
    void dispose() {
      // Clean up the controller when the widget is disposed.
      _emailController.dispose();
      _passController.dispose();
      super.dispose();
    }
    clearText() {
      _emailController.clear();
      _passController.clear();
    }
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            // height: height,
            child: SingleChildScrollView(
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
                            'Connexion',
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
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical:12,
                                ),
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
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.emailAddress,
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
                                  ],
                                ),
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
                                      controller: _passController,
                                      obscureText:true,
                                      decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        hintText: "Mot de passe",
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
                              vertical: 5,
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
                              onPressed: () async{
                                //_emailController.clear();
                               // _passController.clear();
                                /*Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => profile()));*/
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => profile(),
                                  ),
                                      (route) => false,
                                );
                             /*   if(_emailController.text.trim().isEmpty||_passController.text.trim().isEmpty){
                                  final snackBar=SnackBar(
                                     content:Text('Email/password can\'t be empty'),
                                  );
                                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                                else{
                                  dynamic credentials=await _authservices.conexionnuser(
                                      _emailController.text.trim(),
                                      _passController.text.trim());
                                  print('credentials are :'+credentials.toString());
                                  if (credentials==null){
                                    const snackBar=SnackBar(content: Text('Email/password are invalid'),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                  else {
                                    Navigator.pushReplacement(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => profile()));
                                  }

                                }*/
                                //print('login email :${_emailController.text}');
                                //  print('login pass :${_passController.text}');
                               /* if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('connexion avec succès'),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }*/
                              },
                              child: Text(
                                'SE CONNECTER',
                                  textAlign: TextAlign.center,
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
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            alignment: Alignment.center,
                            child:TextButton(child:Text(
                              'Mot de passe oublié ?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF3F414E),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )),
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => reset_screen()));


                                },),

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
                            margin: EdgeInsets.symmetric(
                              vertical:30,
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
                                  //flex:2,
                                  child: Container(
                                    //alignment: Alignment.center,
                                    child: Image.asset('assets/facebook.png'),
                                  ),
                                ),
                                Expanded(
                                  flex:3,
                                  child: Container(
                                    //alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        //Navigator.push(
                                        //  context,
                                        //  MaterialPageRoute(
                                        //    builder: (context) =>MyApp(),
                                        // ),
                                        // );
                                      },
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
                                   // alignment: Alignment.center,
                                    child: Image.asset('assets/google.png'),
                                  ),
                                ),
                                Expanded(
                                  flex:3,
                                  child: Container(
                                    //alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInDemo()));
                                      },
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
                                  builder: (context) => inscription(),
                                ),
                               );
                              //Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              padding: EdgeInsets.all(
                                15,
                              ),
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    'VOUS ËTES NOUVEAU?',
                                    style:TextStyle(
                                      color: Color(0xFFA1A4B2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      letterSpacing:.5,
                                    ),
                                  ),
                                  SizedBox(
                                    width:5,
                                  ),
                                  Text(
                                    'S’INSCRIRE',
                                    style: TextStyle(fontFamily: 'Poppins',
                                      color: Color(
                                        0xFF8E97FD,
                                      ),
                                      fontSize:14,
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
                                  //Navigator.pop(context);
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
      ),
    );
  }
}
