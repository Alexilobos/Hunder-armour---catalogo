import 'package:flutter/material.dart';
import 'package:frontend_under_armour/models/products.dart';
import 'cartas.dart';
import 'hombre.dart';
import 'models/apiservice.dart';

class ProductsWidget extends StatefulWidget {
  ProductsWidget({
    Key? key,
    required this.tipoproducto,
  }) : super(key: key);

  final String tipoproducto;
  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  ApiService service = ApiService();
  late Future<List<Products>> futureproducts;  
  
  @override
  void initState(){
    super.initState();
    futureproducts = service.getData(widget.tipoproducto);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=> Navigator.push(
                context,MaterialPageRoute(builder: (context){return Hombre();})
              ),
            ),
            backgroundColor: Colors.grey[700],
            title: Text("Zapatillas", 
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
            child: FutureBuilder<List<Products>>(
              future: futureproducts,
              builder:  (context, AsyncSnapshot snapshot){
                print("Soy snapshot.data");
                print(snapshot.data);
                if(snapshot.hasData){
                  return GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10, //espacio cuadro entre lados
                      mainAxisSpacing: 10,  //espacio cuadro de arriba a bajo
                      //CardWidget()
                    ),
                    itemBuilder: (context, index) {
                      Products product = snapshot.data[index];
                        return CardWidget(
                          product: product,
                        );
                    },
                  );
                } else if(snapshot.hasError) {
                  return Text("Error");
                }
                return Center(child:  Text("Loading..."));
              },
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
