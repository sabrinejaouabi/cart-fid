import 'package:cartefid/core/auth/inscription.dart';
import 'package:cartefid/core/auth/reset_password.dart';
import 'package:cartefid/core/auth/signin_google.dart';
import 'package:cartefid/core/onbolding.dart';
import 'package:cartefid/core/profile/profile.dart';
import 'package:cartefid/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cartefid/core/scanner/scanncode.dart';

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
      body: SafeArea(
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
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value!)) {
                                      return 'email invalide';
                                    }
                                    if (value.isEmpty) {
                                      return 'entrer votre adresse email';
                                    }
                                    return null;
                                  },

                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.start,
                                  obscureText: false,
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20),
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
                                      borderRadius: BorderRadius.circular(20),
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
                            if(_emailController.text.trim().isEmpty||_passController.text.trim().isEmpty){
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

                            }
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
                            'SE CONNECTRER',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        alignment: Alignment.center,
                        child:TextButton(child:Text(
                          'Mot de passe oublié ?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: Color(0xFF3F414E),
                            letterSpacing: .5,
                          ),
                        ),
                            onPressed: (){
                              Navigator.pushReplacement(
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
                        height: 50,
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
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Image.asset('assets/facebook.png'),
                              ),
                            ),
                            Expanded(
                              flex: 5,
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
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
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
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Image.asset('assets/google.png'),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                //alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInDemo()));
                                  },
                                  child: Text(
                                    'CONTINUER AVEC GOOGLE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF3F414E),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins'),
                                  ),
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
                                'VOUS ETES NOUVEAU ?',
                                style: TextStyle(
                                  color: Color(0xFFA1A4B2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  letterSpacing: .5,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'SINSCRIRE',
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
                top: 40,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onbolding(),
                                ),
                              );
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
    );
  }
}
