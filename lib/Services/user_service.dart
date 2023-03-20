import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:omega_app/Models/user.dart';
import 'package:omega_app/Services/WebClient.dart';

class UserService{
   String url = WebClient.url;
   http.Client client = WebClient().client;
   static const resource = "/user";


   String getUrl(){
      return "$url$resource";
   }

   Future<List<User>> getAll() async{
      final response = await http.get(Uri.parse(
         getUrl()
         ,),
         );

      if(response.statusCode != 200){
         throw HttpException(response.body);
      }

      List<User> list = [];
      List<dynamic> decodedList = jsonDecode(response.body);

      for(var jsonMap in decodedList){
         list.add(User.fromJson(jsonMap));
      }

      return list;

   }


}