class CartItem {
  String? id;
  String? companyname;
  String? barcode;
  String? img;
  String? userId;
  String? companyId;
  Company? company;

  CartItem(
      {this.id,
        this.companyname,
        this.barcode,
        this.img,
        this.userId,
        this.companyId,
        this.company});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyname = json['companyname'];
    barcode = json['barcode'];
    img = json['img'];
    userId = json['userId'];
    companyId = json['companyId'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyname'] = this.companyname;
    data['barcode'] = this.barcode;
    data['img'] = this.img;
    data['userId'] = this.userId;
    data['companyId'] = this.companyId;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}
class Company {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? wh;
  double? lat;
  double? lng;
  String? img;

  Company(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.wh,
        this.lat,
        this.lng,
        this.img});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    wh = json['wh'];
    lat = json['lat'];
    lng = json['lng'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['wh'] = this.wh;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['img'] = this.img;
    return data;
  }
}
