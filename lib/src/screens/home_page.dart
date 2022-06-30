import 'package:flutter/material.dart';
import 'package:lawyer_app/src/features/authentication/domain/app_user.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/screens/dashbord/dashboard_screen.dart';
import 'package:lawyer_app/src/screens/definition/definition_screen.dart';
import 'package:lawyer_app/src/screens/finance/finance_screen.dart';
import 'package:lawyer_app/src/screens/main/components/side_menu.dart';
import 'package:lawyer_app/src/screens/reports/reports_screen.dart';
import 'package:lawyer_app/src/screens/settings/setting_screen.dart';
import 'package:lawyer_app/src/screens/transaction/transaction_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.user,
    required this.tab,
  }) : super(key: key);

  final AppUser? user;
  final int tab;

  @override
  Widget build(BuildContext context) {
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
            child: tab == 1
                ? DashboardScreen()
                : tab == 2
                    ? DefinitionScreen()
                    : tab == 3
                        ? TransactionScreen()
                        : tab == 4
                            ? FinanceScreen()
                            : tab == 5
                                ? ReportScreen()
                                : SettingScreen())
        // else if(tab == 2)
        // Expanded(
        //   flex: 5,
        //   child: DefinitionScreen(),
        // )
      ],
    );
  }
}
