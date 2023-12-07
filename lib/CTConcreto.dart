//import 'pages/login_page.dart';
import 'package:app2/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bem-vindo(a) ao Flutter',
      home: LoginPage(),
    );
  }
}
