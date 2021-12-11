import 'package:flutter/material.dart';
import 'package:frontend_under_armour/adminusuario.dart';

import 'adminproduct.dart';

class AdminPrincipal extends StatefulWidget {
  AdminPrincipal({Key? key}) : super(key: key);

  @override
  _AdminPrincipalState createState() => _AdminPrincipalState();
}

class _AdminPrincipalState extends State<AdminPrincipal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            leading: Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: ImageIcon(
                AssetImage('assets/ui/LogoUnder.png'),
              ),
            ),
            centerTitle: true,
            title: const Text(
              "Administrador",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: Container(
            child:Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 160), 
                    child: OutlinedButton(
                      child: Text("Productos"),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(200,80),
                        primary: Colors.white,
                        backgroundColor: Colors.black45,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => AdminProduct())
                        );
                      }
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50), 
                    child: OutlinedButton(
                      child: Text("Usuarios"),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(200,80),
                        primary: Colors.white,
                        backgroundColor: Colors.black45,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => AdminUsuario())
                        );
                      }
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


