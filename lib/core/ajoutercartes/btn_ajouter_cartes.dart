import 'package:flutter/material.dart';
import 'image_button.dart';
String _selectedimg="assets/noimg.png";

class btn_ajouter_cartes extends StatefulWidget {
  const btn_ajouter_cartes({Key? key}) : super(key: key);
  @override
  State<btn_ajouter_cartes> createState() => _btn_ajouter_cartesState();
}
class _btn_ajouter_cartesState extends State<btn_ajouter_cartes> {
  String ? _select;
  List<Map> _myJson = [
  {"id": '1', "image": "assets/carrfour.png", "name": "carrefour"},
{"id": '2', "image": "assets/cartfiid.png", "name": "cartfiid"},
{"id": '3', "image": "assets/moneprix.png", "name": "monoprix"},
];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          margin:EdgeInsets.all(30),
          decoration: BoxDecoration(
              border: Border.all(width:1, color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.circular(34.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                      isDense: true,
                        hint: new Text("autre"),
                          value: _select,
                    onChanged: (String? newValue) {
                      setState(() {
                        _select = newValue;
                        if(newValue=="1"){
                          _selectedimg="assets/carrfour.png";
                        }
                        else if(newValue=="2"){
                          _selectedimg="assets/cartfiid.png";
                        }
                        else if(newValue=="3"){
                          _selectedimg="assets/moneprix.png";
                        }
                        else{
                          _selectedimg="assets/noimg.png";
                        }
                      });
                      print(newValue);
                    },
                      items: _myJson.map((Map map) {
                      return new DropdownMenuItem<String>(
                        value: map["id"].toString(),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              map["image"],
                              width: 25,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(map["name"])),
                          ],

                        ),

                      );
                      }).toList(),
              ))
        )
              ),
            ],

          ),
        ),

     Image.asset(_selectedimg,fit: BoxFit.cover,height: 100,),

        //img_btn(imgpath:_selectedimg,),
      ],
    );
  }
}
