import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/employees/domain/employee.dart';
import 'package:lawyer_app/src/entity/controller/entity_controller.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/screens/main/controller/side_menu_items.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
//const secondaryColor = Color.fromARGB(255, 171, 236, 242);
const bgColor = Color(0xFF212332);
//const bgColor = Color.fromARGB(79, 49, 251, 217);

// const primaryColor = Color(0xFF2697FF);
// const secondaryColor = Color.fromARGB(255, 217, 220, 241);
// const bgColor = Color.fromARGB(246, 67, 161, 117);

const defaultPadding = 16.0;

const double kMinInteractiveDimension = 48.0;

List<Map<String, String>> gender(BuildContext context) => [
      {'value': context.loc.male, 'key': context.loc.male},
      {'value': context.loc.femal, 'key': context.loc.femal},
    ];

List<Map<String, String>> country(BuildContext context) => [
      {'value': context.loc.male, 'key': context.loc.male},
      {'value': context.loc.femal, 'key': context.loc.femal},
    ];

//   VoidCallback getSaveAction(String tab) {
//   if (tab == AppRoute.clients.name) {
//     return context.loc.clients;
//   } else if (tab == AppRoute.editClients.name) {
//     return context.loc.editClient;
//   } else if (tab == AppRoute.employees.name) {
//     return context.loc.employees;
//   } else if (tab == AppRoute.editEmployees.name) {
//     return context.loc.editEmployee;
//   }
//   return '';
// }

String getEntityScreenTitle(String tab, BuildContext context) {
  if (tab == AppRoute.clients.name) {
  
    return context.loc.clients;
  } else if (tab == AppRoute.editClients.name) {
    return context.loc.editClient;
  } else if (tab == AppRoute.employees.name) {
    return context.loc.employees;
  } else if (tab == AppRoute.editEmployees.name) {
    return context.loc.editEmployee;
  } else if (tab == AppRoute.advocates.name) {
    return context.loc.advocates;
  } else if (tab == AppRoute.editAdvocates.name) {
    return context.loc.editAdvocate;
  } else if (tab == AppRoute.judges.name) {
    return context.loc.judges;
  } else if (tab == AppRoute.editJudges.name) {
    return context.loc.editJudge;
  } else if (tab == AppRoute.suppliers.name) {
    return context.loc.suppliers;
  } else if (tab == AppRoute.editSuppliers.name) {
    return context.loc.editSupplier;
  }
  return '';
}

VoidCallback getSaveAction(String tab, EntityConroller databaseController,
    bool editEntity, Map<String, dynamic> e, Client? entity) {
  if (!editEntity) {
    if (tab == AppRoute.editClients.name) {
      databaseController.addClient(e);
    } else if (tab == AppRoute.editEmployees.name) {
      databaseController.addEmployee(e);
    } else if (tab == AppRoute.editAdvocates.name) {
      databaseController.addAdvocate(e);
    } else if (tab == AppRoute.editJudges.name) {
      databaseController.addJudge(e);
    } else if (tab == AppRoute.editSuppliers.name) {
      databaseController.addSupplier(e);
    } 
  } else {
    if (tab == AppRoute.editClients.name) {
      databaseController.updateClient(entity!, e);
    } else if (tab == AppRoute.editEmployees.name) {
      databaseController.updateEmployee(entity!, e);
    } else if (tab == AppRoute.editAdvocates.name) {
      databaseController.updateAdvocate(entity!, e);
    } else if (tab == AppRoute.editJudges.name) {
      databaseController.updateJudge(entity!, e);
    } else if (tab == AppRoute.editSuppliers.name) {
      databaseController.updateSupplier(entity!, e);
    } 
  }

  return () => {};
}

String getEditScreenEntityTitle(
    String tab, BuildContext context, bool editEntity) {
  if (editEntity) {
    if (tab == AppRoute.editClients.name) {
      return context.loc.editClient;
    } else if (tab == AppRoute.editEmployees.name) {
      return context.loc.editEmployee;
    } else if (tab == AppRoute.editAdvocates.name) {
      return context.loc.editAdvocate;
    } else if (tab == AppRoute.editJudges.name) {
      return context.loc.editJudge;
    } else if (tab == AppRoute.editSuppliers.name) {
      return context.loc.editSupplier;
    } else if (tab == AppRoute.editAdvocates.name) {
      return context.loc.editAdvocate;
    }
  } else {
    if (tab == AppRoute.editClients.name) {
      return context.loc.newClient;
    } else if (tab == AppRoute.editEmployees.name) {
      return context.loc.newEmployee;
    } else if (tab == AppRoute.editAdvocates.name) {
      return context.loc.editAdvocate;
    } else if (tab == AppRoute.editJudges.name) {
      return context.loc.editJudge;
    } else if (tab == AppRoute.editSuppliers.name) {
      return context.loc.editSupplier;
    } else if (tab == AppRoute.editAdvocates.name) {
      return context.loc.newClient;
    }
  }

  return '';
}

String editLink(tab) =>
    'edit${tab.substring(0, 1).toUpperCase()}${tab.substring(1)}';
Color lemon = const Color(0xFFFFA113);
Color lightBlue = const Color(0xFFA4CDFF);
Color blue = const Color(0xFF007EE5);
Color orange = const Color(0xFFFFA113);
Widget svgIconLemon(src) => SvgPicture.asset(
      src,
      color: lemon,
    );
Widget svgIconBlue(src) => SvgPicture.asset(
      src,
      color: blue,
    );
Widget svgIconColor(src, color) => SvgPicture.asset(
      src,
      color: color,
    );
Widget svgIconLightBlue(src) => SvgPicture.asset(src, color: lightBlue);
Widget svgIconColorSize({src, color, width, hight}) => SvgPicture.asset(
      'assets/icons/$src',
      color: color,
      width: width,
      height: hight,
      fit: BoxFit.scaleDown,
    );
Widget svgIcon(src) => SvgPicture.asset('assets/icons/$src');
Widget imgIcon({src})=> ImageIcon(AssetImage('assets/icons/$src'),color: Colors.amber, );
Widget imgIcons({src,scale,width,hight,color})=>Image.asset('assets/icons/$src',scale: scale,width: width,height: hight,color: color,);
Widget widthSizeBox(width)=>SizedBox(width: width);
Widget hightSizeBox(height)=>SizedBox(height: height);
