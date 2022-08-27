import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/common_widgets/custom_image.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';

/// Used to show a single product inside a card.
class CaseCard extends ConsumerWidget {
  const CaseCard({super.key, required this.caseItem, this.onPressed});
  final Case caseItem;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const productCardKey = Key('case-card');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return const Text('data');
    return Card(
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
                  IconButton(
                    icon: imgIcons(
                      src: 'edit.png',
                      scale: 1.5,
                    ),
                    onPressed: () {},
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
              Text(caseItem.description,
                  style: Theme.of(context).textTheme.bodyText1),
              // if (product.numRatings >= 1) ...[
              //   gapH8,
              //   ProductAverageRating(product: product),
              // ],
              gapH24,
              Text(caseItem.clientID,
                  style: Theme.of(context).textTheme.headline6),
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
