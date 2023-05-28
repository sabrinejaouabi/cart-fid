import 'package:flutter/material.dart';
import '../../components/header.dart';
import 'Mescartes.dart';
import 'Progressindicators.dart';
import 'button.dart';
class nouveauheaderprofil extends StatefulWidget {
  const nouveauheaderprofil({Key? key}) : super(key: key);

  @override
  State<nouveauheaderprofil> createState() => _nouveauheaderprofilState();
}

class _nouveauheaderprofilState extends State<nouveauheaderprofil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: SingleChildScrollView(
           child: Column(
            children: [
              header(),
              progin(),
              mescartes(),
              btn(),
            ],
        ),
         ),

        )


    );
  }
}
