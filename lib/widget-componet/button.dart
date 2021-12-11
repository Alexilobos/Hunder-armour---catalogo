import 'dart:ui';

import 'package:flutter/material.dart';

class WidgetButton extends StatefulWidget {
  WidgetButton({Key? key,
    required this.imagenbutton,
    required this.label,
    required this.onclick,
  }) : super(key: key);

  final String imagenbutton;
  final String label;
  final Function() onclick;
  @override
  _WidgetButtonState createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onclick,
      child: Container(
        //padding: EdgeInsets.only(top: 100.0),
        width: 180.0,
        height: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          image: DecorationImage(
            image: AssetImage(widget.imagenbutton),//NetworkImage(widget.imagenbutton),
          )
        ),
        child: Container(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0,),
              child: Container(
                width: 160.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                  color: Colors.grey.shade200.withOpacity(0.5)
                ),
                child: Center(
                  child: Text(
                    widget.label,
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}