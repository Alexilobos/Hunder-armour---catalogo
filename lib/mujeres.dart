import 'package:flutter/material.dart';
import 'package:frontend_under_armour/hombre.dart';
import 'principal.dart';
import 'productwidget.dart';

class Mujer extends StatefulWidget {
  Mujer({Key? key}) : super(key: key);

  @override
  _MujerState createState() => _MujerState();
}

class _MujerState extends State<Mujer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: CuerpoMujer(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CuerpoMujer extends StatefulWidget {
  CuerpoMujer({Key? key}) : super(key: key);

  @override
  _CuerpoHombreState createState() => _CuerpoHombreState();
}

class _CuerpoHombreState extends State<CuerpoMujer> {
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
              child: Text("Mujer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/FondoMujer.png"),
            fit: BoxFit.cover,
          ),
        ),
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
                    backgroundColor: Colors.black87,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsWidget(tipoproducto: ZAPATO,generoproducto: 1,)),       
                    );
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40), 
                child: OutlinedButton(
                  child: Text("Poleras"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.black87,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsWidget(tipoproducto: POLERAS,generoproducto: 1,)),       
                    );
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40), 
                child: OutlinedButton(
                  child: Text("Pantalones"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.black87,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsWidget(tipoproducto: PANTALONES,generoproducto: 1,)),       
                    );
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40), 
                child: OutlinedButton(
                  child: Text("Accesorios"),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(200,80),
                    primary: Colors.white,
                    backgroundColor: Colors.black87,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsWidget(tipoproducto: ACCESORIOS,generoproducto: 1,)),       
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