import 'package:cartefid/core/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
class headerprofile extends StatefulWidget {
  headerprofile({Key? key}) : super(key: key);

  @override
  State<headerprofile> createState() => _headerprofileState();
}
class _headerprofileState extends State<headerprofile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical:20),
      child: Row(
        children: [
           InkWell(
            onTap: () {
              //Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 0,
                      top: 10,
                      bottom: 10,
                    ),
                    child: FloatingActionButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Color(0xFFEBEAEC)),
                      ),
                      backgroundColor: Colors.white,
                      onPressed: () {
                    /*    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => profile(),
                          ),
                        );*/
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Mon Profil',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color(0xFF3F414E),
                    //  letterSpacing: .5,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
