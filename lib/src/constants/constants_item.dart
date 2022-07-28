import 'package:flutter/material.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/employees/domain/employee.dart';
import 'package:lawyer_app/src/entity/controller/entity_controller.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

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
    } else if (tab == AppRoute.editAdvocate.name) {
       databaseController.addClient(e);
    } else if (tab == AppRoute.editJudges.name) {
       databaseController.addClient(e);
    } else if (tab == AppRoute.editsppliers.name) {
       databaseController.addClient(e);
    } else if (tab == AppRoute.editAdvocate.name) {
       databaseController.addClient(e);
    }
  } else {
    if (tab == AppRoute.editClients.name) {
       databaseController.updateClient(entity!,e);
    } else if (tab == AppRoute.editEmployees.name) {
       databaseController.updateEmployee(entity!,e);
    } else if (tab == AppRoute.editAdvocate.name) {
       databaseController.updateClient(entity!,e);
    } else if (tab == AppRoute.editJudges.name) {
       databaseController.updateClient(entity!,e);
    } else if (tab == AppRoute.editsppliers.name) {
       databaseController.updateClient(entity!,e);
    } else if (tab == AppRoute.editAdvocate.name) {
       databaseController.updateClient(entity!,e);
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
    } else if (tab == AppRoute.editAdvocate.name) {
      return context.loc.editAdvocate;
    } else if (tab == AppRoute.editJudges.name) {
      return context.loc.editJudge;
    } else if (tab == AppRoute.editsppliers.name) {
      return context.loc.editSupplier;
    } else if (tab == AppRoute.editAdvocate.name) {
      return context.loc.editAdvocate;
    }
  } else {
    if (tab == AppRoute.editClients.name) {
      return context.loc.newClient;
    } else if (tab == AppRoute.editEmployees.name) {
      return context.loc.newEmployee;
    } else if (tab == AppRoute.editAdvocate.name) {
      return context.loc.editAdvocate;
    } else if (tab == AppRoute.editJudges.name) {
      return context.loc.editJudge;
    } else if (tab == AppRoute.editsppliers.name) {
      return context.loc.editSupplier;
    } else if (tab == AppRoute.editAdvocate.name) {
      return context.loc.newClient;
    }
  }

  return '';
}

String editLink(tab) =>
    'edit${tab.substring(0, 1).toUpperCase()}${tab.substring(1)}';
