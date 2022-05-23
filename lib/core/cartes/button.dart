import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ajoutercartes/mon_acceuil.dart';
import '../profile/profile.dart';
class btn extends StatefulWidget {
  String? value;
  btn({Key? key,this.value }) : super(key: key );
 // const btn({Key? key}) : super(key: key);
  @override
  State<btn> createState() => _btnState();
}
class _btnState extends State<btn> {
  String value_data ="";
  _scan() async{
    String result =  await FlutterBarcodeScanner.scanBarcode(
        "#000000", "cancel", true, ScanMode.BARCODE);
    (result != "-1" ) ?
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              monacceuil(
                value: result,
              ),
        )) :
    (){};
  }
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
                 /* _scan();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                      monacceuil(
                        value: _data,
                      )));*/
                  _scan();
                },
                child: Text(
                  'AJOUTER UNE CARTE DE FEDILITÉ',
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
