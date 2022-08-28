import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';
import 'package:lawyer_app/src/screens/main/components/my_fiels_small.dart';

class HomeAppBar extends ConsumerWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.tab,
    required this.enityTitle,
    // required this.item,
    required this.tabItem,
    required this.headerButton,
    required this.imageIcon,
  }) : super(key: key);

  final String tab;
  final String enityTitle;
  //final AsyncValue<List<Case>> item;
  final TabItemsNotifier tabItem;
  final VoidCallback headerButton;
  final Widget imageIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backLink = AppRoute.definition.name;
    final onSaveLink = ref.watch(previousLinkNotifierProvider.notifier);
    final caseItem = ref.watch(casesProvider);
    final caseTypeItem = ref.watch(caseTypesProvider);
    final serviceItem = ref.watch(servicesProvider);
    final taskTypeItem = ref.watch(taskTypeProvider);
    final taskItem = ref.watch(taskProvider);

    final item = tab == AppRoute.cases.name
        ? caseItem
        : tab == AppRoute.casesType.name
            ? caseTypeItem
            : tab == AppRoute.tasksType.name
                ? taskTypeItem
                :  tab == AppRoute.tasks.name?
                taskItem: serviceItem;
    // VoidCallback headerButton(tab) {
    //   return () {
    //     ref
    //         .watch(entityItemNotifierProvider.notifier)
    //         .item(const Client(name: ''));

    //     ref.watch(caseItemNotifierProvider.notifier).item(Case(title: ''));
    //     onSaveLink.previousPage(tab);

    //     tabItem.linkedPage(editLink(tab));
    //   };
    // }

    return AppBar(
      centerTitle: true,
      backgroundColor: secondaryColor,
      title: item.when(
        data: (data) => tab.contains('edit')
            ? Text(enityTitle)
            : Text('$enityTitle (${data.length})'),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, trace) => Center(child: Text(error.toString())),
      ),
      leading: BackButton(
        onPressed: () {
          return tabItem.linkedPage(backLink);
        },
      ),
      actions: [
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () => headerButton(),
          icon: imageIcon,
        ),
        const SizedBox(
          width: 100,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
