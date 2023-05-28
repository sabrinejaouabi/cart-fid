import 'dart:convert';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:cartefid/models/Company.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/itemDrop.dart';
import '../../models/user.dart';
import '../../static/Static_values.dart';
import '../profile/profile.dart';
import 'champs_saisir_nom_carte.dart';
class btn_ajouter_cartes extends StatefulWidget {
  final String value;
  btn_ajouter_cartes({Key? key,required this.value}) : super(key: key);
  @override
  State<btn_ajouter_cartes> createState() => _btn_ajouter_cartesState();
}
class _btn_ajouter_cartesState extends State<btn_ajouter_cartes> {
  String Selectedcompanyid = "";
  List<String> companyIdList = [];
  String token = '';
  String userId = '';
  List<String> companynames = [];
  List<Company> listCompany = [];
  //bool isinputvisible = false;
  String? dropdownValue;
  String nameco = "";

  @override
  void initState() {
    getToken();
    getCompany();
    super.initState();
  }
  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token") ?? "";
      Map<String, dynamic> map = jsonDecode(prefs.getString("user").toString());
      // var userId = User.fromJson(map).id ?? "";
      this.userId = User.fromJson(map).id ?? "";
      print('token is $token');
      print('userId is $userId');
    });
    getCompany();
  }
  sendCard(String companyname, String barcode, String companyId, String userId) async {
    print('nameco $companyname+ comany id $companyId+barcode $barcode');
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      Map data = {
        "companyname":companyname,
        "barcode": barcode,
        "img": "",
        "userId": userId,
        "companyId": companyId
      };
      var param = json.encode(data);
      print('param is $param');
      // sending the request
      var response = await http.post(Uri.http(StaticValues.apiUrl, StaticValues.endpointCart), headers: header, body: param);
      if (response != null) {
        print('response is ' + response.body);
      }
      // verification itha el request raj3t b'resultat wla
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print('company is $jsonData');
      } else {
        throw Exception('Failed to load list');
      }
    } catch (e) {
      throw Exception('Failed to load list');
    }

  }

  Future<List<Company>> getCompany() async {
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      Map<String, Object> param = {
        "filter": jsonEncode({
          "include": ["company"]
        })
      };
      print('filter is ${jsonEncode({
        "include":["company"]
      })}');

      print('token getcompany is $token');
      var response = await http.get(Uri.http(StaticValues.apiUrl, StaticValues.endpointCompany), headers: header);
      if (response.statusCode == 200) {
       // companyIdList.insert(0, "0");
        var jsonData = jsonDecode(response.body);
        print('company is $jsonData');
        for (var no in jsonData) {
          setState(() {
            listCompany.add(Company.fromJson(no));
          });
          print('json is ${Company.fromJson(no)}');
        }
        for (var c in listCompany) {
          companynames.add(c.name!);
          companyIdList.add(c.id!);
        }
        return listCompany;
      } else {
        throw Exception('Failed to load list');
      }
    } catch (e) {
      throw Exception('Failed to load list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.circular(34.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                        value:dropdownValue,
                        isExpanded: true,
                        iconSize: 36,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        items:companynames.map(buildMenuItem).toList(),
                        onChanged: (value) {
                          print('new value is $value');
                          setState(() {
                            Selectedcompanyid =companyIdList[
                            companynames.indexOf(value.toString())];
                            nameco = value.toString();
                            dropdownValue = value.toString();
                          });
                        }),
                  )
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: 63,
          decoration: BoxDecoration(
            color: Color(0xff8E97FD),
            borderRadius: BorderRadius.all(
              Radius.circular(
                38.0,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                //flex:6,
                  child: Container(
                    //alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        if(dropdownValue==null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please check....")));
                          return;
                        }
                        else {
                          sendCard(nameco,widget.value,Selectedcompanyid,this.userId);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => profile(),
                            ),
                                (route) => false,
                          );
                        }
                      },
                      child: Text(
                        'Enregistrer la carte',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xffF6F1FB),
                              fontSize: 14,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
        value: item,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            item,
          ),
        ));
  }
}

