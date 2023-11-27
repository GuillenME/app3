import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Lista de productos'),
          onTap: () => Get.offNamed('listaProducto'),
        ),
        ListTile(
          title: const Text('Nuevo producto'),
          onTap: () => Get.offNamed('producto'),
        )
      ],
    );
  }
}
