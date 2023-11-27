import 'package:aplicacion/src/custom_widget/drawer_header.dart';
import 'package:aplicacion/src/custom_widget/drawer_items.dart';
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos en la nube"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [DrawerEncabezado(), DrawerItems()],
        ),
      ),
    );
  }
}
