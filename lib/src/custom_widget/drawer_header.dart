import 'package:flutter/material.dart';

class DrawerEncabezado extends StatelessWidget {
  const DrawerEncabezado({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserAccountsDrawerHeader(
        accountName: Text('Mariana Guillén'),
        accountEmail: Text('guillenmariana550@gmail.com'));
  }
}
