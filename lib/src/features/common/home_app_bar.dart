
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';
import 'package:lawyer_app/src/screens/main/components/my_fiels_small.dart';

class HomeAppBar extends ConsumerWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.tab,
    required this.enityTitle,
    required this.item,
    required this.tabItem,
  }) : super(key: key);

  final String tab;
  final String enityTitle;
  final AsyncValue<List<Case>> item;
  final TabItemsNotifier tabItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final row = ref.watch(caseItemNotifierProvider.notifier);
    final backLink = AppRoute.definition.name;
    final onSaveLink = ref.watch(previousLinkNotifierProvider.notifier);

    VoidCallback headerButton(tab) {
      return () {
        ref.watch(entityItemNotifierProvider.notifier).item(const Client(name: ''));
      
        ref.watch(caseItemNotifierProvider.notifier).item(const Case(title: ''));
        onSaveLink.previousPage(tab);

        tabItem.linkedPage(editLink(tab));
      };
    }

    return AppBar(
      centerTitle: true,
   
      title: item.when(
        data: (data) => Text('$enityTitle (${data.length})'),
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
          onPressed: headerButton(tab),
          icon: imgIcons(src: 'add.png', color: Colors.white),
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
