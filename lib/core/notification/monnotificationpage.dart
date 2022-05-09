import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'header_notification.dart';
import 'listview_notification.dart';

class notificationpage extends StatefulWidget {
  const notificationpage({Key? key}) : super(key: key);

  @override
  State<notificationpage> createState() => _notificationpageState();
}
class _notificationpageState extends State<notificationpage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              headernotif(),
              SizedBox(
                height: 10,
              ),
              listviewnotification(),
            ],
          ),
        ),
      ),
    );
  }
}
