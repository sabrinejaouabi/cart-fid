import 'package:cartefid/core/profile/body_edit_info.dart';
import 'package:cartefid/core/profile/editer_les_informations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class buttnprofile extends StatefulWidget {
  const buttnprofile({Key? key}) : super(key: key);

  @override
  State<buttnprofile> createState() => _buttnprofileState();
}

class _buttnprofileState extends State<buttnprofile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 63,
          decoration: BoxDecoration(
            color: Color(0xff8E97FD),
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
                    //alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>bodyedit(),
                        ),
                        );
                      },
                      child: Text(
                        'Editer mes informations',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins( textStyle:TextStyle(
                            color: Color(0xffF6F1FB),
                            fontSize: 14,
                            letterSpacing: .5,
                            fontWeight: FontWeight.w500),
                        ),
                      ),

                    ),
                  )
              )
            ],
          ),

        ),
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
                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    //margin: EdgeInsets.all(12),
                    // padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      elevation: 0,
                      //Row(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      // children: [
                      // TextButton(
                      onPressed: () {
                        //Navigator.push(
                       //   context,
                       //   MaterialPageRoute(
                          //  builder: (context) => connexion(),
                        //  ),
                      //  );
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
                        'Changer mon mot de passe',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                          color: Color(0xFF8E97FD),
                          fontSize: 14,
                            letterSpacing: .5,
                          ),
                        ),
                      ),
                    ),
                    // style: ButtonStyle(
                    //padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(30.0)),
                    //foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF8E97FD)),
                  ),
              )
            ],
          ),
        )
      ],
    );
  }
}
