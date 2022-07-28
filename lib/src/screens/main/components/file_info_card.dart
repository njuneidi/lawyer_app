import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/employees/domain/employee.dart';
import 'package:lawyer_app/src/models/my_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawyer_app/src/screens/main/controller/entity_row_notifier.dart';
import 'package:lawyer_app/src/screens/main/controller/side_menu_items.dart';

class FieldInfoCard extends ConsumerWidget {
  const FieldInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);
final EntityInfo info;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myFiels = ref.watch(sideMenuItemProvider.notifier);

    final preLink = ref.watch(previousItemProvider.notifier);

    debugPrint(
        ' ---- edit${info.name?.substring(0, 1).toUpperCase()}${info.name?.substring(1)}');
    return GestureDetector(
      onTap: () => myFiels.linkedPage(info.name!),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding/2),
        decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all( .2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: info.color?.withOpacity(.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  // child: svgIconColorSize(
                  //   src:info.svgSrc!,
                  //   color: info.color,
                  // ),
                  child: Transform.scale(scale: 1.1, child: imgIcons(src: info.imgSrc!)),
                ),
                  //imgIcon( src:info.imgSrc!),
                IconButton(
                  icon: imgIcons(src: 'add.png',color: lightBlue),
                  onPressed: () {
                    // clientRow.entityRow(const Client(name: ''));
                    final clientRow = ref.watch(clientRowProvider.notifier);
                    preLink.previousPage(AppRoute.definition.name);
                    clientRow.entityRow(const Client(name: ''));
                    myFiels.linkedPage(
                        'edit${info.name?.substring(0, 1).toUpperCase()}${info.name?.substring(1)}');
                  },
                )
              ],
            ),
            Center(
              child: Text(
                info.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.prercentage,
  }) : super(key: key);

  final Color color;
  final int prercentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
              color: color.withOpacity(.1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        LayoutBuilder(
            builder: ((context, constraints) => Container(
                  width: constraints.maxWidth * prercentage / 100,
                  height: 5,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                )))
      ],
    );
  }
}
