import 'dart:convert';

import 'package:playgames/models/responce.dart';
import 'package:http/http.dart' as http;
class Api{

  Future getData()async{
    final url="https://pub.gamezop.com/v3/games?id=3443";
    final uri=Uri.parse(url);
    final responce=await http.get(uri);
    
    final json=jsonDecode(responce.body);
    print("bodyyyyy $json");
    final  data=json["games"] as List;
    print("hhhhhhhh $data");
     final result=data.map((e) {
    return Games.fromJson(e);
     }).toList();
     return result;
  }
}