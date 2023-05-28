import 'dart:convert';
import 'package:cartefid/core/auth/connexion.dart';
import 'package:cartefid/core/auth/signin_google.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user.dart';
import '../../static/Static_values.dart';
import 'package:http/http.dart'as http;

class inscription extends StatefulWidget {
  const inscription({Key? key}) : super(key: key);

  @override
  State<inscription> createState() => _inscriptionState();
}
class _inscriptionState extends State<inscription> {
  var reg=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool isLoading=false;
  late String name,prenom,email, password;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _prenomController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _nomController = new TextEditingController();
  TextEditingController _numcontroller = new TextEditingController();
  TextEditingController date = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _prenomController.dispose();
    _nomController.dispose();
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
                                    textAlign: TextAlign.start,
                                    obscureText: false,
                                    controller: _nomController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: "Nom ",
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
                                    textAlign: TextAlign.start,
                                    obscureText: false,
                                    controller: _prenomController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: "Prénom",
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
                                    maxLength: 8,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                    controller: _numcontroller,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: "Numéro de téléphone",
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
                            onPressed: ()  {
                              if(isLoading)
                              {
                                return;
                              }
                              if(_nomController.text.isEmpty)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please Enter Name")));
                                return;
                              }
                              if(_prenomController.text.isEmpty)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please Enter prenom")));
                                return;
                              }
                              if(!reg.hasMatch(_emailController.text))
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Enter Valid Email")));
                                return;
                              }
                              if(_numcontroller.text.isEmpty)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please Entre your nomber phone")));
                                return;
                              }
                              if(_passController.text.isEmpty||_passController.text.length<6)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Password should be min 6 characters")));
                                return;
                              }
                              signup(_nomController.text,_prenomController.text,_emailController.text,_passController.text,_numcontroller.text);
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
                                     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInDemo()));
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

  void saveUser (User user,String token) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    //User.fromJson(jsonDecode(prefs.getString('user')));
    prefs.setString("user", User().serialize(user));
    prefs.setString("token", token);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => connexion(),
      ),
    );
  }

  signup(name,prenom,email,password,phone) async
  {
    setState(() {
      isLoading=true;
    });
    print("Calling");

    Map data = {
      'name': name,
      'prenom':prenom,
      'email': email,
      'phone':phone,
      'password': password
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    print(data.toString());
    final  response= await http.post(Uri.http(StaticValues.apiUrl,StaticValues.endpointSingUp),
      headers: header,
      body: jsonEncode(data),
    );
    setState(() {
      isLoading=false;
    });
    if (response.statusCode == 200) {
      Map<String,dynamic> map=jsonDecode(response.body);
      saveUser(User.fromJson(map["user"]),map["token"]);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please Try again")));
    }

  }

/* savePref( String nom,String prenom, String email,String password,) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("nom",nom);
    prefs.setString("prenom", prenom);
    prefs.setString("email", email);
    prefs.setString("password",password);
    prefs.commit();

  }*/
}
