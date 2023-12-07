import 'package:app2/component/calc_tile.dart';
import 'package:app2/data/calc_data.dart';
import 'package:app2/models/calc.dart';
import 'package:flutter/material.dart';

class CalcList extends StatelessWidget {
  const CalcList({super.key});

  @override
  Widget build(BuildContext context) {
    Map<int, Calc> calcs = {...Calcs};

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadoras"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) =>
                  CalcTile(calc: calcs.values.elementAt(index)),
              itemCount: calcs.length,
            ),
          ),
        ],
      ),
    );
  }
}
