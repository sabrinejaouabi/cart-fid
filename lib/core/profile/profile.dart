import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:cartefid/components/header.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_item.dart';
import '../../models/user.dart';
import '../../static/Static_values.dart';
import '../affichecartes/affichecarte.dart';
import '../cartes/headerprofilnouveau.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String token = '';
  String userId = '';
  List<CartItem> listCart = [];
  Future<List<CartItem>>? future;

  @override
  void initState() {
    OneSignal.shared.setAppId("d86e6c53-fe13-416c-a469-cafaab1f7359");
    super.initState();
    getToken();
    getCart();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token") ?? "";
      Map<String, dynamic> map = jsonDecode(prefs.getString("user").toString());
      userId = User.fromJson(map).id ?? "";
      print('userId is $userId');
      print('token is $token');
      future = getCart();
    });
  }

  Future<List<CartItem>> getCart() async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    print('token getcard is $token');
    Map<String, Object> param = {
      "filter": jsonEncode({
        "include": ["company"],
        //"userId":userId,
        "where": {"userId": "$userId"}
      })
    };
    print('filter is ${jsonEncode({
          "include": ["company"],
          "where": {"userId": "$userId"}
        })}');
    /*  Map<String, Object> param = {
      //"filter": {"where":{"userId":userId}}};
    "filter": jsonEncode({
    "include": userId,
    })
    };*/
    //listCart.clear();
    // sending the request
    var response = await http.get(
        Uri.http(StaticValues.apiUrl, StaticValues.endpointCart, param),
        headers: header);
    // verification itha el request raj3t b'resultat wla
    print('response is ${response}');
    if (response.statusCode == 200) {
      print('response json is ${response.body}');
      var jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse) {
        setState(() {
          listCart.add(CartItem.fromJson(item));
        });
      }
      print('CartList is $listCart');
      return listCart;
    } else {
      // sinon 5arjli error
      throw Exception('No Card Found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(token);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: FutureBuilder<List<CartItem>>(
        future: future,
        builder: (context, snapshot) {
          log(snapshot.data.toString());
          if (!snapshot.hasData) {
            // si mazel ma fammech data bch yraj3li waiting sign
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            print("bch taffichi el page li ygoli fiha zid carta");
            return nouveauheaderprofil();
          } else {
            // sinon listView fiha les données
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  header(),
                  SizedBox(
                    height: 40,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: double.infinity,
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 10,
                                  color: Colors.deepPurple.shade50,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => affich_carte(
                                                cartItem:
                                                    snapshot.data![index]),
                                          ));
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(30),
                                          child: Text(
                                            snapshot.data![index].companyname.toString(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Color(0xff3F414E),
                                                  fontSize: 14,
                                                  letterSpacing: .5,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ));
          }
        },
      ),
    );
  }
}
