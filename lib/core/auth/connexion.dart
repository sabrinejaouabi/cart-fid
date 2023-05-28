import 'dart:convert';
import 'package:cartefid/core/auth/inscription.dart';
import 'package:cartefid/core/auth/reset_password.dart';
import 'package:cartefid/core/auth/signin_google.dart';
import 'package:cartefid/core/onbolding.dart';
import 'package:cartefid/core/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';
import '../../static/Static_values.dart';
class connexion extends StatefulWidget {
  const connexion({Key? key}) : super(key: key);
  @override
  State<connexion> createState() => _connexionState();
}
class _connexionState extends State<connexion> {
  TextEditingController _emailController =  TextEditingController();
  TextEditingController _passController =  TextEditingController();
  bool isLoading=false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
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
                              onPressed: (){
                                if(isLoading)
                                {
                                  return;
                                }
                                if(_emailController.text.isEmpty||_passController.text.isEmpty)
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please Fill all fileds")));
                                  return;
                                }
                                login(_emailController.text,_passController.text);
                                setState(() {
                                  isLoading=true;
                                });
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
                                      },
                                      child: Text(
                                          'CONTINUER AVEC FACEBOOK',
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
  void saveUser (User user,String token) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //User.fromJson(jsonDecode(prefs.getString('user')));
    prefs.setString("user", User().serialize(user));
    prefs.setString("token", token);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => profile(),
      ),
          (route) => false,
    );
  }
  login(email,password) async
  {
    setState(() {
      isLoading=true;
    });
    Map data = {
      'email': email,
      'password': password
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    print(data.toString());
    final  response= await http.post(Uri.http(StaticValues.apiUrl,StaticValues.endpointLogin),
      headers: header,
      body: jsonEncode(data),
    );
    setState(() {
      isLoading=false;
    });
    if (response.statusCode == 200) {
      Map<String,dynamic>map=jsonDecode(response.body);
      saveUser(User.fromJson(map["user"]),map["token"]);
      print('user id is ${User.fromJson(map["user"]).id}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please try again!")));
    }
  }

}

