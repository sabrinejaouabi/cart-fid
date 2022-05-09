import 'package:cartefid/core/ajoutercartes/image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../components/header_acceuil.dart';
import 'btn_ajouter_cartes.dart';
import 'buton_enr_cartes.dart';
import 'champs_saisir_nom_carte.dart';
import 'codescann.dart';
import 'headeracceuilajoutercartes.dart';
class monacceuil extends StatefulWidget {

   monacceuil ({Key? key, this.value}) : super(key: key);
   String? value;
  @override
  State<monacceuil> createState() => _monacceuilState();
}
class _monacceuilState extends State<monacceuil> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             // headeracceuil(),
              headeracc(),
              SizedBox(
                height: 10,
              ),
              codescann(value: widget.value),
              SizedBox(
                height: 10,
              ),
              btn_ajouter_cartes(),

              saisir_nom_carte(),
              SizedBox(
                height: 10,
              ),

              btn_enregister_button(),
            ],
          ),
        ),
      ),
    );
  }
}
