import 'package:cartefid/core/notification/monnotificationpage.dart';
import 'package:cartefid/core/onbolding.dart';
import 'package:cartefid/core/profile/monprofilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../core/ajoutercartes/mon_acceuil.dart';
class headeracceuil extends StatefulWidget {
  headeracceuil({Key? key}) : super(key: key);

  @override
  State<headeracceuil> createState() => _headeracceuilState();
}
class _headeracceuilState extends State<headeracceuil> {
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
      margin: EdgeInsets.symmetric(vertical:20),
      child: Row(
        children: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>profilepage(),
              ),
            );
          }, icon:Icon(CupertinoIcons.person_solid,color: Colors.black)),
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>notificationpage(),
              ),
            );
          }, icon:Icon(CupertinoIcons.bell_fill,color: Colors.black)),


          Spacer(),

          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _scan();
            },
            child:Icon(Icons.add),
            style: ElevatedButton.styleFrom(
              primary:Color(0xFF8E97FD),
              shape: CircleBorder(),
              padding: EdgeInsets.all(12),
            ),
          ),

        ],
      ),
    );
  }
}
