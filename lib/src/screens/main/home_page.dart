import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/authentication/domain/app_user.dart';
import 'package:lawyer_app/src/features/case_type_model/presentation/case_type_screen.dart';
import 'package:lawyer_app/src/features/case_type_model/presentation/edit/case_type_screen_edit.dart';
import 'package:lawyer_app/src/features/case_type_model/presentation/edit/services_screen_edit.dart';
import 'package:lawyer_app/src/features/case_type_model/presentation/edit/task_type_screen_edit.dart';
import 'package:lawyer_app/src/features/case_type_model/presentation/service_screen.dart';
import 'package:lawyer_app/src/features/case_type_model/presentation/task_type_screen.dart';
import 'package:lawyer_app/src/features/cases/presentation/case_screen.dart';
import 'package:lawyer_app/src/features/cases/presentation/edit/case_screen_edit.dart';
import 'package:lawyer_app/src/features/courts/presentation/court_screen.dart';
import 'package:lawyer_app/src/features/courts/presentation/edit/court_screen_edit.dart';
import 'package:lawyer_app/src/features/entity/presentation/edit/entity_screen_edit.dart';
import 'package:lawyer_app/src/features/entity/presentation/entity_screen.dart';
import 'package:lawyer_app/src/features/tasks/presentation/edit/task_screen_edit.dart';
import 'package:lawyer_app/src/features/tasks/presentation/task_screen.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/screens/dashbord/dashboard_screen.dart';
import 'package:lawyer_app/src/screens/definition/definition_screen.dart';
import 'package:lawyer_app/src/screens/finance/finance_screen.dart';
//import 'package:lawyer_app/src/screens/definition/definition_screen.dart';
import 'package:lawyer_app/src/screens/main/components/side_menu.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';
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
    final entityItem = ref.read(entityItemNotifierProvider);
    final courtItem = ref.read(courtItemNotifierProvider);
    final caseItem = ref.read(caseItemNotifierProvider);
    final caseTypeItem = ref.read(caseEntityNotifierProvider);
    final serviceItem = ref.read(serviceItemNotifierProvider);
    final taskTypeItem = ref.read(serviceItemNotifierProvider);

    final taskItem = ref.read(taskItemNotifierProvider);

    final tabNotifier = ref.watch(tabItemsNotifierProvider.notifier);
    // //debugPrint("dd");
    final controller = ref.watch(entityControllerProvider);
    // //debugPrint("ddd");
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
      } else if (entityList.contains(tab)) {
        return EntityScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (editEntityList.contains(tab)) {
        return EnitityScreenEdit(
          context: context,
          entity: entityItem,
        );
      } else if (tab == AppRoute.courts.name) {
        return CourtScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editCourts.name) {
        return CourtScreenEdit(
          context: context,
          entity: courtItem,
        );
      } else if (tab == AppRoute.cases.name) {
        return CaseScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editCases.name) {
        return CaseScreenEdit(
          context: context,
          entity: caseItem,
        );
      } else if (tab == AppRoute.services.name) {
        return ServiceScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editServices.name) {
        return ServicesScreenEdit(
          context: context,
          entity: serviceItem,
        );
      }else if (tab == AppRoute.casesType.name) {
        return CaseTypeScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editCasesType.name) {
        return CaseTypeScreenEdit(
          context: context,
          entity: caseTypeItem,
        );
      } else if (tab == AppRoute.tasks.name) {
        return TaskScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editTasks.name) {
        return TaskScreenEdit(
          context: context,
          entity: taskItem,
        );
      }else if (tab == AppRoute.tasksType.name) {
        return TaskTypeScreen(
          controller: controller,
          tab: tab,
          tabItem: tabNotifier,
        );
      } else if (tab == AppRoute.editTasksType.name) {
        return TaskTypeScreenEdit(
          context: context,
          entity: taskTypeItem,
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
