import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawyer_app/localization/app_localizations_context.dart';

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
              press: () {},
            ),
            DrawListTitle(
              title: context.loc.sideMenuItemTwoDefinition,
              svgSrc: "assets/icons/menu_def.svg",
              press: () {},
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