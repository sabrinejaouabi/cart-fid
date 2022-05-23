import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../ajoutercartes/mon_acceuil.dart';
class iconscan extends StatefulWidget {
  const iconscan({Key? key}) : super(key: key);

  @override
  State<iconscan> createState() => _iconscanState();
}

class _iconscanState extends State<iconscan> {
  String _data = "";
  _scan() async{
     await FlutterBarcodeScanner.scanBarcode(
        "#000000", "cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //IconButton(icon:Icon(Icons.camera_outlined),onPressed: () {},
      body: Center(
        child: SafeArea(
          child: Column(
              children: [
            Container(
              child:Center(
             /*  child:
               _scan(),*/

               /* child: IconButton(
                    icon: Icon(Icons.camera_enhance_outlined),
                    iconSize: 200,
                    onPressed: () {
                      _scan();

               *//* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => monacceuil(
                              value: _data,
                            ),
                          ));*//*

                    }),*/
              ),
            ),
           /* Container(
              margin: EdgeInsets.all(20),
              //child: Text(_data, textAlign: TextAlign.justify,)
            ),
            SizedBox(
              height: 10,
            ),*/
             ElevatedButton(
              onPressed: () {
                if (_data == "") {
                  const snackBar = SnackBar(content: Text('verifier scan '));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                else{
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => monacceuil(
                          value: _data,
                        ),
                      ));
                }
              },

              child: Icon(Icons.navigate_next),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF8E97FD),
                shape: CircleBorder(),
                padding: EdgeInsets.all(12),
              ),
            ),
          ]
          ),
        ),
      ),
    );
  }
}
