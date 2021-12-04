//package:flutter/foundation.dart
import 'dart:convert';
import '../hombre.dart';
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
  
  Future<List<Products>> getData(String tipo) async{
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type' : 'application/json',
      'Accept' : 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonResponce = jsonDecode(response.body);
      List<Products> products = [];
      for (var model in jsonResponce) {
        Products product = Products.fromJson(model);
        if (product.tipo == tipo || tipo == All) {
          products.add(product);
        }
      }
      return products;
    } else{
      throw Exception('Error al llamar al API');
    }
  }
}