import 'package:aplicacion/src/controller/controller_producto.dart';
import 'package:aplicacion/src/custom_widget/drawer_header.dart';
import 'package:aplicacion/src/custom_widget/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var fx = Get.put(ControllerProducto());

    if (Get.arguments != null) {
      fx.setAttributes(Get.arguments['id'], Get.arguments['nombre'],
          Get.arguments['precio'], Get.arguments['disponible']);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo producto'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerEncabezado(),
            DrawerItems(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Obx(
              () {
                return TextFormField(
                  onChanged: fx.namedChanged,
                  controller: fx.ctrName.value,
                  decoration: InputDecoration(
                      labelText: 'Nombre del producto',
                      errorText: fx.errorName.value),
                );
              },
            ),
            Obx(
              () {
                return TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: fx.princeChanged,
                  controller: fx.crtPrice.value,
                  decoration: InputDecoration(
                      labelText: 'Precio del producto',
                      errorText: fx.errorPrice.value),
                );
              },
            ),
            Obx(
              () {
                return SwitchListTile(
                  value: fx.productoAvailable.value,
                  title: const Text('Disponible'),
                  onChanged: fx.availableChanged,
                );
              },
            ),
            Obx(
              () {
                return ElevatedButton.icon(
                    onPressed: fx.submitFunc.value,
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
