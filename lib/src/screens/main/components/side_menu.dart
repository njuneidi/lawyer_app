import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/routing/app_router.dart';
import 'package:lawyer_app/src/screens/side_menu_items.dart';
//import 'package:lawyer_app/src/screens/definition/definition_screen.dart';

import '../main_screen.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sideMenu = ref.read(sideMenuItemProvider.notifier);
    return Drawer(
      child: SingleChildScrollView(
      // it enable scorlling
        child: Column(
          children: [
            const SizedBox(height: 20,),
            DrawerHeader(
              
              child: Image.asset("assets/images/logo.png",),
            ),
           
            DrawListTitle(
              title: context.loc.sideMenuItemOneDashboard,
              svgSrc: "assets/icons/menu_dashbord.svg",
              //press:() => context.goNamed(AppRoute.dashboard.name),
              press:() =>sideMenu.sideMenuPage('dashboard'),
                         //     context.goNamed(AppRoute.dashboard.name,params: {'tab': 'dashboard'}),
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemTwoDefinition,
              svgSrc: "assets/icons/menu_dashbord.svg",
              //press:  () => context.goNamed(AppRoute.definition.name),
              press:() =>sideMenu.sideMenuPage('definition'),
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemThreeTransaction,
              svgSrc: "assets/icons/menu_tran.svg",
               //press:() => context.goNamed(AppRoute.transaction.name),
               press:() =>sideMenu.sideMenuPage('transaction'),
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemFourFinance,
              svgSrc: "assets/icons/menu_dashbord.svg",
              // press:() => context.goNamed(AppRoute.finance.name),
               press:() =>sideMenu.sideMenuPage('finance'),
            ),
            DrawListTitle(
              title: context.loc.sideMenuIteFiveReport,
              svgSrc: "assets/icons/menu_doc.svg",
             //  press:() => context.goNamed(AppRoute.reports.name),
               press:() =>sideMenu.sideMenuPage('reports'),
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemSixSettings,
              svgSrc: "assets/icons/menu_setting.svg",
              // press:() => context.goNamed(AppRoute.setting.name),
               press:() =>sideMenu.sideMenuPage('setting'),
            )
          ],
        ),
      ),
    );
  }
}