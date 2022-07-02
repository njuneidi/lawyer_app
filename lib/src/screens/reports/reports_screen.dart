import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/src/screens/main/components/header.dart';


// ignore: use_key_in_widget_constructors
class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
         Header(pageTitle: 'Reports'.hardcoded,),
          
        ],
      ),
    ));
  }
}
