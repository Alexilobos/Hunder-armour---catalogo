import 'package:flutter/material.dart';
import 'package:frontend_under_armour/models/products.dart';

import 'widget-componet/utils.dart';

class DetailProduct extends StatelessWidget {
  final Products product;

  DetailProduct({required this.product});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                  ),
                  Text(
                    product.nombre,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Datos",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    contentPadding: EdgeInsetsDirectional.only(start: 100.0),
                    leading: Icon(
                      Icons.paid,
                      color: Colors.green,
                    ),
                    title: Text("Bs: " + product.precio.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    contentPadding: EdgeInsetsDirectional.only(start: 100.0),
                    leading: Icon(
                      Icons.outbond,
                      color: Colors.green,
                    ),
                    title: Text("Talla: " + product.talla,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    contentPadding: EdgeInsetsDirectional.only(start: 50.0),
                    leading: Icon(
                      Icons.shield,
                      color: Colors.blueGrey[900],
                    ),
                    title: Text(
                      "Def: " + product.descripcion,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Colores",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: FilterChip(
                          shape: StadiumBorder(side: BorderSide()),
                          backgroundColor:
                              UtilsColors.getBackgroundColor(product.color1),
                          label: Text(product.color1,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          selected: false,
                          onSelected: (bool value) {},
                        ),
                      ),
                      Container(
                        child: FilterChip(
                          shape: StadiumBorder(side: BorderSide()),
                          backgroundColor:
                              UtilsColors2.getBackgroundColor(product.color2),
                          label: Text(product.color2,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          selected: false,
                          onSelected: (bool value) {},
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: Image.network(product.imagen),
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.imagen))),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      //UtilsColors.getBackgroundColor(pokemon.type1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey[900],
        //UtilsColors.getBackgroundColor(pokemon.type1),
        title: Text(
          "Detail Product",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: bodyWidget(context),
    );
  }
}
