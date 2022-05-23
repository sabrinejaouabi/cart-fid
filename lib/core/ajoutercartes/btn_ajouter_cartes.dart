import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/itemDrop.dart';
import 'champs_saisir_nom_carte.dart';

class btn_ajouter_cartes extends StatefulWidget {
  btn_ajouter_cartes(this.callBack,{Key? key}) : super(key: key);
  Function(ItemDrop itemDrop) callBack;
  @override
  State<btn_ajouter_cartes> createState() =>_btn_ajouter_cartesState();
}
class _btn_ajouter_cartesState extends State<btn_ajouter_cartes> {
  List<ItemDrop> _myJson = [
    ItemDrop(id: '1', image: "assets/carrfour.png", name: "carrefour"),
    ItemDrop(id: '2', image: "assets/cartfiid.png", name: "cartfiid"),
    ItemDrop(id: '3', image: "assets/moneprix.png", name: "monoprix"),
    ItemDrop(id: '4', image: "assets/cartfiid.png", name: "Autre"),
  ];
  String _selectedimg="assets/noimg.png";
  ItemDrop? itemSelect;
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
                      child: DropdownButton<ItemDrop>(
                        isDense: true,
                        hint: const Text("select la carte"),
                        value: itemSelect,
                        onChanged: (ItemDrop? newValue) {
                          setState(() {
                            widget.callBack(newValue!);
                            itemSelect = newValue;
                            if(itemSelect!.id=="1"){
                              _selectedimg="assets/carrfour.png";
                            }
                            else if(itemSelect!.id=="2"){
                              _selectedimg="assets/cart.png";
                            }
                            else if(itemSelect!.id=="3"){
                              _selectedimg="assets/moneprix.png";
                            }
                            else{
                              _selectedimg="assets/cart.png";
                            }
                          });
                          print(newValue);

                        },
                        items: _myJson.map((ItemDrop map) {
                          return DropdownMenuItem<ItemDrop>(
                            value: map,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  map.image!,
                                  width: 25,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(map.name!)),
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

        Card(
            elevation:6,
            shadowColor: Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              _selectedimg,
              fit:BoxFit.cover,
              height: 100,
              width: 250,
              alignment:Alignment.center,
            )
        ),

      ],
    );

  }
}