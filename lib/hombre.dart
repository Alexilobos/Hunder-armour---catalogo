import 'package:flutter/material.dart';
import 'principal.dart';

class Hombre extends StatefulWidget {
  Hombre({Key? key}) : super(key: key);

  @override
  _HombreState createState() => _HombreState();
}

class _HombreState extends State<Hombre> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: CuerpoHombre(),
      ),
    );
  }
}

class CuerpoHombre extends StatefulWidget {
  CuerpoHombre({Key? key}) : super(key: key);

  @override
  _CuerpoHombreState createState() => _CuerpoHombreState();
}

class _CuerpoHombreState extends State<CuerpoHombre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=> Navigator.push(
            context,MaterialPageRoute(builder: (context){return Principal();})
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text("Under Armour",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            GestureDetector(
              child: Text("Hombre",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
        /*const Text(
          "Under Armour",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),*/
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: ImageIcon(
              AssetImage('assets/ui/LogoUnder.png'),
            ),
          ),
        ],
      ),
      body: Container(
        /*decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/FondoNavegations.png"),
            fit: BoxFit.cover,
          ),
        ),*/
        child:Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50), 
                child: OutlinedButton(
                  child: Text("Zapatillas"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.red[400],
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {}
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40), 
                child: OutlinedButton(
                  child: Text("Poleras"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.red[400],
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {}
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40), 
                child: OutlinedButton(
                  child: Text("Pantalones"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.red[400],
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {}
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40), 
                child: OutlinedButton(
                  child: Text("Accesorios"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.red[400],
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {}
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}