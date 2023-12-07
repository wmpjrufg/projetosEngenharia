import 'package:app2/database/db_helper.dart';
import 'package:flutter/material.dart';

class ProjectListPage extends StatefulWidget {
  final int idCalc;

  const ProjectListPage({super.key, required this.idCalc});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  TextEditingController _name = TextEditingController();
  final TextEditingController _momentoController = TextEditingController();
  final TextEditingController _altUtilController = TextEditingController();
  final TextEditingController _altUtilLinhaController = TextEditingController();
  final TextEditingController _larguraController = TextEditingController();
  final TextEditingController _fckController = TextEditingController();
  final TextEditingController _fykController = TextEditingController();

  List<Map<String, dynamic>> allData = [];

  bool isLoading = true;

  void refreshData() async {
    final data = await SQLHelper.getAllConcreto();
    setState(() {
      allData = data;
      isLoading = false;
    });
  }

  Future<void> updateConcreto(int id) async {
    await SQLHelper.updateConcreto(
      id,
      _name.text,
      double.parse(_momentoController.text),
      double.parse(_altUtilController.text),
      double.parse(_altUtilLinhaController.text),
      double.parse(_larguraController.text),
      double.parse(_fckController.text),
      double.parse(_fykController.text),
    );

    refreshData();
  }

  Future<void> addConcreto() async {
    await SQLHelper.createConcreto(
        _name.text,
        double.parse(_momentoController.text),
        double.parse(_altUtilController.text),
        double.parse(_altUtilLinhaController.text),
        double.parse(_larguraController.text),
        double.parse(_fckController.text),
        double.parse(_fykController.text),
        1);

    refreshData();
  }

  Future<void> deleteConcrete(int id) async {
    await SQLHelper.deleteConcreto(id);
    refreshData();
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  void onlyShow(int id) async {
    final existingdata = allData.firstWhere((element) => element['id'] == id);
    _name.text = existingdata['name'].toString();
    _momentoController.text = existingdata['momentoFlexor'].toString();
    _altUtilController.text = existingdata['alturaUtil'].toString();
    _altUtilLinhaController.text = existingdata['alturaUtilLinha'].toString();
    _larguraController.text = existingdata['largura'].toString();
    _fckController.text = existingdata['fck'].toString();
    _fykController.text = existingdata['fyk'].toString();

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _name.text,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _momentoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Momento fletor',
                      hintText: "Informe o M_d em kN.m",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _altUtilController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Altura útil',
                      hintText: 'Informe d em m',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _altUtilLinhaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Altura útil complementar',
                      hintText: 'Informe d_linha em m',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _larguraController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Largura',
                      hintText: 'Informe b_w em m',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _fckController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'fck',
                      hintText: 'Informe fck em kPa',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _fykController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'fyk',
                      hintText: 'Informe fyk em kPa',
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((value) {
      _momentoController.clear();
      _altUtilController.clear();
      _altUtilLinhaController.clear();
      _larguraController.clear();
      _fckController.clear();
      _fykController.clear();
    });
  }

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingdata = allData.firstWhere((element) => element['id'] == id);
      _name.text = existingdata['name'].toString();
      _momentoController.text = existingdata['momentoFlexor'].toString();
      _altUtilController.text = existingdata['alturaUtil'].toString();
      _altUtilLinhaController.text = existingdata['alturaUtilLinha'].toString();
      _larguraController.text = existingdata['largura'].toString();
      _fckController.text = existingdata['fck'].toString();
      _fykController.text = existingdata['fyk'].toString();
    }

    if (id == null) {
      _name.text = "Toque para editar";
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: EditableText(
                    controller: _name,
                    focusNode: FocusNode(),
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    cursorColor: Colors.black,
                    backgroundCursorColor: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _momentoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Momento fletor',
                      hintText: "Informe o M_d em kN.m",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _altUtilController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Altura útil',
                      hintText: 'Informe d em m',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _altUtilLinhaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Altura útil complementar',
                      hintText: 'Informe d_linha em m',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _larguraController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Largura',
                      hintText: 'Informe b_w em m',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _fckController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'fck',
                      hintText: 'Informe fck em kPa',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _fykController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'fyk',
                      hintText: 'Informe fyk em kPa',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (id != null) {
                      await updateConcreto(id);
                    } else {
                      await addConcreto();
                    }
                    _name.clear();
                    _momentoController.clear();
                    _altUtilController.clear();
                    _altUtilLinhaController.clear();
                    _larguraController.clear();
                    _fckController.clear();
                    _fykController.clear();

                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(id != null ? 'Atualizar' : 'Adicionar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projetos'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: allData.length,
              itemBuilder: (BuildContext context, int index) => Card(
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(allData[index]['name'],
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          onlyShow(allData[index]['id']);
                        },
                        icon: const Icon(
                          Icons.visibility,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showBottomSheet(allData[index]['id']);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.purple,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteConcrete(allData[index]['id']);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
