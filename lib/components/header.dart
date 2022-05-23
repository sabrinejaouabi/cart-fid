import 'package:cartefid/core/profile/monprofilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../core/ajoutercartes/mon_acceuil.dart';
import '../core/notification/monnotificationpage.dart';
class header extends StatefulWidget {
  String? value;
    header({Key? key,this.value}) : super(key: key);
   @override
   State<header> createState() => _headerState();
 }
 class _headerState extends State<header> {
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
           IconButton( icon:Image.asset('assets/profil.png'),
       onPressed: (){
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) =>profilepage(),
           ),
         );
       },
     ),
           IconButton(icon:Image.asset('assets/notif.png'),
             onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) =>notificationpage(),
               ),
             );
           },
           ),
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
 