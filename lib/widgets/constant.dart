import 'package:flutter/material.dart';

const int appPrimaryValue = 0xFF2094AD;

const MaterialColor materialColor = MaterialColor(
  appPrimaryValue,
  <int, Color>{
    50: Color(0xFFC2EAF4),
    100: Color(0xFF95D6E4),
    200: Color(0xFF6DCEE3),
    300: Color(0xFF4FBDD5),
    400: Color(0xFF2BA0B9),
    500: Color(appPrimaryValue),
    600: Color(0xFF168CA5),
    700: Color(0xFF077D96),
    800: Color(0xFF0E6C80),
    900: Color(0xFF0A5666),
  },
);

const List<List<String>> users = [
  ["Manager", "manager"],
  ["Group Manager", "groupManager"],
  ["Developer 1", "developer"],
  ["Developer 2", "developer"],
  ["Developer 3", "developer"]
];

const List<String> dropdownType = [
  "Onat", "Inventario", "Alquiler", "Compra producto", "Transporte"
];

const List<String> dropdownProjects = <String>[
  "Proyecto 1", "Proyecto 2", "Proyecto 3", "Proyecto 4"
];