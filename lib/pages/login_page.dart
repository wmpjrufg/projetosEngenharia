//import 'package:app2/pages/home_page.dart';
//import 'package:app2/models/calc.dart';
import 'package:app2/database/db_helper.dart';
import 'package:app2/pages/calc_list_page.dart';
import 'package:app2/pages/create_account.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cpf = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<bool> login(String cpf, String password) async {
    final user = await SQLHelper.loginUser(cpf, password);
    return user.isNotEmpty;
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
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("assets/logo.png")),
              const SizedBox(
                height: 15,
              ),
              TextField(
                  controller: cpf,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                    hintText: "Informe seu CPF",
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 15,
              ),
              TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: "Informe sua senha",
                    border: OutlineInputBorder(),
                  )),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (true) {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalcPage()),);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const CalcList()),
                      );
                    }
                  },
                  child: const Text('Login')),
              /*
              
              TextButton(
                  onPressed: () {}, child: const Text('Esqueceu sua senha?')),
              */

              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const CreateAccount()),
                    );
                  },
                  child: const Text('Criar uma conta')),
            ],
          )),
    );
  }
}
