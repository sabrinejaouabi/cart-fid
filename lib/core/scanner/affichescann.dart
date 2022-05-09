import 'package:cartefid/core/scanner/scanncode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cartefid/core/scanner/scanncode.dart';

import '../ajoutercartes/codescann.dart';
import '../ajoutercartes/mon_acceuil.dart';

class affichscann extends StatefulWidget {
  //final String? value;
  const affichscann({Key? key }) : super(key: key);

  @override
  State<affichscann> createState() => _affichscannState();
}

class _affichscannState extends State<affichscann> {
  String _data = "";

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
        "#000000", "cancel", true, ScanMode.BARCODE).then((value) =>
        setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FlatButton(onPressed: () => _scan(),
                  child: Text("click for scan code",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        backgroundColor: Colors.white70,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              Center(child: Image(image: AssetImage('assets/scann.png'))),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(_data, textAlign: TextAlign.justify,)),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  if(_data==""){
                    const snackBar=SnackBar(content: Text('verifier scan '));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            monacceuil(
                              value: _data,
                            ),
                      ),
                    );
                  }
                },
                child: Icon(Icons.navigate_next),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8E97FD),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(12),
                ),),

            ]

        )
    );
  }
}
