import 'package:aplicacion/src/controller/controller_list.dart';
import 'package:aplicacion/src/custom_widget/drawer_header.dart';
import 'package:aplicacion/src/custom_widget/drawer_items.dart';
import 'package:aplicacion/src/custom_widget/item_producto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaPage extends StatelessWidget {
  ListaPage({super.key});
  final ControllerList ctr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
        //widget(child: const Icon(Icons.settings)),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerEncabezado(),
            DrawerItems(),
          ],
        ),
      ),
      body: Obx(() => ListView.builder(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          itemCount: ctr.listaProducto.length,
          itemBuilder: (BuildContext context, int index) {
            var producto = ctr.listaProducto[index];
            return ItemProducto(producto: producto);
          })),
    );
  }
}
