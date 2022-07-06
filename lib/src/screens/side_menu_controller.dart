import 'package:lawyer_app/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';

class SideMenuItem {
  final String ?svgSrc, title;

  final Color ?color;

  SideMenuItem(
      {this.svgSrc,
      this.title,

      this.color});
}

List menuItem = [


  SideMenuItem(
    title: "dashbaord".hardcoded,
   
    svgSrc: "assets/icons/invoice.svg",

    color: const Color(0xFFFFA113),

  ),
  SideMenuItem(
    title: "definition",

    svgSrc: "assets/icons/user.svg",

    color: const Color(0xFFA4CDFF),

  ),
  SideMenuItem(
    title: "transaction",
   
    svgSrc: "assets/icons/user.svg",

    color: const Color(0xFF007EE5),

  ),
   SideMenuItem(
    title: "finance",
    svgSrc: "assets/icons/advocate.svg",
    color: primaryColor,
  ),
  SideMenuItem(
    title: "reports",
    svgSrc: "assets/icons/supliers.svg",
    color: const Color(0xFFFFA113),
  ),
  SideMenuItem(
    title: "settings",

    svgSrc: "assets/icons/one_drive.svg",
  
    color: const Color(0xFFA4CDFF),
   
  ),
  
];
