//package:flutter/foundation.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../select_gen.dart';
import 'products.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = "http://127.0.0.1:5000/products";

  /*final String production_server = ""
  final String development_server = "http://localhost:5000";
  Uri getUrl() {
      if (kDebugMode)
          return development_server
      else
          return Uri.parse(production_server)
  }
  getUrl()*/
  
  Future<List<Products>> getData(String tipo, int genero) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    List<Products> products = [];
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type' : 'application/json',
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var jsonResponce = jsonDecode(response.body);

      for (var model in jsonResponce) {
        Products product = Products.fromJson(model);
        if(product.genero == genero || genero == MIXTO)
        {
          if (product.tipo == tipo || tipo == All) {
            products.add(product);
          }
        }
      }
      return products;
    } else{
      throw Exception('Error al llamar al API');
    }
  }
}

/*Future<Products> getDataById(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(Uri.parse(url + id.toString()), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return Products.fromJson(jsonResponse);
    } else {
      throw Exception('Error al llamar al API');
    }
  }

Future<Products> postData(Products product) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  Map data = {'title': product.title, 'author': product.author};

  final response = await http.post(Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(data));

  if (response.statusCode == 201) {
    var jsonResponse = jsonDecode(response.body);
    return Products.fromJson(jsonResponse);
  } else {
    throw Exception('Error al llamar al API');
  }
}

Future<void> updateData(Products product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map data = {'id': product.id, 'title': product.title, 'author': product.author};

    await http.put(Uri.parse(url + product.id.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    body: jsonEncode(data));
}

Future<void> deleteData(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    await http.delete(Uri.parse(url + id.toString()), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }
}*/