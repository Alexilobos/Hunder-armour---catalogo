import 'package:flutter/material.dart';
import 'package:frontend_under_armour/widget-componet/button.dart';
import 'select_gen.dart';
import 'login.dart';

const IMAHOMBREPRINC = "assets/background/HombrePrincipal.png";
const IMAMUJERPRINC = "assets/background/MujerPrincipal.png";

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
                    child: Text("Admin"),
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
              Padding(
                padding: EdgeInsets.only(top: 80.0),
              ),
              WidgetButton(imagenbutton: IMAHOMBREPRINC,label: "Hombre",onclick: () => {Navigator.push(context,MaterialPageRoute(builder: (context) => SelectGenero(generoprincipal: GENHOMBRE)))}),
              Padding(
                padding: EdgeInsets.only(top: 80.0),
              ),
              WidgetButton(imagenbutton: IMAMUJERPRINC,label: "Mujer",onclick: () => {Navigator.push(context,MaterialPageRoute(builder: (context) => SelectGenero(generoprincipal: GENMUJER)))}),
              
            ],
          ),
        )
      ),
    );
  }
}


/*Container(
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
                      context,MaterialPageRoute(builder: (context) => SelectGenero(generoprincipal: GENHOMBRE,))
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
                      context,MaterialPageRoute(builder: (context) => SelectGenero(generoprincipal: GENMUJER,))
                    );
                  }
                ),
              ),*/