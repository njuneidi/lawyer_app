import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/common_widgets/async_value_widget.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/cases/presentation/case_card.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class CasesGrid extends ConsumerWidget {
  const CasesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(searchFilterNotifierProvider);
    final casesListValue = ref.watch(casesProvider);
    // debugPrint('-----${casesListValue.value.toString()} $filter');
    //debugPrint(' $filter-----${casesListValue.value.toString()} $filter');
    final filteredCaseListValue = filter == null
        ? casesListValue
        : ref.watch(filteredCasesProvider(filter));
    debugPrint(
        'filter $filter-----${filteredCaseListValue.value.toString()} $filter');
    // debugPrint('----->>>>${filteredCaseListValue.value.toString()}');
    return AsyncValueWidget<List<Case>>(
      value: filteredCaseListValue,
      data: (cases) => cases.isEmpty
          ? const Center(
              child: Text('empty'),
            )
          : CasessLayoutGrid(
              itemCount: cases.length,
              itemBuilder: (_, index) {
                final caseItem = cases[index];
               /* return Text('nempty')*/
                return CaseCard(
                  caseItem: caseItem,
                );
              },
            ),
    );
    //const Center(child: Text('Not Empty')));
/*
    return AsyncValueWidget<List<Case>>(
      value:casesListValue,
      data: (cases) => cases.isEmpty || true
          ? Center(
              child: Text('No products found'.hardcoded),
            )
          : CasessLayoutGrid(
              itemCount: cases.length,
              itemBuilder: (_, index) {
                final caseItem = cases[index];
                return CaseCard(caseItem: caseItem,);
              },
            ),
    );*/
  }
}

class CasessLayoutGrid extends StatelessWidget {
  const CasessLayoutGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  /// Total number of items to display.
  final int itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    // use a LayoutBuilder to determine the crossAxisCount
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      // 1 column for width < 500px
      // then add one more column for each 250px
      final crossAxisCount = max(1, width ~/ 250);
      // once the crossAxisCount is known, calculate the column and row sizes
      // set some flexible track sizes based on the crossAxisCount with 1.fr
      final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
      final numRows = (itemCount / crossAxisCount).ceil();
      // set all the row sizes to auto (self-sizing height)
      final rowSizes = List.generate(numRows, (_) => auto);
      // Custom layout grid. See: https://pub.dev/packages/flutter_layout_grid
      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: Sizes.p24, // equivalent to mainAxisSpacing
        columnGap: Sizes.p24, // equivalent to crossAxisSpacing
        children: [
          // render all the items with automatic child placement
          for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
        ],
      );
    });
  }
}
