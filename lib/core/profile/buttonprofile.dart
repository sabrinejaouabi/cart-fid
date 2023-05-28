import 'package:cartefid/core/onbolding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class buttnprofile extends StatefulWidget {
  const buttnprofile({Key? key}) : super(key: key);
  @override
  State<buttnprofile> createState() => _buttnprofileState();
}
class _buttnprofileState extends State<buttnprofile> {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 63,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                38.0,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                //flex:6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  //margin: EdgeInsets.all(12),
                  // padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      showAlertDialog(BuildContext context) {
                        // set up the buttons
                        Widget cancelButton = TextButton(
                          child: Text("non"),
                          onPressed:  () {
                            Navigator.of(context).pop(false);
                          },
                        );
                        Widget continueButton = TextButton(
                          child: Text("oui"),
                          onPressed:  () async {
                            prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                     /*       Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => onbolding(),
                              ),

                            );*/
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => onbolding(),
                              ),
                                  (route) => false,
                            );
                          },
                        );
                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          content: Text("vous pouvez sortir ?"),
                          actions: [
                            cancelButton,
                            continueButton,
                          ],
                        );

                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      }
                      showAlertDialog(context);
                    },
                    color: Colors.white,
                    shape:
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                        color: Color(0xFF8E97FD),
                      ),
                    ),
                    //)
                    //),
                    child: Text(
                      'Logout ',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF8E97FD),
                          fontSize: 14,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
