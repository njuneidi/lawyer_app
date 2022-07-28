import 'package:flutter/material.dart';

class ActionMenuItem {
  static const List<MenuItem2> actionMenuItemsPart1 = [
    newItem,
    find,
    export,
    printItem
  ];
  //static final actionMenuItemsPart2 = (BuildContext context) => [context.loc.cancel];
  

  static const newItem = MenuItem2(text: 'Clients', icon: Icons.new_label);
  static const find = MenuItem2(text: 'Employees', icon: Icons.find_in_page);
  static const export = MenuItem2(text: 'Advocates', icon: Icons.import_export);
  static const printItem = MenuItem2(text: 'Suppliers', icon: Icons.print);
}

class MenuItem2 {
  final String text;
  final IconData icon;

  const MenuItem2({
    required this.text,
    required this.icon,
  });
}

enum MnuItems { newItem, find, exort, print }
