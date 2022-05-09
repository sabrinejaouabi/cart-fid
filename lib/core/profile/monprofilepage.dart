  import 'package:cartefid/core/profile/buttonprofile.dart';
import 'package:cartefid/core/profile/formprofile.dart';
import 'package:cartefid/core/profile/headerprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/header.dart';
class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
           // headerprofile(),
              header(),
              SizedBox(
                height: 10,
              ),
              formprofil(),
              SizedBox(
                height: 180,
              ),
              buttnprofile(),

            ],
          ),
        ),
      ),

    );
  }
}
