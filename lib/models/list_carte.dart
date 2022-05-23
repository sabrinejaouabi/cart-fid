import 'dart:convert';
import 'dart:core';

Cartes CartesFromJson(String str) => Cartes.fromJson(json.decode(str));

String CartesToJson(Cartes data) => json.encode(data.toJson());

class Cartes{
  final int? barcode;
  final String?type;
  final String ?img;
  final String?id;

  Cartes({
    this.barcode,
    this.type,
    this.img,
    this.id
  });
  factory  Cartes.fromJson(Map<String, dynamic> json) {
    return Cartes(
      barcode: json['barcode'] as int,
      type: json['type'],
      img: json['img'],
      id: json['id'],
    );
  }
  Map<String, dynamic> toJson() => {
    "barcode":barcode,
    "type": type,
    "img":img,
    "id": id,
  };

}