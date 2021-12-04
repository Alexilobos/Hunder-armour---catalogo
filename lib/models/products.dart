class Products {
  String color = "";
  int genero = -1;
  int id = -1;
  String imagen = "";
  String nombre = "";
  int precio = -1;
  String talla = "";
  String tipo = "";

  Products(
      {this.color = "",
      this.genero = -1,
      this.id = -1,
      this.imagen = "",
      this.nombre = "",
      this.precio = -1,
      this.talla = "",
      this.tipo = ""}
  );

  Products.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    genero = json['genero'];
    id = json['id'];
    imagen = json['imagen'];
    nombre = json['nombre'];
    precio = json['precio'];
    talla = json['talla'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['genero'] = this.genero;
    data['id'] = this.id;
    data['imagen'] = this.imagen;
    data['nombre'] = this.nombre;
    data['precio'] = this.precio;
    data['talla'] = this.talla;
    data['tipo'] = this.tipo;
    return data;
  }
}