import 'package:lawyer_app/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';

class DefinitonEntityInfo {
  final String ?svgSrc, title, totalStorage;
  final int ?numOfFiels, percentage;
  final Color ?color;

  DefinitonEntityInfo(
      {this.svgSrc,
      this.title,
      this.totalStorage,
      this.numOfFiels,
      this.percentage,
      this.color});
}

List demoMyFiels = [


  DefinitonEntityInfo(
    title: "Accounts".hardcoded,
    numOfFiels: 1328,
    svgSrc: "assets/icons/invoice.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  DefinitonEntityInfo(
    title: "Clients",
    numOfFiels: 1328,
    svgSrc: "assets/icons/user.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  DefinitonEntityInfo(
    title: "Employees",
    numOfFiels: 5328,
    svgSrc: "assets/icons/user.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
   DefinitonEntityInfo(
    title: "Advocates",
    numOfFiels: 1328,
    svgSrc: "assets/icons/advocate.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  DefinitonEntityInfo(
    title: "Supliers",
    numOfFiels: 1328,
    svgSrc: "assets/icons/supliers.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  DefinitonEntityInfo(
    title: "Services",
    numOfFiels: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  DefinitonEntityInfo(
    title: "Courts",
    numOfFiels: 5328,
    svgSrc: "assets/icons/court.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
    DefinitonEntityInfo(
    title: "Judges",
    numOfFiels: 1328,
    svgSrc: "assets/icons/judge.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  DefinitonEntityInfo(
    title: "Cases",
    numOfFiels: 5328,
    svgSrc: "assets/icons/cases.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
   DefinitonEntityInfo(
    title: "Casses Type",
    numOfFiels: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
    DefinitonEntityInfo(
    title: "power of attorney",
    numOfFiels: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  DefinitonEntityInfo(
    title: "Documents",
    numOfFiels: 1328,
    svgSrc: "assets/icons/archive.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
   DefinitonEntityInfo(
    title: "Tasks",
    numOfFiels: 1328,
    svgSrc: "assets/icons/task.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  DefinitonEntityInfo(
    title: "Alerts",
    numOfFiels: 1328,
    svgSrc: "assets/icons/task.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
];
