class NotificationList {
  String? name;
  String? img;
  String? date;
  String? descr;
  String? userId;

  NotificationList({this.name, this.img, this.date, this.descr, this.userId});

  NotificationList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    date = json['date'];
    descr = json['descr'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['img'] = this.img;
    data['date'] = this.date;
    data['descr'] = this.descr;
    data['userId'] = this.userId;
    return data;
  }
}
