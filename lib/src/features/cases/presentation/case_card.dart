import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/common_widgets/custom_image.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

/// Used to show a single product inside a card.
class CaseCard extends ConsumerWidget {
  CaseCard(
      {super.key,
      required this.caseItem,
      this.onPressed,
      required this.tabItem});
  final Case caseItem;
  final VoidCallback? onPressed;
  final TabItemsNotifier tabItem;

  // * Keys for testing using find.byKey()
  static const productCardKey = Key('case-card');
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final ScrollController controllerOne;
    final onSaveLink = ref.watch(previousLinkNotifierProvider.notifier);
    final row = ref.watch(caseItemNotifierProvider.notifier);
    final tab = AppRoute.cases.name;
    final dateFormatted =
        ref.watch(dateFormatterProvider).format(caseItem.date!);
    final client = ref.watch(getClientByIDProvider(caseItem.clientID));
    final clientName = client.value;
    //debugPrint('client ==== $client clientName ==== $clientName');

    return Card(
      color: secondaryColor,
      child: InkWell(
        key: productCardKey,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //const CustomImage(imageUrl: 'case.png'),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: secondaryColor,
                    child: IconButton(
                      //icon: const Icon(Icons.edit_rounded),
                      icon: imgIcons(
                        src: 'edit.png',
                       // scale: 3.5,
                       // color: Colors.white54,
                      ),
                      onPressed: () {
                        row.item(caseItem);
                        onSaveLink.previousPage(tab);
                        tabItem.linkedPage(editLink(tab));
                        // 'edit${tab.substring(0, 1).toUpperCase()}${tab.substring(1)}');
                        //  row.entityRow(const Client(name: ''));
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              //gapH8,
              const Divider(),
              gapH8,
              Text(caseItem.title,
                  style: Theme.of(context).textTheme.headline5),
              gapH4, Text(dateFormatted), gapH4,
             
              Row(
                children: [
                   Text('${context.loc.clientNameTitle}: ',
                      style: Theme.of(context).textTheme.headline6),
                  Text(clientName?.name ??'',
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
              gapH4,
              Row(
                children: [
                   Text('${context.loc.otherParties}: ',
                      style: Theme.of(context).textTheme.headline6),
                  Text(caseItem.others,
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
              gapH4,
              Container(
                padding: const EdgeInsets.all(defaultPadding / 2),
                decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 150,
                child: ListView(
                  controller: _scrollController,
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  children: [
                    Text('${context.loc.caseDescription}:',
                        style: Theme.of(context).textTheme.headline6),
                    gapH4,
                    Text(caseItem.description,
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              // if (product.numRatings >= 1) ...[
              //   gapH8,
              //   ProductAverageRating(product: product),
              // ],
              gapH24,
              //  Text(caseItem.clientID,
              //   style: Theme.of(context).textTheme.headline6),

              gapH4,
              Text(
                caseItem.title,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      ),
    );
  }
}
