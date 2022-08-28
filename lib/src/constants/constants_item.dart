import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';

const primaryColor = Color(0xFF2697FF);
//const primaryColor = Color.fromARGB(255, 2, 32, 61);
const secondaryColor = Color(0xFF2A2D3E);
//const secondaryColor = Color(0xFF6B8ACB);
//const secondaryColor = Color(0xFF6B8ACB);
//const secondaryColor = Color.fromARGB(170, 197, 208, 254);
//const secondaryColor = Color(0x00E5E6E8);
//const secondaryColor = Color.fromARGB(255, 171, 236, 242);
//const bgColor = Color(0xFFF5E5E5);
const bgColor = Color(0xFFE5E6E8);
const hColor = Color.fromARGB(255, 100, 181, 227);
//const bgColor = Color.fromARGB(255, 241, 241, 244);
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

List<Map<String, String>> casesType(BuildContext context) => [
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
  //debugPrint('tab ----> $tab');
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
  } else if (tab == AppRoute.courts.name) {
    return context.loc.courts;
  } else if (tab == AppRoute.editCourts.name) {
    return context.loc.editCourt;
  } else if (tab == AppRoute.cases.name) {
    return context.loc.cases;
  } else if (tab == AppRoute.editCases.name) {
    return context.loc.editCase;
  }else if (tab == AppRoute.casesType.name) {
    return context.loc.casesType;
  } else if (tab == AppRoute.editCasesType.name) {
    return context.loc.editCaseType;
  }else if (tab == AppRoute.services.name) {
    return context.loc.services;
  } else if (tab == AppRoute.editServices.name) {
    return context.loc.editService;
  }else if (tab == AppRoute.tasksType.name) {
    return context.loc.tasksType;
  } else if (tab == AppRoute.editTasksType.name) {
    return context.loc.editTaskType;
  }else if (tab == AppRoute.tasks.name) {
    return context.loc.tasks;
  } else if (tab == AppRoute.editTasks.name) {
    return context.loc.editTask;
  }
  return '';
}

VoidCallback getSaveAction(String tab, EntityConroller databaseController,
    bool editEntity, Map<String, dynamic> entityData, Client? entity) {
  if (!editEntity) {
    if (tab == AppRoute.editClients.name) {
      databaseController.addEntity(entityData, AppRoute.clients.name);
    } else if (tab == AppRoute.editEmployees.name) {
      databaseController.addEntity(entityData, AppRoute.employees.name);
    } else if (tab == AppRoute.editAdvocates.name) {
      databaseController.addEntity(entityData, AppRoute.advocates.name);
    } else if (tab == AppRoute.editJudges.name) {
      databaseController.addEntity(entityData, AppRoute.judges.name);
    } else if (tab == AppRoute.editSuppliers.name) {
      databaseController.addEntity(entityData, AppRoute.suppliers.name);
    }
  } else {
    if (tab == AppRoute.editClients.name) {
      databaseController.updateEntity(
          entity!, entityData, AppRoute.clients.name);
    } else if (tab == AppRoute.editEmployees.name) {
      databaseController.updateEntity(
          entity!, entityData, AppRoute.employees.name);
    } else if (tab == AppRoute.editAdvocates.name) {
      databaseController.updateEntity(
          entity!, entityData, AppRoute.advocates.name);
    } else if (tab == AppRoute.editJudges.name) {
      databaseController.updateEntity(
          entity!, entityData, AppRoute.judges.name);
    } else if (tab == AppRoute.editSuppliers.name) {
      databaseController.updateEntity(
          entity!, entityData, AppRoute.suppliers.name);
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
    } else if (tab == AppRoute.editCourts.name) {
      return context.loc.editCourt;
    } else if (tab == AppRoute.editCases.name) {
      return context.loc.editCase;
    } else if (tab == AppRoute.editTasks.name) {
      return context.loc.editTask;
    
    } else if (tab == AppRoute.editCasesType.name) {
      return context.loc.editCaseType;
    
    } else if (tab == AppRoute.editServices.name) {
      return context.loc.editService;
    
    } else if (tab == AppRoute.editTasksType.name) {
      return context.loc.editTaskType;
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
    } else if (tab == AppRoute.editTasks.name) {
      return context.loc.newTask;
    } else if (tab == AppRoute.editCourts.name) {
      return context.loc.newCourt;
    } else if (tab == AppRoute.editCases.name) {
      return context.loc.newCase;
    
    } else if (tab == AppRoute.editCasesType.name) {
      return context.loc.newCaseType;
    
    } else if (tab == AppRoute.editServices.name) {
      return context.loc.newService;
    
    } else if (tab == AppRoute.editTasksType.name) {
      return context.loc.newTaskType;
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
    );
Widget svgIconBlue(src) => SvgPicture.asset(
      src,
      // color: blue,
    );
Widget svgIconColor(src, color) => SvgPicture.asset(
      src,
      //color: color,
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
Widget imgIcon({src}) => ImageIcon(
      AssetImage('assets/icons/$src'),
    );
Widget imgIcons({src, scale, width, hight, color}) => Image.asset(
      'assets/icons/$src',
      scale: scale,
      width: width,
      height: hight,
      color: Colors.white,
    );
Widget imgIcons2({src, scale, width, hight, color}) => Image.asset(
      'assets/icons/$src',
      scale: scale,
      width: width,
      height: hight,
      color: color,
    );
Widget widthSizeBox(width) => SizedBox(width: width);
Widget hightSizeBox(height) => SizedBox(height: height);
TextStyle hintText =
    const TextStyle(color: secondaryColor, decorationColor: Colors.red);
TextStyle labelText =
    const TextStyle(color: primaryColor, decorationColor: Colors.red);

TextStyle? formStyle(context) => Theme.of(context)
    .textTheme
    .titleMedium
    ?.merge(const TextStyle(color: secondaryColor));
    TextStyle? formStyleheadline6(context) => Theme.of(context)
    .textTheme
    .headline6
    ?.merge(const TextStyle(color: secondaryColor));
    TextStyle? formStyleheadline5(context) => Theme.of(context)
    .textTheme
    .headline5
    ?.merge(const TextStyle(color: secondaryColor));
    
    TextStyle? formStyletitleLarge(context) => Theme.of(context)
    .textTheme
    .bodyMedium
    ?.merge(const TextStyle(color: secondaryColor, fontWeight: FontWeight.bold));
    

InputDecoration decoration(context,{prefixIcon,icon,press,suffixIconColor}) => InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: secondaryColor, width: 2.0),
      ),
      // focusColor: Colors.black,
      counterStyle: hintText,
      hintStyle: hintText,
      labelStyle: hintText,
      helperStyle: labelText,
      floatingLabelStyle: labelText,
      labelText: context,
      prefixIcon: prefixIcon,
      focusColor: secondaryColor,
      fillColor: primaryColor,
    );
    
