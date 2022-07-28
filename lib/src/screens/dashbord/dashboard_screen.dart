import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/src/screens/main/components/header.dart';
import 'package:lawyer_app/src/screens/main/components/my_fiels.dart';



// ignore: use_key_in_widget_constructors
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
         Header(pageTitle: context.loc.dashboardPageTitle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                  
                     const MyFiels(tab:'dashboard'),
                     const SizedBox(
                      height: defaultPadding,
                     ),
                    //  const ClientScreen(),
            //              const ListScaffold(appBarActions: [], appBarTitle: Text('title'), body: Text('null'), floatingActionButton:  FloatingActionButton(
            //   heroTag: 'client_fab',
            //  // backgroundColor: Theme.of(context).primaryColorDark,
            //   onPressed: null,
            //   tooltip: 'new client',
            //   child: Icon(
            //     Icons.add,
            //     color: Colors.white,
            //   ),
            // ), onCancelSettingsSection: '',),
                    
                 //   const RecentFiles(),
                  
                    if (Responsive.isMobile(context))
                      const SizedBox(
                        height: defaultPadding,
                      ),
                    // if (Responsive.isMobile(context))
                    //   const storage_detalis(),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(
                  width: defaultPadding,
                ),
              // if (!Responsive.isMobile(context))
              //   const Expanded(
              //     flex: 2,
              //     // ignore: unnecessary_const
              //     child: const storage_detalis(),
              //   ),
            ],
          )
        ],
      ),
    ));
  }
}
