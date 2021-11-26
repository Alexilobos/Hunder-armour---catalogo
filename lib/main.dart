import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Under Armour",
        home: Container(
          child: Inicio(),
        )
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/FondoPresentacion.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: (){
            print("Hola soy la presentacion");
          },
          //child: ,
        ),
      ),
    );
  }
}
