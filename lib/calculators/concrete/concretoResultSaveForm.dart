import 'package:app2/pages/project_list_page.dart';
import 'package:flutter/material.dart';

class ConcretoResultSaveForm extends StatelessWidget {
  final TextEditingController _ResultNameController = TextEditingController();

  ConcretoResultSaveForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salvar projeto'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          bottom: 40,
          left: 40,
          right: 40,
          top: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: _ResultNameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Nome do projeto',
                  hintText: "Nome do projeto",
                  border: OutlineInputBorder()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ProjectListPage(
                                idCalc: 1,
                              )),
                    );
                  },
                  child: const Text('Salvar projeto')),
            ),
          ],
        ),
      ),
    );
  }
}
