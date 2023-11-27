import 'package:aplicacion/src/controller/controller_list.dart';
import 'package:aplicacion/src/models/producto_modelo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemProducto extends StatelessWidget {
  final ProductoModelo producto;
  const ItemProducto({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorFondoValido = const Color.fromARGB(255, 118, 201, 216);
    Color colorFondoNoValido = const Color.fromARGB(255, 253, 104, 93);

    Color color = producto.disponible ? colorFondoValido : colorFondoNoValido;
    IconData icono = producto.disponible ? Icons.check : Icons.cancel;

    final ControllerList ctrProducto = Get.find();
    return Card(
      color: color,
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.green,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.edit),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.delete),
        ),
        onDismissed: ((direction) => {
              if (direction == DismissDirection.endToStart)
                {ctrProducto.delete(producto)}
              else
                {
                  Get.toNamed('producto', arguments: {
                    'id': producto.id,
                    'nombre': producto.nombre,
                    'precio': producto.precio,
                    'disponible': producto.disponible,
                  })
                }
            }),
        child: ListTile(
          title: Text(
            producto.nombre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Alinea los elementos al final y al principio.
            children: [
              Text(
                producto.precio.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                icono,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
