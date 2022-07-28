import 'package:lawyer_app/src/app.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';

class EntityInfo {
  final String? svgSrc, title, totalStorage, name, imgSrc;
  final int? numOfFiels, percentage;
  final Color? color;

  EntityInfo({
    this.name,
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiels,
    this.percentage,
    this.color,
    this.imgSrc,
  });
}

late final BuildContext context;

//enum MyDefinitionFiels{accounts,clients,employees,advocates,suppliers,services}
//enum MnuItems { newItem, find, exort, print }
List<EntityInfo> definitionDemoMyFiels(BuildContext context) => [
      EntityInfo(
        name: AppRoute.accounts.name,
        title: context.loc.accounts, //"Accounts".hardcoded,
        numOfFiels: 1328,
        svgSrc: "lawyer.png",
        totalStorage: "2.9GB",
        color: const Color(0xFFFFA113),
        percentage: 35,
        imgSrc: '${AppRoute.accounts.name}.png',
      ),
      EntityInfo(
        name: AppRoute.clients.name,
        title: context.loc.clients,
        numOfFiels: 1328,
        svgSrc: "user.svg",
        totalStorage: "1GB",
        color: const Color(0xFFA4CDFF),
        percentage: 10,
        imgSrc: '${AppRoute.clients.name}.png',
       // imgSrc: 'clients.png',
      ),
      EntityInfo(
        name: AppRoute.employees.name,
        title: context.loc.employees,
        numOfFiels: 5328,
        svgSrc: "user.svg",
        totalStorage: "7.3GB",
        color: const Color(0xFF007EE5),
        percentage: 78,
        imgSrc: '${AppRoute.employees.name}.png',
      ),
      EntityInfo(
        name: AppRoute.advocates.name,
        title: context.loc.advocates,
        numOfFiels: 1328,
        svgSrc: "advocate.svg",
        totalStorage: "1.9GB",
        color: primaryColor,
        percentage: 35,
        imgSrc: '${AppRoute.advocates.name}.png',
      ),
      EntityInfo(
        name: AppRoute.suppliers.name,
        title: context.loc.suppliers,
        numOfFiels: 1328,
        svgSrc: "suppliers.svg",
        totalStorage: "2.9GB",
        color: const Color(0xFFFFA113),
        percentage: 35,
        imgSrc: '${AppRoute.suppliers.name}.png',
      ),
      EntityInfo(
        name: AppRoute.services.name,
        title: context.loc.services,
        numOfFiels: 1328,
        svgSrc: "one_drive.svg",
        totalStorage: "1GB",
        color: const Color(0xFFA4CDFF),
        percentage: 10,
        imgSrc: '${AppRoute.services.name}.png',
      ),
      EntityInfo(
        name: AppRoute.courts.name,
        title: context.loc.courts,
        numOfFiels: 5328,
        svgSrc: "court.svg",
        totalStorage: "7.3GB",
        color: const Color(0xFF007EE5),
        percentage: 78,
        imgSrc: '${AppRoute.courts.name}.png',
      ),
      EntityInfo(
        name: AppRoute.judges.name,
        title: context.loc.judges,
        numOfFiels: 1328,
        svgSrc: "judge.svg",
        totalStorage: "1GB",
        color: const Color(0xFFA4CDFF),
        percentage: 10,
        imgSrc: '${AppRoute.judges.name}.png',
      ),
      EntityInfo(
        name: AppRoute.cases.name,
        title: context.loc.cases,
        numOfFiels: 5328,
        svgSrc: "cases.svg",
        totalStorage: "7.3GB",
        color: const Color(0xFF007EE5),
        percentage: 78,
        imgSrc: '${AppRoute.cases.name}.png',
      ),
      EntityInfo(
        name: AppRoute.casesType.name,
        title: context.loc.casesType,
        numOfFiels: 1328,
        svgSrc: "Documents.svg",
        totalStorage: "1.9GB",
        color: primaryColor,
        percentage: 35,
        imgSrc: '${AppRoute.casesType.name}.png',
      ),
      EntityInfo(
        name: AppRoute.powerOfAttorney.name,
        title: context.loc.powerOfAttorney,
        numOfFiels: 1328,
        svgSrc: "Documents.svg",
        totalStorage: "1.9GB",
        color: primaryColor,
        percentage: 35,
        imgSrc: '${AppRoute.powerOfAttorney.name}.png',
      ),
      EntityInfo(
        name: AppRoute.documents.name,
        title: context.loc.documents,
        numOfFiels: 1328,
        svgSrc: "archive.svg",
        totalStorage: "2.9GB",
        color: const Color(0xFFFFA113),
        percentage: 35,
        imgSrc: '${AppRoute.documents.name}.png',
      ),
      EntityInfo(
        name: AppRoute.tasks.name,
        title: context.loc.tasks,
        numOfFiels: 1328,
        svgSrc: "task.svg",
        totalStorage: "1.9GB",
        color: primaryColor,
        percentage: 35,
        imgSrc: '${AppRoute.tasks.name}.png',
      ),
      EntityInfo(
        name: AppRoute.alerts.name,
        title: context.loc.alerts,
        numOfFiels: 1328,
        svgSrc: "task.svg",
        totalStorage: "2.9GB",
        color: const Color(0xFFFFA113),
        percentage: 35,
        imgSrc: '${AppRoute.alerts.name}.png',
      ),
      EntityInfo(
        name: AppRoute.relatedActs.name,
        title: context.loc.relatedActs,
        numOfFiels: 1328,
        svgSrc: "task.svg",
        totalStorage: "2.9GB",
        color: const Color(0xFFFFA113),
        percentage: 35,
        imgSrc: '${AppRoute.relatedActs.name}.png',
      ),
    ];

List dashboardDemoMyFiels = [
  EntityInfo(
    name: AppRoute.invoice.name,
    title: "invoice".hardcoded,
    numOfFiels: 1328,
    svgSrc: "invoice.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
    imgSrc: '${AppRoute.invoice.name}.png',
  ),
  EntityInfo(
    name: AppRoute.cases.name,
    title: "Cases".hardcoded,
    numOfFiels: 1328,
    svgSrc: "cases.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
    imgSrc: '${AppRoute.cases.name}.png',
  ),
  EntityInfo(
    name: AppRoute.tasks.name,
    title: "Tasks",
    numOfFiels: 1328,
    svgSrc: "task.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
    imgSrc: '${AppRoute.tasks.name}.png',
  ),
  EntityInfo(
    name: AppRoute.alerts.name,
    title: "Alerts",
    numOfFiels: 5328,
    svgSrc: "court.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
    imgSrc: '${AppRoute.alerts.name}.png',
  ),
];
