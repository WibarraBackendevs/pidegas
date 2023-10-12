import 'dart:io';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Color.fromARGB(255, 119, 209, 225),
          backgroundColor: Color.fromARGB(255, 255, 111, 2),
        ),
        body: const Center(
            child: Column(
          children: <Widget>[
            Expanded(
              child: FittedBox(
                child: FlutterLogo(),
              ),
            ),
          ],
        )));
  }
}
