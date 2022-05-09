import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class reset_screen extends StatefulWidget {
  const reset_screen({Key? key}) : super(key: key);

  @override
  State<reset_screen> createState() => _reset_screenState();
}

TextEditingController _emailController = new TextEditingController();

class _reset_screenState extends State<reset_screen> {
           //String? _email;
            final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    height: 90,
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                    obscureText: false,
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Adresse email",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        letterSpacing: .5,
                        fontSize: 16,
                      ),
                      fillColor: Color(
                        0xfff3f3f4,
                      ),
                      filled: true,
                    ),
    /*onChanged: (value) {
      setState(() {
        _email = value.trim();
      });
    }*/
                  ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                  child:Text('reset pass'),
                  onPressed: (){
                    auth.sendPasswordResetEmail(email:_emailController.text )
                        .then((value) =>Navigator.of(context).pop());

                  })
            ],
          )
                ]),
          ),
        ),
      ),
    );
  }
}
