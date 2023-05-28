import 'package:cartefid/core/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/connexion.dart';
import 'auth/inscription.dart';
class onbolding extends StatefulWidget {
  const onbolding({Key? key}) : super(key: key);
  @override
  State<onbolding> createState() => _onboldingState();
}
class _onboldingState extends State<onbolding> {
  late SharedPreferences prefs ;
  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }
  Future<bool> check_if_already_login() async {
    prefs  = await SharedPreferences.getInstance();
    if (prefs.getString('user') !=null ) {
      return true;
    }
    else{
      return false;
    }
  }
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
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Image.asset('assets/onbording1.png'),
                  ),

                  //Spacer(flex: 2),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image.asset('assets/onbording2.png'),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top:12, right: 10, left: 10),
                    child: Text(
                        "Avec carteFid, toutes vos cartes\n sont à un click prés.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF3F414E),
                              //letterSpacing: .5,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(top:25, left: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height:50,
                      child: RaisedButton(
                        onPressed: ()async {
                          await check_if_already_login().then((isLoggedIn){
                                if (isLoggedIn){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => profile(),
                                    ),
                                  );

                                }else{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => inscription(),
                                    ),
                                  );
                                }


                              });
                        },
                        color: Color(0xFF8E97FD),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all((Radius.circular(30.0))),
                        ),
                        elevation:0,
                        child: Text(
                          "INSCRIPTION ",
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
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 5, right: 5, bottom: 40),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          //margin: EdgeInsets.all(12),
                          // padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            elevation: 0,
                            onPressed: ()async {
                              await check_if_already_login().then((isLoggedIn){
                                if (isLoggedIn){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => profile(),
                                    ),
                                  );

                                }else{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => connexion(),
                                    ),
                                  );
                                }
                              });
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Color(0xFF8E97FD),
                              ),
                            ),
                            //)
                            //),
                            child: Text(
                              'CONNEXION',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF8E97FD),
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )),
                          ),
                        ),
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
