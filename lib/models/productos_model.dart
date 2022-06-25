import 'dart:convert';

List<Producto> productoFromJson(String str) => List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
    Producto({
      required this.id,
      required this.nombre,
      required this.descripcion,
      required this.precio,
      required this.img,
    });

    final String id;
    final String nombre;
    final String descripcion;
    final String precio;
    final String img;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "img": img,
    };
}
