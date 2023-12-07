//import 'dart:ffi';
//import 'package:flutter_tex/flutter_tex.dart';
import 'package:app2/database/db_helper.dart';
import 'package:flutter/material.dart';

class Concreto extends StatefulWidget {
  const Concreto({super.key});

  @override
  State<Concreto> createState() => _ConcretoState();
}

class _ConcretoState extends State<Concreto> {
  final TextEditingController _momentoController = TextEditingController();
  final TextEditingController _altUtilController = TextEditingController();
  final TextEditingController _altUtilLinhaController = TextEditingController();
  final TextEditingController _larguraController = TextEditingController();
  final TextEditingController _fckController = TextEditingController();
  final TextEditingController _fykController = TextEditingController();

  Future<void> addConcreto() async {
    await SQLHelper.createConcreto(
        "Concreto 1",
        _momentoController.text as double,
        _altUtilController.text as double,
        _altUtilLinhaController.text as double,
        _larguraController.text as double,
        _fckController.text as double,
        _fykController.text as double,
        1);
    //Refresh data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            bottom: 40,
            left: 40,
            right: 40,
            top: 40,
          ),
          child: ListView(
            children: <Widget>[
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Text(
                    'Concreto',
                    style: TextStyle(
                      fontSize: 78.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Text(
                    "Calculadora",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _momentoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Momento fletor',
                    hintText: "Informe o M_d em kN.m",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _altUtilController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Altura útil',
                    hintText: 'Informe d em m',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _altUtilLinhaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Altura útil complementar',
                    hintText: 'Informe d_linha em m',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _larguraController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Largura',
                    hintText: 'Informe b_w em m',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _fckController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'fck',
                    hintText: 'Informe fck em kPa',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _fykController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'fyk',
                    hintText: 'Informe fyk em kPa',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    /*
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ConcretoResult()),
                    );
                    */
                    Navigator.of(context).pop();
                  },
                  child: const Text('Salvar')),
            ],
          )),
    );
  }
}
