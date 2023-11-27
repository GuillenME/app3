class ProductoModelo {
  String? id;
  String nombre;
  double precio;
  bool disponible;

  ProductoModelo({
    this.id,
    required this.nombre,
    required this.precio,
    required this.disponible,
  });

  factory ProductoModelo.fromJson(Map<String, dynamic> json) => ProductoModelo(
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
        disponible: json["disponible"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "disponible": disponible,
      };
}
