
import 'package:flutter/material.dart';
import 'package:frontend_under_armour/detailproduct.dart';
import 'package:frontend_under_armour/models/products.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key? key, required this.product}) : super(key: key);

  final Products product;
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailProduct(product: widget.product)),
        );
      },
      child: Container(
          width: 135.0,
          height: 110.0,
          margin: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 150.0,
                  height: 160.0,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0, bottom: 35.0),
                      child: Text(
                        widget.product.nombre,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ),
              Align(
                alignment: Alignment(0.10, -0.50),
                child: Image.network(
                  widget.product.imagen,
                  width: 80,
                ),
              ),
            ],
          )),
    );
  }
}