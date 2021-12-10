import 'dart:convert';

import 'package:flutter/material.dart';
import 'login.dart';
import 'package:http/http.dart' as http;


class NewLogin extends StatefulWidget {
  NewLogin({Key? key}) : super(key: key);

  @override
  _NewLoginState createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  bool _isLoading = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  register(String name, email, pass) async {
    String url = '';
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": pass,
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginHome()),
            (Route<dynamic> route) => false);
      }
    } else {
      _alert('Register Error', 'Mensaje de error');
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

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final titleSignup = Column(
      children: [
        Text("Registro", style: TextStyle(color: Colors.white70,fontSize: 30, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Text("Crear una cuenta, Es Gratis!!",style: TextStyle(fontSize: 15, color: Colors.grey[400],),),
        SizedBox(height: 30,)
      ],
    );

    final emailFieldSingUp = TextFormField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "example@dominio.com",
        border: 
        OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );

    final passwordFieldSingUp = TextFormField(
      controller: passController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Contraseña",
        border: 
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );

    final usernameFieldSingUp = TextFormField(
      controller: usernameController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border: 
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );

    final loginButtonSingUp = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blueGrey[400],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          register(usernameController.text, emailController.text, passController.text);
        },
        child: Text("Registrar",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    final loginuser = TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,MaterialPageRoute(builder: (context) => LoginHome()),
          (Route<dynamic> route) => false
        );
      },
      child: Text(
        'Login user',
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
            context,MaterialPageRoute(builder: (context){return LoginHome();})
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: Image.asset('assets/ui/LogoUnder.png',
                    fit: BoxFit.contain,
                  ),
                ),
                titleSignup,
                SizedBox(height: 10.0),
                usernameFieldSingUp,
                SizedBox(height: 15.0),
                emailFieldSingUp,
                SizedBox(height: 15.0),
                passwordFieldSingUp,
                SizedBox(height: 15.0),
                loginButtonSingUp,
                SizedBox(height: 10.0),
                loginuser,
              ],
            ),
          ),
        ),
      ),
    );
  }
}