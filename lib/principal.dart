import 'package:flutter/material.dart';
import 'hombre.dart';
import 'login.dart';
import 'mujeres.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: ElementoCuerpo(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ElementoCuerpo extends StatefulWidget {
  ElementoCuerpo({Key? key}) : super(key: key);

  @override
  _ElementoCuerpoState createState() => _ElementoCuerpoState();
}

class _ElementoCuerpoState extends State<ElementoCuerpo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          padding: const EdgeInsets.only(left: 10.0),
          child: ImageIcon(
            AssetImage('assets/ui/LogoUnder.png'),
          ),
        ),
        title: const Text(
          "Under Armour",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            color: Colors.black87,
            icon: Icon(Icons.menu),
            padding: const EdgeInsets.only(right: 10.0),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Container(
                  color: Colors.grey[900],
                  child: TextButton(
                    child: Text("Perfil"),
                      onPressed: () {
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => LoginHome())
                        );
                      },
                  ),
                ),
              ),
              PopupMenuItem(
                child: Container(
                  color: Colors.grey[900],
                  child: TextButton(
                    child: Text("Prueba"),
                      onPressed: () {},
                  ),
                ),
              ),
            ]
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/FondoPrincipal.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 160), 
                child: OutlinedButton(
                  child: Text("Hombres"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.black87,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Hombre())
                    );
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50), 
                child: OutlinedButton(
                  child: Text("Mujeres"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.black87,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Mujer())
                    );
                  }
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}