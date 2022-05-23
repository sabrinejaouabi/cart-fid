import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../models/list_notif.dart';

class listviewnotification extends StatefulWidget {
  const listviewnotification({Key? key}) : super(key: key);

  @override
  State<listviewnotification> createState() => _listviewnotificationState();
}

class _listviewnotificationState extends State<listviewnotification> {
  //int currentPafe=1;
  Future<List<NotificationList>> getnotificationdata() async {
    try {
      var response = await http.get(Uri.https(
          '627521036d3bc09e106aeeb4.mockapi.io', '/api/v1/notification'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<NotificationList> notif = [];
        for (var no in jsonData) {
          notif.add(NotificationList(
              name: no["name"],
              img: no["img"],
              date: no["date"],
              descr: no["descr"]));
        }
        return notif;
      } else {
        throw Exception('Failed to load list');
      }
    } catch (e) {
      throw Exception('Failed to load list');
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
  void initState() {
    getnotificationdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Container(
      child: Column(
        children: [
          FutureBuilder<List<NotificationList>>(
              future: getnotificationdata(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            showDialogFunc(
                                context,
                                snapshot.data![index].img,
                                snapshot.data![index].name,
                                snapshot.data![index].date,
                                snapshot.data![index].descr);
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15.0),
                                  // child: Image.network(snapshot.data![index].img!),
                                  child: Icon(
                                    Icons.supervised_user_circle,
                                    size: 70,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              snapshot.data![index].name!,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Color(0xFF3F414E),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(
                                              width:140,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(DateFormat('EEE' ' ' 'd'  ' ' 'MMM').format(DateTime.parse(
                                                snapshot.data![index].date.toString(),),
                                                ),
                                              style: GoogleFonts.poppins(
                                               textStyle: TextStyle(
                                                color: Color(0xFFC0C2CA),
                                            fontWeight: FontWeight.w400,
                                              fontSize: 12),
                        ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width,
                                          child: Text(
                                            snapshot.data![index].descr!,
                                            //maxLines:2,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Color(0xFF5D5F6D),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else
                  return Container(
                    child: Text('Loding...'),
                  );
              })
        ],
      ),
    );
  }
}

showDialogFunc(BuildContext context, img, name, data, descr) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              //height:50,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    // child: Image.network(
                    //  img,
                    //  width:100,
                    //   height:100,
                    //  ),
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
                          fontSize: 16),
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
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
