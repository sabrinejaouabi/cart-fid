import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cartefid/core/affichecartes/affichecode.dart';
import 'package:cartefid/core/profile/profile.dart';
import 'package:cartefid/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/user.dart';
import '../../static/Static_values.dart';
class affich_carte extends StatefulWidget {
 final CartItem cartItem;
  affich_carte({Key? key,required this.cartItem}) : super(key: key);
  @override
  State<affich_carte> createState() => _affich_carteState();
}
class _affich_carteState extends State<affich_carte> {
  String token = '';
  String userId = '';
  @override
  void initState() {
    OneSignal.shared.setAppId("d86e6c53-fe13-416c-a469-cafaab1f7359");
    super.initState();
    getToken();
  }
  Future<void> getToken () async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token") ?? "";
      Map<String,dynamic>map=jsonDecode(prefs.getString("user").toString() );
      userId = User.fromJson(map).id ?? "";
      print('userId is $userId');
      print('token is $token');
    });
  }
  static Future<void> openMap(double latitude,double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if(await canLaunch(googleUrl) != null) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 0,
                          top: 20,
                          bottom: 10,
                        ),
                        width: double.infinity,
                        color: Colors.deepPurple.shade50,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                icon: new Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                //highlightColor: Colors.pink,
                                onPressed: () {
                                  //Navigator.of(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            profile(),
                                      ));
                                },
                              ),
                            ),
                            //company name
                            Column(
                              children: [
                                Text(
                                  widget.cartItem.companyname!,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff5D5F6D),
                                        fontSize: 20,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            //code barecode
                            Column(
                              
                                children: [
                              Card(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => affiche_code(
                                            value: widget.cartItem != null ? widget.cartItem.barcode!:"11111111111",
                                          )
                                        )
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            4,
                                          ),
                                        ),
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 5.0,
                                          color: Colors.white,
                                        )),
                                   child: BarcodeWidget(
                                      barcode: Barcode.code93(),
                                     data:widget.cartItem != null?widget.cartItem.barcode!:"11111111111",
                                      width: 170,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                    Card(
                     color: Colors.blueGrey.shade50,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                            margin:EdgeInsets.all(10) ,
                                alignment: Alignment.center,
                                child: Text(
                                    widget.cartItem.companyname!,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff3F414E),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Service Client",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Color(0xff5D5F6D),
                                            fontSize: 14,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                    text:  "N° Vert: ",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Color(0xff5D5F6D),
                                            fontSize: 14,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: widget.cartItem.company!.phone!,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Color(0xff5D5F6D),
                                                  fontSize: 14,
                                                  letterSpacing: .5,
                                                  fontWeight: FontWeight.w500),
                                            )),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: widget.cartItem.company!.wh!,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Color(0xff5D5F6D),
                                            fontSize: 14,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                     margin: EdgeInsets.all(5),
                                      child: RichText(
                                        text: TextSpan(
                                         text: ' E-mail:',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Color(0xff5D5F6D),
                                                fontSize: 14,
                                                letterSpacing: .5,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          children: [
                                            TextSpan(
                                                text: widget.cartItem.company!.email!,
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff5D5F6D),
                                                      fontSize: 14,
                                                      letterSpacing: .5,
                                                      fontWeight: FontWeight.w500),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20),
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xff8E97FD),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      38.0,
                    ),
                  ),
                ),
                child: RaisedButton(
                  elevation: 0,
                  onPressed: () {
                  openMap(widget.cartItem != null ? widget.cartItem.company!.lat! : 0,widget.cartItem != null ? widget.cartItem.company!.lng! : 0 );
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38.0),
                    side: BorderSide(
                      color: Color(0xFF8E97FD),
                    ),
                  ),
                  child: Text('Voir localisation'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF8E97FD),
                            letterSpacing: .5,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
