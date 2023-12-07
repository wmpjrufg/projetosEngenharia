// ignore: file_names
import 'package:app2/calculators/concrete/concretoResultSaveForm.dart';
import 'package:flutter/material.dart';

class ConcretoResult extends StatelessWidget {
  const ConcretoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Y = 2'),
            const Text('X = 3'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ConcretoResultSaveForm()),
                  );
                },
                child: const Text('Salvar')),
          ],
        ),
      ),
    );
  }
}
