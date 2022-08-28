import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/common_widgets/custom_image.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/case_type_model/model/case_type_model.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

/// Used to show a single product inside a card.
class ServiceCard extends ConsumerWidget {
  ServiceCard({
    super.key,
    required this.item,
    this.onPressed,
    required this.tabItem,
    required this.controller,
  });
  final CaseTypeModel item;
  final VoidCallback? onPressed;
  final TabItemsNotifier tabItem;
  final EntityConroller controller;

  // * Keys for testing using find.byKey()
  static const serviceCardKey = Key('service-card');
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final ScrollController controllerOne;
    final onSaveLink = ref.watch(previousLinkNotifierProvider.notifier);
    final row = ref.watch(serviceItemNotifierProvider.notifier);
    final tab = AppRoute.services.name;

    /// final dateFormatted =
    //   ref.watch(dateFormatterProvider).format(caseItem.date!);
    // final client = ref.watch(getClientByIDProvider(caseItem.clientID));
    // final clientName = client.value;
    //debugPrint('client ==== $client clientName ==== $clientName');
    debugPrint(tabItem.toString());
    return Card(
      
      color: secondaryColor,
      child: InkWell(
//  customBorder: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(50),
//         ),
         
           
        key: serviceCardKey,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //const CustomImage(imageUrl: 'case.png'),
              Text(
                'data',
                style: formStyle(context),
              ),
              ServiceCardHeader(
                row: row,
                caseItem: item,
                onSaveLink: onSaveLink,
                tab: tab,
                tabItem: tabItem,
                controller: controller,
              ),
              gapH8,
              const Divider(),
           //  Center(child: Text(caseItem.description)),
                     Container(
                padding: const EdgeInsets.all(defaultPadding / 2),
                decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 100,
                child: ListView(
                  controller: _scrollController,
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  children: [
                    Text('${context.loc.caseDescription}:',
                        style: Theme.of(context).textTheme.headline6),
                    gapH4,
                    Text(item.description,
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              // gapH8,
              // Text(caseItem.title,
              //     style: Theme.of(context).textTheme.headline5),
              // gapH4, Text(dateFormatted), gapH4,

              // Row(
              //   children: [
              //      Text('${context.loc.clientNameTitle}: ',
              //         style: Theme.of(context).textTheme.headline6),
              //     Text(clientName?.name ??'',
              //         style: Theme.of(context).textTheme.headline6),
              //   ],
              // ),

              // gapH4,
              // Container(
              //   padding: const EdgeInsets.all(defaultPadding / 2),
              //   decoration: const BoxDecoration(
              //       color: secondaryColor,
              //       borderRadius: BorderRadius.all(Radius.circular(10))),
              //   height: 150,
              //   child: ListView(
              //     controller: _scrollController,
              //     shrinkWrap: true,
              //     // scrollDirection: Axis.horizontal,
              //     children: [
              //       Text('${context.loc.caseDescription}:',
              //           style: Theme.of(context).textTheme.headline6),
              //       gapH4,
              //       Text(caseItem.description,
              //           style: Theme.of(context).textTheme.bodyText1),
              //     ],
              //   ),
              // ),
              // // if (product.numRatings >= 1) ...[
              // //   gapH8,
              // //   ProductAverageRating(product: product),
              // // ],
              // gapH24,
              // //  Text(caseItem.clientID,
              // //   style: Theme.of(context).textTheme.headline6),

              // gapH4,
              // Text(
              //   caseItem.title,
              //   style: Theme.of(context).textTheme.caption,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCardHeader extends StatelessWidget {
  final _scrollController = ScrollController();

  ServiceCardHeader({
    Key? key,
    required this.row,
    required this.caseItem,
    required this.onSaveLink,
    required this.tab,
    required this.tabItem,
    required this.controller,
  }) : super(key: key);

  final ServiceTypeItemNotifier row;
  final CaseTypeModel caseItem;
  final PreviousLinkNotifier onSaveLink;
  final String tab;
  final TabItemsNotifier tabItem;
  final EntityConroller controller;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        gapH8,
        Text(caseItem.title,overflow:TextOverflow.ellipsis ,maxLines: 2,
                  style: Theme.of(context).textTheme.headline5),
              
        gapH4,
        IconButton(
            icon: imgIcons(src: 'garbage.png'),
            onPressed: () =>
                controller.deleteService(caseItem, AppRoute.services.name))
      ],
    );
  }
}
