import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';

class EntityInfo {
  final String? svgSrc, title, totalStorage, name;
  final int? numOfFiels, percentage;
  final Color? color;


  EntityInfo(
      { this.name,
      this.svgSrc,
      this.title,
      this.totalStorage,
      this.numOfFiels,
      this.percentage,
      this.color});
      
}

late final BuildContext context;

//enum MyDefinitionFiels{accounts,clients,employees,advocates,suppliers,services}
//enum MnuItems { newItem, find, exort, print }
List<EntityInfo> definitionDemoMyFiels (BuildContext context) => [
  EntityInfo(
    name: AppRoute.accounts.name,
    title: context.loc.accounts,//"Accounts".hardcoded,
    numOfFiels: 1328,
    svgSrc: "assets/icons/invoice.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.clients.name,
    title: context.loc.clients,
    numOfFiels: 1328,
    svgSrc: "assets/icons/user.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  EntityInfo(
    name: AppRoute.employees.name,
    title: context.loc.employees,
    numOfFiels: 5328,
    svgSrc: "assets/icons/user.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
  EntityInfo(
    name: AppRoute.advocates.name,
    title: context.loc.advocates,
    numOfFiels: 1328,
    svgSrc: "assets/icons/advocate.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.suppliers.name,
    title: context.loc.suppliers,
    numOfFiels: 1328,
    svgSrc: "assets/icons/suppliers.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.services.name,
    title: context.loc.advocates,
    numOfFiels: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  EntityInfo(
    name: AppRoute.courts.name,
    title: context.loc.courts,
    numOfFiels: 5328,
    svgSrc: "assets/icons/court.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
  EntityInfo(
    name: AppRoute.judges.name,
    title: context.loc.judges,
    numOfFiels: 1328,
    svgSrc: "assets/icons/judge.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  EntityInfo(
    name: AppRoute.cases.name,
    title: context.loc.cases,
    numOfFiels: 5328,
    svgSrc: "assets/icons/cases.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
  EntityInfo(
    name: AppRoute.casesType.name,
    title: context.loc.casesType,
    numOfFiels: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.powerOfAttorney.name,
    title: context.loc.powerOfAttorney,
    numOfFiels: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.documents.name,
    title: context.loc.documents,
    numOfFiels: 1328,
    svgSrc: "assets/icons/archive.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.tasks.name,
    title: context.loc.tasks,
    numOfFiels: 1328,
    svgSrc: "assets/icons/task.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.alerts.name,
    title: context.loc.alerts,
    numOfFiels: 1328,
    svgSrc: "assets/icons/task.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
];

List dashboardDemoMyFiels = [
  EntityInfo(
    name: AppRoute.invoice.name,
    title: "invoice".hardcoded,
    numOfFiels: 1328,
    svgSrc: "assets/icons/invoice.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.cases.name,
    title: "Cases".hardcoded,
    numOfFiels: 1328,
    svgSrc: "assets/icons/cases.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  EntityInfo(
    name: AppRoute.tasks.name,
    title: "Tasks",
    numOfFiels: 1328,
    svgSrc: "assets/icons/task.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  EntityInfo(
    name: AppRoute.alerts.name,
    title: "Alerts",
    numOfFiels: 5328,
    svgSrc: "assets/icons/court.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
];
