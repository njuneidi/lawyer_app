import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/routing/app_router.dart';
import 'package:lawyer_app/src/screens/dashbord/dashboard_screen.dart';
import 'package:lawyer_app/src/screens/definition/definition_screen.dart';

import '../main_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
      // it enable scorlling
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
           
            DrawListTitle(
              title: context.loc.sideMenuItemOneDashboard,
              svgSrc: "assets/icons/menu_dashbord.svg",
              press:() => context.goNamed(AppRoute.dashboard.name),
                             // context.pushNamed(AppRoute.dashboard.name,params: {'tab': 'dashboard'}),
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemTwoDefinition,
              svgSrc: "assets/icons/menu_def.svg",
              press:  () => context.goNamed(AppRoute.definition.name),
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemThreeTransaction,
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {},
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemFourFinance,
              svgSrc: "assets/icons/menu_fin_tran.svg",
              press: () {},
            ),
            DrawListTitle(
              title: context.loc.sideMenuIteFiveReport,
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemSixSettings,
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}