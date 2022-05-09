import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/end_users.dart';

const String userurl="";
class Usernetworkservice{
  Future<Enduser> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:3000/'));
    if (response.statusCode == 200) {
      return Enduser.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}