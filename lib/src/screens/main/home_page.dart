
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/clients/presentation/entity_screen.dart';
import 'package:lawyer_app/src/clients/presentation/edit/entity_screen_edit.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/entity/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/authentication/domain/app_user.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/screens/dashbord/dashboard_screen.dart';
import 'package:lawyer_app/src/screens/definition/definition_screen.dart';
import 'package:lawyer_app/src/screens/finance/finance_screen.dart';
//import 'package:lawyer_app/src/screens/definition/definition_screen.dart';
import 'package:lawyer_app/src/screens/main/components/side_menu.dart';
import 'package:lawyer_app/src/screens/main/controller/entity_row_notifier.dart';
import 'package:lawyer_app/src/screens/main/controller/side_menu_items.dart';
import 'package:lawyer_app/src/screens/reports/reports_screen.dart';
import 'package:lawyer_app/src/screens/transaction/transaction_screen.dart';
//import 'package:lawyer_app/src/screens/reports/reports_screen.dart';
//import 'package:lawyer_app/src/screens/settings/setting_screen.dart';
//import 'package:lawyer_app/src/screens/transaction/transaction_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
    required this.user,
    required this.tab,
  }) : super(key: key);

  final AppUser? user;

  final String tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final row = ref.read(clientRowProvider);
 

    final tabNotifier = ref.watch(sideMenuItemProvider.notifier);
    // debugPrint("dd");
    final controller = ref.watch(entityControllerProvider);
    // debugPrint("ddd");
    // final clients = ref.watch(clientsProvider);

   Widget link() {
      if (tab == AppRoute.dashboard.name) {
        return DashboardScreen();
      } else if (tab == AppRoute.definition.name) {
        return DefinitionScreen();
      } else if (tab == AppRoute.transaction.name) {
        return TransactionScreen();
      } else if (tab == AppRoute.finance.name) {
        return FinanceScreen();
      } else if (tab == AppRoute.reports.name) {
        return ReportScreen();
      } else if (tab == AppRoute.reports.name) {
        return ReportScreen();
      } else if (tab == AppRoute.clients.name) {
        return EntityScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editClients.name) {
        return ClientScreenVMEdit(
          context: context,
          entity: row,
        );
      } else if (tab == AppRoute.employees.name) {
        return EntityScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editEmployees.name) {
        return ClientScreenVMEdit(
          context: context,
          entity: row,
        );
      } else if (tab == AppRoute.advocates.name) {
        return EntityScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editAdvocates.name) {
        return ClientScreenVMEdit(
          context: context,
          entity: row,
        );
      } else if (tab == AppRoute.suppliers.name) {
        return EntityScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editSuppliers.name) {
        return ClientScreenVMEdit(
          context: context,
          entity: row,
        );
      } else if (tab == AppRoute.judges.name) {
        return EntityScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editJudges.name) {
        return ClientScreenVMEdit(
          context: context,
          entity: row,
        );
      } else {
        return DefinitionScreen();
      }
      
    }

    return Row(
      crossAxisAlignment:
          user != null ? CrossAxisAlignment.start : CrossAxisAlignment.stretch,
      children: [
        if (Responsive.isDesktop(context))
          const Expanded(
            //defalut flex =1
            // and it takes 1/6 part of screen
            child: SideMenu(),
          ),

        //if (tab == 1)
        Expanded(
          flex: 5,
          child: link(),
        )
        // else if(tab == 2)
        // Expanded(
        //   flex: 5,
        //   child: DefinitionScreen(),
        // )
      ],
    );
  }
}
