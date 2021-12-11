import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'newlogin.dart';
import 'principal.dart';
import 'package:http/http.dart' as http;

class LoginHome extends StatefulWidget {
  LoginHome({Key? key}) : super(key: key);

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  bool _isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  login(String email, pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = 'http://127.0.0.1:5000/users';
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode({
          "email": email,
          "password": pass,
        })
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        var token = jsonResponse['token'];
        prefs.setString('token', token);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Principal()),
            (Route<dynamic> route) => false
        );
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


  TextStyle style = TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "example@dominio.com",
        border: 
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final passwordField = TextFormField(
      controller: passController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Contraseña",
        border: 
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueGrey[400],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          login(emailController.text, passController.text);
        },
        child: Text("Acceder",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    final newAccount = TextButton(
      onPressed: () {
        Navigator.push(
          context,MaterialPageRoute(builder: (context) => NewLogin())
        );
      },
      child: Text(
        'Crear Cuenta',
      ),
      style: TextButton.styleFrom(
        primary: Colors.blue[100],
        textStyle: TextStyle(
          fontFamily: 'Montserrat', fontSize: 13.0, fontWeight: FontWeight.bold
        )
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=> Navigator.push(
            context,MaterialPageRoute(builder: (context){return Principal();})
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset('assets/ui/LogoUnder.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 35.0),
                loginButton,
                SizedBox(height: 15.0),
                newAccount,
              ],
            ),
          ),
        ),
      ),
    );
  }
}