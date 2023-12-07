// ignore_for_file: constant_identifier_names

import 'package:app2/pages/project_list_page.dart';
import 'package:flutter/material.dart';

import '../models/calc.dart';
//import '../calculators/concreto.dart';

const Widget ConcreteProjectsPage = ProjectListPage(idCalc: 1);

// ignore: non_constant_identifier_names
Map<int, Calc> Calcs = {
  1: const Calc(id: 1, name: 'Concreto', page: ConcreteProjectsPage),
};
