import 'package:cartefid/core/profile/monprofilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../core/notification/monnotificationpage.dart';
import '../core/onbolding.dart';
import '../core/scanner/affichescann.dart';

class header extends StatefulWidget {
   const header({Key? key}) : super(key: key);
 
   @override
   State<header> createState() => _headerState();
 }
 
 class _headerState extends State<header> {
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
             onPressed: (

                 ) {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) =>affichscann(),
                 ),
               );
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
 