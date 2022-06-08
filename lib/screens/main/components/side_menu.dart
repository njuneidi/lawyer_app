import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
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
              title: "Dashbord",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {},
            ),
            DrawListTitle(
              title: "Definition",
              svgSrc: "assets/icons/menu_def.svg",
              press: () {},
            ),
            DrawListTitle(
              title: "Transaction",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {},
            ),
            DrawListTitle(
              title: "Finance",
              svgSrc: "assets/icons/menu_fin_tran.svg",
              press: () {},
            ),
            DrawListTitle(
              title: "Reports",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawListTitle(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}