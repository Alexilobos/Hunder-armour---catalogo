import 'package:flutter/material.dart';

import 'newlogin.dart';

class LoginHome extends StatefulWidget {
  LoginHome({Key? key}) : super(key: key);

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  TextStyle style = TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
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

    final passwordField = TextField(
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
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
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
          context,MaterialPageRoute(builder: (context) => SingUp())
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