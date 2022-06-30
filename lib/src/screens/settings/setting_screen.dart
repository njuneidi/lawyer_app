import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/screens/dashbord/components/recent_files.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/src/screens/main/components/header.dart';



// ignore: use_key_in_widget_constructors
class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
         Header(pageTitle: 'Setting'.hardcoded,),
          
        ],
      ),
    ));
  }
}
