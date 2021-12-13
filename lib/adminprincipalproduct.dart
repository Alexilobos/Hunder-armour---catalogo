import 'package:flutter/material.dart';

import 'admin.dart';
import 'adminproduct.dart';
import 'models/apiservice.dart';
import 'models/products.dart';

class AdminPrincipalProduct extends StatefulWidget {
  AdminPrincipalProduct({Key? key}) : super(key: key);

  @override
  _AdminPrincipalProductState createState() => _AdminPrincipalProductState();
}

class _AdminPrincipalProductState extends State<AdminPrincipalProduct> {
  ApiService service = ApiService();

  late Future<List<Products>> futureproducts;
  void initState() {
    super.initState();
    futureproducts = service.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminPrincipal(), //
                  )),
            ),
            backgroundColor: Colors.grey[700],
            title: Text(
              "Administrador",
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
              child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: OutlinedButton(
                      child: Text("Agregar"), //
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(200, 80),
                        primary: Colors.white,
                        backgroundColor: Colors.black45,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminProduct()));
                      }),
                ),
                Expanded(
                  child: Container(
                    child: FutureBuilder<List<Products>>(
                      future: futureproducts,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              Products product = snapshot.data[index];
                              return Container(
                                  height: 50,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(left: 80.0)),
                                      Container(
                                        child: Text(product.nombre,
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center),
                                      ),
                                      TextButton(
                                          onPressed: () => {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Center(
                                                        child: Text('Alerta'),
                                                      ),
                                                      content: Text(
                                                          '¿Está seguro que desea eliminarlo?'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child:
                                                              Text('Aceptar'),
                                                          onPressed: () {
                                                            deleteData(snapshot
                                                                .data!.id);
                                                            setState(() {
                                                              futureproducts =
                                                                  service
                                                                      .getAllProducts();
                                                            });
                                                            Navigator.pop(
                                                                context, false);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child:
                                                              Text('Cancelar'),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context, false);
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                )
                                              },
                                          child: Text('Eliminar'))
                                    ],
                                  ));
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error");
                        }
                        return Center(child: Text("Loading..."));
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
