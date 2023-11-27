import 'package:aplicacion/src/controller/controller_list.dart';
import 'package:aplicacion/src/pages/home_page.dart';
import 'package:aplicacion/src/pages/lista_page.dart';
import 'package:aplicacion/src/pages/producto_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerList());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home_page', page: () => const HomePages()),
        GetPage(name: '/producto', page: () => const ProductoPage()),
        GetPage(name: '/listaProducto', page: () => ListaPage())
      ],
    );
  }
}
