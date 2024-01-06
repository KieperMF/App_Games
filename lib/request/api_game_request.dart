// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:games_list/models/game_model.dart';
import 'package:games_list/models/url_base.dart';
import 'package:http/http.dart' as http;

Games? gameSelec;
class GamesRequest extends ChangeNotifier{
  List<Games>? games;
  List<String>? categories;
  UrlBase urlBase = UrlBase();
  int i = 1;

  Future<void> request() async{
    try{
      Uri uri = Uri.parse(urlBase.url);
      final response = await http.get(uri);
      final decode = jsonDecode(response.body) as List;
      games = decode.map((json) => Games.fromJson(json)).toList();
      while(games!.length >= i){
        categories = games![i].categories;
        i++;
      }
      notifyListeners();
    }catch(e){
      print("Erro$e");
    }
  }
}