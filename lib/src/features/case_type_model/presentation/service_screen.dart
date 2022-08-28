import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/common_widgets/responsive_center.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';

import 'package:lawyer_app/src/common_widgets/entites_search_text_field.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/case_type_model/model/case_type_model.dart';
import 'package:lawyer_app/src/features/case_type_model/presentation/case_type_grid.dart';
import 'package:lawyer_app/src/features/case_type_model/presentation/service_grid.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/cases/presentation/case_grid.dart';
import 'package:lawyer_app/src/features/common/home_app_bar.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/screens/main/components/my_fiels_small.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class ServiceScreen extends ConsumerStatefulWidget {
  // final _scrollController = ScrollController();

  const ServiceScreen(
      {required this.tab,
      required this.tabItem,
      required this.controller,
      Key? key})
      : super(key: key);
  final TabItemsNotifier tabItem;
  final EntityConroller controller;
  final String tab;
  @override
  _CaseScreenState createState() => _CaseScreenState();
}

class _CaseScreenState extends ConsumerState<ServiceScreen> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_dismissOnScreenKeyboard);
  }
  // When the search text field gets the focus, the keyboard appears on mobile.
  // This method is used to dismiss the keyboard when the user scrolls.
  // void _dismissOnScreenKeyboard() {
  //   if (FocusScope.of(context).hasFocus) {
  //     FocusScope.of(context).unfocus();
  //   }
  // }

  // @override
  // void dispose() {
  //   _scrollController.removeListener(_dismissOnScreenKeyboard);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(caseTypesProvider);
    final editpage = AppRoute.editCasesType.name;
    final page = AppRoute.casesType.name;
    final onSaveLink = ref.watch(previousLinkNotifierProvider.notifier);
    final searchFilter = ref.watch(searchFilterNotifierProvider);
    //  final onSaveLink = ref.watch(previousLinkNotifierProvider.notifier);
    final enityTitle = getEntityScreenTitle(widget.tab, context);

  

    return Scaffold(
      appBar: HomeAppBar(
        
        tab: widget.tab,
        enityTitle: enityTitle,
        // item: item,
        tabItem: widget.tabItem,
        headerButton: () {
          ref.watch(caseEntityNotifierProvider.notifier).item(CaseTypeModel(title: ''));
          onSaveLink.previousPage(widget.tab);

          widget.tabItem.linkedPage(editLink(widget.tab));
        },
        imageIcon: const Icon(Icons.add)
      ),

      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          ResponsiveSliverCenter(
            maxContentWidth: double.infinity,
            padding: const EdgeInsets.all(Sizes.p16),
            child: MyFielsSmall(tab: widget.tab),
          ),
          ResponsiveSliverCenter(
            padding: const EdgeInsets.all(Sizes.p16),
            child: EntitiesSearchTextField(
              tabItem: widget.tabItem,
              tab: widget.tab,
            ),
          ),
          ResponsiveSliverCenter(
            padding: const EdgeInsets.all(Sizes.p16),
            child: ServiceGrid(tabItem: widget.tabItem, controller: widget.controller,)
          ),
        ],
      ),

      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     if (Responsive.isDesktop(context))
      //       MyFielsSmall(tab: AppRoute.cases.name),
      //     EntitiesSearchTextField(
      //       tabItem: tabItem,
      //       tab: tab,
      //     ),
      //     Container(
      //       //color: secondaryColor,
      //       padding: const EdgeInsets.all(defaultPadding),

      //       child: item.when(
      //           loading: () =>
      //               const Center(child: CircularProgressIndicator()),
      //           error: (error, trace) =>
      //               Center(child: Text(error.toString())),
      //           data: (elements) {
      //             return Center(
      //               child: ProductsLayoutGrid(
      //                 // controller: _scrollController,
      //                 itemCount: elements.length,
      //                 itemBuilder: (context, index) {
      //                   final entity = elements[index];
      //                   return Column(
      //                     children: [
      //                       //const Divider(color: Colors.white70),

      //                       Card(
      //                         child: InkWell(
      //                           customBorder: RoundedRectangleBorder(
      //                             borderRadius: BorderRadius.circular(20),
      //                           ),
      //                           onTap: () {
      //                             // row.entityRow(const Client(name: ''));
      //                             tabItem.linkedPage(editLink(tab));
      //                             onSaveLink.previousPage(tab);
      //                           },
      //                           child: Padding(
      //                             padding:
      //                                 const EdgeInsets.all(defaultPadding),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.stretch,
      //                               children: [
      //                                 IconButton(
      //                                   icon: imgIcons(
      //                                     src: 'edit.png',
      //                                     scale: 1.5,
      //                                   ),
      //                                   onPressed: () {},
      //                                 ),
      //                                 //tableRowCell(entity, entity.name, 1),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       const Divider(color: Colors.white70),
      //                     ],
      //                   );
      //                 },
      //               ),
      //             );
      //           }),
      //     ),
      //   ],
      // ),
    );
  }
}

Padding tableRowCell(Case entity, String cell, int flex) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: Container(
      //color: Colors.blueGrey,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(cell
                //style: textStyle
                ),
          ),
          // Text(
          //   'filterMatch',
          //   maxLines: 3,
          //   overflow: TextOverflow.ellipsis,
          //   style: Theme.of(context)
          //       .textTheme
          //       .subtitle2,
          // ),
        ],
      ),
    ),
  );
}

Expanded tableHeader(String tiltle, int flex) {
  return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
            padding: const EdgeInsets.all(10),
            // decoration: const BoxDecoration(
            //     color: secondaryColor,
            //     borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(child: Text(tiltle))),
      ));
}
