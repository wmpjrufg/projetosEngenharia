import 'package:app2/models/calc.dart';
import 'package:flutter/material.dart';

class CalcTile extends StatelessWidget {
  final Calc calc;
  const CalcTile({super.key, required this.calc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Card(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => calc.page),
              );
            },
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.analytics_outlined),
              ),
              title: Text(calc.name.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
