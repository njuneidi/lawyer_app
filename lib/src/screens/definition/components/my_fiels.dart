// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:lawyer_app/src/models/MyDefinitionFiles.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/screens/definition/components/file_info_card.dart';
import 'package:flutter/material.dart';

class MyFiels extends StatelessWidget {
  const MyFiels({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Definitions".hardcoded,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding/(Responsive.isMobile(context)?2:1),
              )),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Responsive(
          mobile: FileInfoCardGridView(crossAxisCount: _size.width < 650?2:4,childAspectRatio: _size.width <650?1.3:1,),
          tablet: FileInfoCardGridView(),
         // desktop: FileInfoCardGridView(childAspectRatio:  _size.width <1400?1.1:1.4,),
          desktop: FileInfoCardGridView(),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key ?key,
    this.crossAxisCount = 7,
    this.childAspectRatio = 1.5,
  }) : super(key: key);
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding/4,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: defaultPadding/4,
      ),
      itemBuilder: (context, index) => FieldInfoCard(
        info: demoMyFiels[index],
      ),
    );
  }
}
