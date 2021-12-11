import 'package:flutter/material.dart';
import 'principal.dart';
import 'widget-componet/button.dart';
import 'widget-componet/productwidget.dart';

const All = 'all';
const ZAPATO = 'zapato';
const POLERAS = 'polera';
const PANTALONES = 'pantalon';
const ACCESORIOS = 'accesorio';

const GENHOMBRE = 0;
const GENMUJER = 1;
const MIXTO = 2;

const IMAHOMBREZAPATO = "assets/background/HombreZapato.png";
const IMAMUJERZAPATO = "assets/background/MujerZapato.png";
const IMAHOMBREPOLERA = "assets/background/HombrePolera.png";
const IMAMUJERPOLERA = "assets/background/MujerPolera.png";
const IMAHOMBREPANTALON = "assets/background/HombrePantalon.png";
const IMAMUJERPANTALON = "assets/background/MujerPantalon.png";
const IMAHOMBREACCESORIO = "assets/background/HombreAccesorio.png";
const IMAMUJERACCESORIO = "assets/background/MujerAccesorio.png";

//const HOMBREIMA = "";
//const MUJERIMA = "";

class SelectGenero extends StatefulWidget {
  SelectGenero({Key? key,
    required this.generoprincipal,
    //required this.imageprincipal,
  }) : super(key: key);
  
  final int generoprincipal;
  //final String imageprincipal;
  @override
  _SelectGeneroState createState() => _SelectGeneroState();
}

class _SelectGeneroState extends State<SelectGenero> {
  /*
  // Funcionamiento de un ternario
  // condicion ? verdadero : falso;

  String getAccesorio() {
    // Operacion larga
    // String imagenAUsar = IMAHOMBREACCESORIO;
    // if (widget.generoprincipal == GENMUJER) {
    //   imagenAUsar = IMAMUJERACCESORIO;
    // }
    // return imagenAUsar;
    //
    // Mismo de arriba pero mas resumido
    //
    if (widget.generoprincipal == GENMUJER)
      return IMAMUJERACCESORIO;
    return IMAHOMBREACCESORIO;
  }

  // Funcion lambda
  // Funcion de flecha
  // String getZapatos() => widget.generoprincipal == GENMUJER ? IMAMUJERZAPATO : IMAHOMBREZAPATO;
  String getZapatos() {
    // Funcion tradicional con ternario
    return widget.generoprincipal == GENMUJER ? IMAMUJERZAPATO : IMAHOMBREZAPATO;
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=> Navigator.push(
                context,MaterialPageRoute(builder: (context){return ElementoCuerpo();})
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
                  child: Text(widget.generoprincipal == GENHOMBRE? "Hombre": "Mujer",
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
                image: AssetImage("assets/background/FondoApartado.png"),
                fit: BoxFit.cover,
              ),
            ),
            child:Center(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  WidgetButton(
                    imagenbutton: widget.generoprincipal == GENMUJER ? IMAMUJERZAPATO : IMAHOMBREZAPATO, //widget.generoprincipal == GENMUJER ? IMAMUJERZAPATO : IMAHOMBREZAPATO,
                    label: "Zapatillas",
                    onclick: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => 
                        ProductsWidget(tipoproducto: ZAPATO,generoproducto: widget.generoprincipal)
                      ))}),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  WidgetButton(
                    imagenbutton: widget.generoprincipal == GENMUJER ? IMAMUJERPOLERA : IMAHOMBREPOLERA,
                    label: "Poleras",
                    onclick: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => 
                        ProductsWidget(tipoproducto: POLERAS,generoproducto: widget.generoprincipal)
                      ))}),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  WidgetButton(
                    imagenbutton: widget.generoprincipal == GENMUJER ? IMAMUJERPANTALON : IMAHOMBREPANTALON,
                    label: "Pantalones",
                    onclick: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => 
                        ProductsWidget(tipoproducto: PANTALONES,generoproducto: widget.generoprincipal)
                      ))}),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  WidgetButton(
                    imagenbutton: widget.generoprincipal == GENMUJER ? IMAMUJERACCESORIO : IMAHOMBREACCESORIO,
                    label: "Accesorios",
                    onclick: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => 
                        ProductsWidget(tipoproducto: ACCESORIOS,generoproducto: widget.generoprincipal,)
                      ))
                    }
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


/*Container(
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
                          MaterialPageRoute(builder: (context) => ProductsWidget(tipoproducto: ZAPATO,generoproducto: widget.generoprincipal,)),       
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
                          MaterialPageRoute(builder: (context) => ProductsWidget(tipoproducto: POLERAS,generoproducto: widget.generoprincipal,)),       
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
                          MaterialPageRoute(builder: (context) => ProductsWidget(tipoproducto: PANTALONES,generoproducto: widget.generoprincipal,)),       
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
                          MaterialPageRoute(builder: (context) => ProductsWidget(tipoproducto: ACCESORIOS,generoproducto: widget.generoprincipal,)),       
                        );
                      }
                    ),
                  ),*/