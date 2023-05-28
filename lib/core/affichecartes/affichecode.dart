import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class affiche_code extends StatefulWidget {
  final String value;
   affiche_code({Key? key,required this.value}) : super(key: key);
  @override
  State<affiche_code> createState() => _affiche_codeState();
}

class _affiche_codeState extends State<affiche_code> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:  Colors.deepPurple.shade50,
          body: Center(
            child: Container(
              margin: EdgeInsets.all(100),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            4,
                          ),
                        ),
                        color: Colors.white,
                        border: Border.all(
                          width: 2.0,
                          color: Colors.white,
                        )),
                    child: BarcodeWidget(
                      barcode: Barcode.code93(),
                      data: widget.value,
                      width:500,
                    ),
                  ),


                ],

              ),
            ),
          ),


    )


    );
  }
}
