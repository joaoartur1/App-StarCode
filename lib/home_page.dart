import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Página Inicialgit",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        leadingWidth: 30,
      ),
      body: Center(
        child: Text(
          "Bem-Vindo a Página Inicial!",
          style: TextStyle(color: Colors.black45, fontSize: 24),
        ),
      ),
    );
  }
}
