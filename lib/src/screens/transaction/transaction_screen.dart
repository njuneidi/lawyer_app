import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/screens/main/components/header.dart';
import 'package:flutter/material.dart';



// ignore: use_key_in_widget_constructors
class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
         Header(pageTitle: context.loc.sideMenuItemThreeTransaction,),
         
        ],
      ),
    ));
  }
}
