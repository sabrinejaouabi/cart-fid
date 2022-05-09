import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
class btn_enregister_button extends StatefulWidget {
  const btn_enregister_button({Key? key}) : super(key: key);

  @override
  State<btn_enregister_button> createState() => _btn_enregister_buttonState();
}

class _btn_enregister_buttonState extends State<btn_enregister_button> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
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
                    //Navigator.push(
                    //  context,
                    //  MaterialPageRoute(
                     //   builder: (context) =>monacceuil(),
                     // ),
                   // );
                  },
                  child: Text(
                    'Enregistrer la carte',
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

    );
  }
}
