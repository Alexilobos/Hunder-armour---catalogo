import 'package:flutter/material.dart';
import 'package:frontend_under_armour/adminusuario.dart';

import 'admin.dart';

class AdminPrincipalUsuario extends StatefulWidget {
  AdminPrincipalUsuario({Key? key}) : super(key: key);

  @override
  _AdminPrincipalProductState createState() => _AdminPrincipalProductState();
}

class _AdminPrincipalProductState extends State<AdminPrincipalUsuario> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminPrincipal(), //
                  )),
            ),
            backgroundColor: Colors.grey[700],
            title: Text(
              "Administrador",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 15.0),
                child: ImageIcon(
                  AssetImage('assets/ui/LogoUnder.png'),
                ),
              ),
            ],
            centerTitle: true,
          ),
          body: Container(
              child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 160),
                  child: OutlinedButton(
                      child: Text("Agregar"), //
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 80),
                        primary: Colors.white,
                        backgroundColor: Colors.black45,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminUsuario())); //
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: OutlinedButton(
                      child: Text("Usuarios"),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 80),
                        primary: Colors.white,
                        backgroundColor: Colors.black45,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminUsuario())); //sss
                      }),
                ),
              ],
            ),
          )),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
