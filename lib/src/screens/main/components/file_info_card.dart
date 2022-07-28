import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
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
    debugPrint(
        ' ---- edit${info.name?.substring(0, 1).toUpperCase()}${info.name?.substring(1)}');
    return GestureDetector(
      onTap: () => myFiels.linkedPage(info.name!),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultPadding * .3),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: info.color?.withOpacity(.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset(
                    info.svgSrc!,
                    color: info.color,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    // clientRow.entityRow(const Client(name: ''));
                    final clientRow = ref.watch(clientRowProvider.notifier);
                    
                    final employeeRow = ref.watch(employeeRowProvider.notifier);
                  
                    myFiels.linkedPage(
                        'edit${info.name?.substring(0, 1).toUpperCase()}${info.name?.substring(1)}');
                        clientRow.entityRow(const Client(name: ''));
                          employeeRow.entityRow(const Employee(name: ''));
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
