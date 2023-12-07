import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Coretec Tools Concreto'),
        ),
        body: const Center(
          child: Text('Olá, Mundo!'),
        ),
      ),
    );
  }
}


