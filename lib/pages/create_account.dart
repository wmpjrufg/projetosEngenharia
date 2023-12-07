// ignore_for_file: unused_local_variable

import 'package:app2/database/db_helper.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cpf = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();

    bool error = false;
    bool isLoading = false;

    Future<void> createAccount(String cpf, String password) async {
      final db = await SQLHelper.createUser(cpf, password);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: cpf,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'CPF',
                      hintText: "Insira seu CPF",
                      border: OutlineInputBorder(),
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: "Insira sua senha",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: confirmPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirme sua senha',
                    hintText: "Confirme sua senha",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            /*
            
            error
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('As senhas não coincidem'),
                    ),
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(''),
                    ),
                  ),
            */
            ElevatedButton(
                onPressed: () {
                  if (password.text == confirmPassword.text) {
                    createAccount(cpf.text, password.text);
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                    Navigator.of(context).pop();
                  } else {
                    error = true;
                  }
                },
                child: const Text('Criar conta')),
          ],
        ),
      ),
    );
  }
}
