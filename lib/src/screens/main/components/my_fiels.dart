// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';

import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/models/my_files.dart';

import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/screens/main/components/file_info_card.dart';

class MyFiels extends StatelessWidget {
  const MyFiels({
    Key? key,
    required this.tab,
  }) : super(key: key);
  final String tab;

  static int getCroutsAxisCount(String tab, double size) {
    switch (tab) {
      case 'dashboard':
        return size < 650 ? 2 : 4;
      case 'definition':
        return size < 650 ? 4 : 5;
      case 'transaction':
        return 3;
      case 'finance':
        return 4;
      case 'reports':
        return 5;
      case 'settings':
        return 6;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // children: [
          //   Text(
          //     context.loc.myDefinitions,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          //   ElevatedButton.icon(
          //     style: TextButton.styleFrom(
          //         padding: EdgeInsets.symmetric(
          //       horizontal: defaultPadding * 1.5,
          //       vertical:
          //           defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
          //     )),
          //     onPressed: () {},
          //     icon: Icon(Icons.add),
          //     label: Text("Add New"),
          //   ),
          // ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Responsive(
          mobile: FileInfoCardGridView(
            tab: tab,
            crossAxisCount: getCroutsAxisCount(tab, _size.width),
            childAspectRatio: _size.width < 650 ? 1 : 1.3,
          ),
          tablet: FileInfoCardGridView(
            tab: tab,
            crossAxisCount: getCroutsAxisCount(tab, _size.width),
            childAspectRatio: _size.width < 650 ? 1 : 2,
          ),
          // desktop: FileInfoCardGridView(childAspectRatio:  _size.width <1400?1.1:1.4,),
          desktop: FileInfoCardGridView(
            tab: tab,
            crossAxisCount: getCroutsAxisCount(tab, _size.width),
            childAspectRatio: _size.width < 650 ? 1 : 2,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final String tab;
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 1,
    this.childAspectRatio = 1.3,
    required this.tab,
  }) : super(key: key);

  static int getFielsCount(String tab) {
    switch (tab) {
      case 'dashboard':
        return dashboardDemoMyFiels(context).length;
      case 'definition':
        return definitionDemoMyFiels(context).length;
      case 'transaction':
        return 3;
      case 'finance':
        return 4;
      case 'reports':
        return 5;
      case 'settings':
        return 6;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: tab == AppRoute.dashboard.name
          ? dashboardDemoMyFiels(context).length
          : tab == AppRoute.definition.name
              ? definitionDemoMyFiels(context).length
              : 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding / 8,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: defaultPadding / 8,
      ),
      itemBuilder: (context, index) => FieldInfoCard(
        info: tab == 'dashboard'
            ? dashboardDemoMyFiels(context)[index]
            : definitionDemoMyFiels(context)[index],
      ),
    );
  }
}
