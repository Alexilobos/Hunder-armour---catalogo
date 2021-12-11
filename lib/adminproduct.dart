import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'admin.dart';


class AdminProduct extends StatefulWidget {
  AdminProduct({Key? key}) : super(key: key);

  @override
  _AdminProductState createState() => _AdminProductState();
}

class _AdminProductState extends State<AdminProduct> {
  bool _isLoading = false;

  final TextEditingController generoController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController tallaController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController imagenController = TextEditingController();


  agregadoproduct(int precio ,String genero, tipo, nombre, color, talla, descripcion, imagen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = 'https://jwtcoreapi.azurewebsites.net/api/Authenticate/login';
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode({
          "genero": genero,
          "tipo": tipo,
          "nombre": nombre,
          "precio": precio,
          "color": color,
          "talla": talla,
          "descripcion": descripcion,
          "imagen": imagen,
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        var token = jsonResponse['token'];
        prefs.setString('token', token);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AdminProduct()),
            (Route<dynamic> route) => false);
      }
    } else {
      _alert('Login Error', 'Mensaje de error');
    }
    setState(() {
      _isLoading = false;
    });
  }

  _alert(String title, body) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(body),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          //backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=> Navigator.push(
                context,MaterialPageRoute(builder: (context){return AdminPrincipal();})
              ),
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 10.0),
                child: ImageIcon(
                  AssetImage('assets/ui/LogoUnder.png'),
                ),
              ),
            ],
            centerTitle: true,
            title: const Text(
              "Administrador",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child:  ListView(
                children: [
                  //const Icon(Icons.person, size: 200),
                  TextFormField(
                    controller: generoController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Genero',
                    ),
                  ),
                  TextFormField(
                    controller: tipoController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Tipo',
                    ),
                  ),
                  TextFormField(
                    controller: nombreController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                    ),
                  ),
                  TextFormField(
                    controller: precioController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Precio',
                    ),
                  ),
                  TextFormField(
                    controller: colorController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Color',
                    ),
                  ),
                  TextFormField(
                    controller: tallaController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Talla',
                    ),
                  ),
                  TextFormField(
                    controller: descripcionController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Descripcion',
                    ),
                  ),
                  TextFormField(
                    controller: imagenController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Imagen',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        agregadoproduct(
                          int.parse(precioController.text),
                          generoController.text,
                          tipoController.text,
                          nombreController.text,
                          colorController.text,
                          tallaController.text,
                          descripcionController.text,
                          imagenController.text,
                        );
                      },
                      child: const Text(
                        'Agregar',
                      )
                    )
                  ),
                ],
              ),
            ),
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
