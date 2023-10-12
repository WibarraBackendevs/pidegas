import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pidegas_app/pedidos.dart';
import 'package:pidegas_app/home.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Pedidos(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route _createRouteHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Pidegas Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      color: Colors.deepOrange,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Inicio',
      style: optionStyle,
    ),
    Text(
      'Index 1: Pedidos',
      style: optionStyle,
    ),
    Text(
      'Index 2: Confirmar Pagos',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        shadowColor: Color.fromARGB(255, 119, 209, 225),
        backgroundColor: Color.fromARGB(255, 255, 111, 2),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Image.file(File(
              '/home/wibarra/Documentos/Flutter/pidegas_app_test/web/icons/pidegas.jpeg')),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: const Text('Mis Pedidos'),
            selected: _selectedIndex == 0,
            onTap: () {
              //Page1();
              // Update the state of the app
              _onItemTapped(0);
              // Then close the drawer
              Navigator.of(context).push(_createRoute());
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: const Text('Confirmación de Pago'),
            selected: _selectedIndex == 1,
            onTap: () {
              // Update the state of the app
              _onItemTapped(1);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.add_home),
            title: const Text('Mi Cuenta'),
            selected: _selectedIndex == 2,
            onTap: () {
              // Update the state of the app
              _onItemTapped(2);
              // Then close the drawer
              Navigator.of(context).push(_createRouteHome());
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: const Text('Facturación'),
            selected: _selectedIndex == 2,
            onTap: () {
              // Update the state of the app
              _onItemTapped(2);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: const Text('Contactanos'),
            selected: _selectedIndex == 2,
            onTap: () {
              // Update the state of the app
              _onItemTapped(2);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            selected: _selectedIndex == 2,
            onTap: () {
              // Update the state of the app
              _onItemTapped(2);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 250),
            child: ElevatedButton(
              onPressed: _closeDrawer,
              child: const Text('Close Drawer'),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(102, 102, 100, 0)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
