import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class typecarte extends StatefulWidget {
  const typecarte({Key? key}) : super(key: key);

  @override
  State<typecarte> createState() => _typecarteState();
}

class _typecarteState extends State<typecarte> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14,),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left:9,),
            decoration: BoxDecoration(
              color: Color(0xff8E97FD),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  17,
                ),
              ),
            ),
            child: CupertinoButton(
        onPressed: () {
            // Respond to button press
        },
        child: Text("#Personal ",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins( textStyle:TextStyle(
              color: Color(0xffF6F1FB),
              fontSize: 12,
              //letterSpacing: .5,
              fontWeight: FontWeight.w500),
        ),
      ),
          ),
          ),
          SizedBox(width: 15,),
          Container(
            margin: EdgeInsets.only(left:8,),
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  17,
                ),
              ),
            ),
            child: CupertinoButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("#family",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins( textStyle:TextStyle(
                    color: Color(0xffC0C2CA),
                    fontSize: 12,
                    //letterSpacing: .5,
                    fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SizedBox(width: 20,),
          Container(
            margin: EdgeInsets.only(left:8,),
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  17,
                ),
              ),
            ),
            child: CupertinoButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("#work ",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins( textStyle:TextStyle(
                    color: Color(0xffC0C2CA),
                    fontSize: 12,
                    //letterSpacing: .5,
                    fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
