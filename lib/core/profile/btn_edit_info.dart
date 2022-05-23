import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'monprofilepage.dart';
class btn_edit_info extends StatefulWidget {
  const btn_edit_info({Key? key}) : super(key: key);

  @override
  State<btn_edit_info> createState() => _btn_edit_infoState();
}
TextEditingController _nomprenomController = new TextEditingController();
TextEditingController date = TextEditingController();
TextEditingController _numtelController = new TextEditingController();

class _btn_edit_infoState extends State<btn_edit_info> {
  @override
  Widget build(BuildContext context) {
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
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    /*if (_nomprenomController.text.isEmpty &&date.text.isEmpty&&
                        _numtelController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('les chapms vide...')));
                    }*/
                      //else{
                  /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>profilepage(),
                      ),
                    );*/

                    },
                  //},
                  child: Text(
                    'Enregistrer',
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