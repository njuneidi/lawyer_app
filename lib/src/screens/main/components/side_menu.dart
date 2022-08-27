import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';
//import 'package:lawyer_app/src/screens/definition/definition_screen.dart';

import '../main_screen.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sideMenu = ref.read(tabItemsNotifierProvider.notifier);
    return Drawer(
      child: SingleChildScrollView(
        // it enable scorlling
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            DrawerHeader(
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            DrawListTitle(
              entity: AppRoute.dashboard.name,
              title: context.loc.sideMenuItemOneDashboard,
              svgSrc: "assets/icons/menu_dashbord.svg",
              //press:() => context.goNamed(AppRoute.dashboard.name),
              press: () => sideMenu.linkedPage(AppRoute.dashboard.name),
              //     context.goNamed(AppRoute.dashboard.name,params: {'tab': 'dashboard'}),
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemTwoDefinition,
              svgSrc: "assets/icons/menu_dashbord.svg",
              // press:  () => context.goNamed(AppRoute.definition.name),
              press: () => sideMenu.linkedPage(AppRoute.definition.name),
              entity: AppRoute.definition.name,
            ),
            DrawListTitle(
              title: context.loc.clients,
              svgSrc: "assets/icons/menu_dashbord.svg",
              //press:  () => context.goNamed(AppRoute.definition.name),
              press: () => sideMenu.linkedPage(AppRoute.clients.name),
              entity: AppRoute.clients.name,
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemThreeTransaction,
              svgSrc: "assets/icons/menu_tran.svg",
              //press:() => context.goNamed(AppRoute.transaction.name),
              press: () => sideMenu.linkedPage(AppRoute.transaction.name),
              entity: AppRoute.transaction.name,
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemFourFinance,
              svgSrc: "assets/icons/menu_dashbord.svg",
              // press:() => context.goNamed(AppRoute.finance.name),
              press: () => sideMenu.linkedPage(AppRoute.finance.name),
              entity:AppRoute.finance.name,
            ),
            DrawListTitle(
              title: context.loc.sideMenuIteFiveReport,
              svgSrc: "assets/icons/menu_doc.svg",
              //  press:() => context.goNamed(AppRoute.reports.name),
              press: () => sideMenu.linkedPage(AppRoute.reports.name),
              entity: AppRoute.reports.name,
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemSixSettings,
              svgSrc: "assets/icons/menu_setting.svg",
              // press:() => context.goNamed(AppRoute.setting.name),
              press: () => sideMenu.linkedPage(AppRoute.setting.name),
              entity: AppRoute.setting.name,
            )
          ],
        ),
      ),
    );
  }
}
