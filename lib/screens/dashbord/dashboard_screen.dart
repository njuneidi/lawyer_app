import 'package:lawyer_app/constants.dart';
import 'package:lawyer_app/responsive.dart';
import 'package:lawyer_app/screens/dashbord/components/recent_files.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/storage_details.dart';

// ignore: use_key_in_widget_constructors
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
        const Header(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const MyFiels(),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    const RecentFiles(),
                    if (Responsive.isMobile(context))
                      const SizedBox(
                        height: defaultPadding,
                      ),
                    if (Responsive.isMobile(context))
                      const storage_detalis(),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(
                  width: defaultPadding,
                ),
              if (!Responsive.isMobile(context))
                const Expanded(
                  flex: 2,
                  // ignore: unnecessary_const
                  child: const storage_detalis(),
                ),
            ],
          )
        ],
      ),
    ));
  }
}
