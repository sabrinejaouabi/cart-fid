import 'dart:core';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationList{
 final String? name;
 final String?img;
 final int? date;
 final String?descr;
 final String?id;

  NotificationList(
      {this.name,
       this.img,
      this.date,
      this.descr,
       this.id}
      );
 factory  NotificationList.fromJson(Map<String, dynamic> json) {
   return  NotificationList(
     name: json['name'],
     img: json['img'],
     date: json['date'] as int,
     descr: json['descr'],
     id: json['id'],

   );
 }
}


