//package:flutter/foundation.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../select_gen.dart';
import 'products.dart';
import 'package:http/http.dart' as http;

final String url = "https://backendfinalunderarmour.azurewebsites.net/api/Items/";

class ApiService {
  Future<List<Products>> getData(String tipo, int genero) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    List<Products> products = [];
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var jsonResponce = jsonDecode(response.body);

      for (var model in jsonResponce) {
        Products product = Products.fromJson(model);
        if (product.genero == genero || genero == MIXTO) {
          if (product.tipo == tipo || tipo == All) {
            products.add(product);
          }
        }
      }
      return products;
    } else {
      throw Exception('Error al llamar al API');
    }
  }

  Future<List<Products>> getAllProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    List<Products> products = [];
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var jsonResponce = jsonDecode(response.body);

      for (var model in jsonResponce) {
        Products product = Products.fromJson(model);

        products.add(product);
      }
      return products;
    } else {
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
*/
Future<Products> postData(Products product) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  Map data = {
    'id': 0,
    'genero': product.genero,
    'tipo': product.tipo,
    'nombre': product.nombre,
    'precio': product.precio,
    'color1': product.color1,
    'color2': product.color2
  };

  final response = await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data));

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    return Products.fromJson(jsonResponse);
  } else {
    throw Exception('Error al llamar al API');
  }
}

/*Future<void> updateData(Products product) async {
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
*/
Future<void> deleteData(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  await http.delete(Uri.parse(url+"/"+ id.toString()), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });
}