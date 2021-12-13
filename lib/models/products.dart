class Products {
  String color1 = "";
  String color2 = "";
  int genero = -1;
  int id = -1;
  String imagen = "";
  String nombre = "";
  int precio = -1;
  String talla = "";
  String tipo = "";
  String descripcion = "";

  Products({
    this.color1 = "",
    this.color2 = "",
    this.genero = -1,
    this.id = -1,
    this.imagen = "",
    this.nombre = "",
    this.precio = -1,
    this.talla = "",
    this.tipo = "",
    this.descripcion = "",
  });

  Products.fromJson(Map<String, dynamic> json) {
    color1 = json['color1'];
    color2 = json['color2'];
    genero = json['genero'];
    id = json['id'];
    imagen = json['imagen'];
    nombre = json['nombre'];
    precio = json['precio'];
    talla = json['talla'];
    tipo = json['tipo'];
    descripcion = json['descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color1'] = this.color1;
    data['color2'] = this.color2;
    data['genero'] = this.genero;
    data['id'] = this.id;
    data['imagen'] = this.imagen;
    data['nombre'] = this.nombre;
    data['precio'] = this.precio;
    data['talla'] = this.talla;
    data['tipo'] = this.tipo;
    data['descripcion'] = this.descripcion;
    return data;
  }
}
