import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../models/list_notif.dart';
class listviewnotification extends StatefulWidget {
  const listviewnotification({Key? key}) : super(key: key);
  @override
  State<listviewnotification> createState() => _listviewnotificationState();
}
class _listviewnotificationState extends State<listviewnotification> {
  getnotificationdata()async{
    var response =await http.get(Uri.https('627521036d3bc09e106aeeb4.mockapi.io/api/v1/','notification'));
    var jsonData=jsonDecode(response.body);

    List<NotificationList> Notif=[];
    for(var no in jsonData){
      NotificationList notif =NotificationList(name: no["name"],img:no["img"],date:no["date"],descr:no["descr"]);
      Notif.add(notif);
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return NotificationList.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load list');
      }
    }
   // print(Notif.length);
   // return Notif;
  }
  /*var titlelist = [
    " Carte Fid",
    "Monoprix",
    "Carrrefour",
    "Baguette & Baguette",
    "Carrrefour"
  ];
  var description = [
    "une mise a jour est disponible , En profiter des nouvelles fonctionnalités",
    "des promotions jusqu'à 60% pour les clients fidelites pour la rentres scolaire",
    "Un chariot de 100 dinaire à gangner dans touts les magasin carrefour ce samedi",
    "Livraison gratuite sur toutes les commandes de plus à 30 dinar ce weekends",
    "Promotions sur tous les prouduits delice seulement dans les magaisins carrefours",
  ];
  var imglist = [
    "assets/cartfiid.png",
    "assets/moneprix.png",
    "assets/carrfour.png",
    "assets/baguette.png",
    "assets/carrfour.png",
  ];*/
  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Container(
    child: Card(
    child:FutureBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if(snapshot.data==null){
        return Container(
          child: Text('Loding...'),

        );
      }
      else {
        return ListView.builder(
            shrinkWrap: true,
            itemCount:snapshot.data.length,
            itemBuilder: ( context , index){
              return GestureDetector(
                onTap: (){
                  showDialogFunc(
                      context,
                      snapshot.data[index].img,
                      snapshot.data[index].name,
                      snapshot.data[index].date,
                      snapshot.data[index].descr);
                },
                child:Card(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Image.asset(snapshot.data[index].img),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data[index].name,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFF3F414E),
                                  fontWeight: FontWeight.w500,
                                  fontSize:16),
                            ),
                          ),
                          Spacer(),
                            Text(
                                 snapshot.data[index].date,
                               style: GoogleFonts.poppins(
                                   textStyle: TextStyle(
                                  color: Color(0xFF3F414E),
                                 fontWeight: FontWeight.w500,
                                 fontSize:16),
                ),
              ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width,
                            child: Text(
                              snapshot.data[index].descr,
                              //maxLines:2,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF5D5F6D),
                                    fontWeight: FontWeight.w400,
                                    fontSize:12),
                              ),
                            ),

                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        );

  }
      }


    )

    ),



    );
  }
}

showDialogFunc(BuildContext context, img, name,data, descr) {
  return showDialog(
    context: context,
    builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
           //height:50,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                 name,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF3F414E),
                        fontWeight: FontWeight.w500,
                        fontSize:16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      descr,
                     // maxLines: 3,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF5D5F6D),
                            fontWeight: FontWeight.w400,
                            fontSize:12),),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    }

  );

}



