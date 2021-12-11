import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'admin.dart';

class AdminUsuario extends StatefulWidget {
  AdminUsuario({Key? key}) : super(key: key);

  @override
  _AdminUsuarioState createState() => _AdminUsuarioState();
}

class _AdminUsuarioState extends State<AdminUsuario> {
  bool _isLoading = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  agregadoproduct(String username, email, passw) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = 'https://jwtcoreapi.azurewebsites.net/api/Authenticate/login';
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": passw,
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        var token = jsonResponse['token'];
        prefs.setString('token', token);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AdminUsuario()),
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
              padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child:  ListView(
                children: [
                  //const Icon(Icons.person, size: 200),
                  TextFormField(
                    controller: usernameController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
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
                          usernameController.text,
                          emailController.text,
                          passwordController.text,
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
