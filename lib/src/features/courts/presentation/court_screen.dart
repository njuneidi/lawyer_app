import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';

import 'package:lawyer_app/src/common_widgets/entites_search_text_field.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/courts/domain/court.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/screens/main/components/my_fiels_small.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class CourtScreen extends ConsumerWidget {
  final _scrollController = ScrollController();

  CourtScreen(
      {this.searchText,
      required this.tab,
      required this.tabItem,
      required this.controller,
      Key? key})
      : super(key: key);
  final TabItemsNotifier tabItem;
  final EntityConroller controller;
  final String tab;
  final String? searchText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final row = ref.watch(courtItemNotifierProvider.notifier);

   
    final backLink = AppRoute.definition.name;
    final onSaveLink = ref.watch(previousLinkNotifierProvider.notifier);
    final searchFilter = ref.watch(searchFilterNotifierProvider);
     final itemProvider = ref.watch(courtsProvider);
    //final filteredCourts = ref.watch(filteredCourtsProvider(searchFilter));
    final itemEntity = searchFilter != null ?ref.watch(filteredCourtsProvider(searchFilter)):itemProvider;
    // setEntityLength.entityLength(clients.value?.length);


    VoidCallback headerButton(tab) {
      return () {
        row.item(const Court(name: ''));
        onSaveLink.previousPage(tab);
        tabItem.linkedPage(AppRoute.editCourts.name);
      };
    }

    final enityTitle = getEntityScreenTitle(tab, context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:secondaryColor,
       // foregroundColor: Colors.black54,
        //flexibleSpace:   const MyFielsSmall(tab:'definition'),
        title: itemEntity.when(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0 * 2),
        child: Container(
          padding: const EdgeInsets.all(defaultPadding * .250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (Responsive.isDesktop(context))
                 MyFielsSmall(tab: tab),
              EntitiesSearchTextField(
                tabItem: tabItem,
                tab: tab,
              ),
             
              Expanded(
                child: Container(
                  //color: secondaryColor,
                  padding: const EdgeInsets.all(defaultPadding),

                  child: itemEntity.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, trace) =>
                          Center(child: Text(error.toString())),
                      data: (elements) {
                        return Center(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: elements.length,
                            itemBuilder: (context, index) {
                              final entity = elements[index];
                              return Column(
                                children: [
                                  //const Divider(color: Colors.white70),

                                  InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    onTap: () {
                                      // row.entityRow(const Client(name: ''));
                                      tabItem.linkedPage(editLink(tab));
                                      onSaveLink.previousPage(tab);
                                    },
                                    child: Center(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        padding: const EdgeInsets.all(
                                            defaultPadding * .250),
                                        child: Row(children: <Widget>[
                                          Expanded(
                                            child: IconButton(
                                              icon: imgIcons(
                                                src: 'edit.png',
                                                scale: 1.5,
                                              ),
                                              // onPressed: () => ClientScreenVMEdit(context: context, client: client,),
                                              onPressed: () {
                                                row.item(entity);
                                                onSaveLink.previousPage(tab);
                                                tabItem
                                                    .linkedPage(editLink(tab));
                                                // 'edit${tab.substring(0, 1).toUpperCase()}${tab.substring(1)}');
                                                //  row.entityRow(const Client(name: ''));
                                              },
                                            ),
                                          ),
                                          // const VerticalDivider(color: Colors.red,),
                                          tableRowCell(entity, entity.name, 1),
                                          tableRowCell(
                                              entity, entity.address, 1),
                                          tableRowCell(entity, entity.city, 1),
                                          // tableRowCell(entity, entity.email, 2),
                                          tableRowCell(entity, entity.phone, 2),
                                          // tableRowCell(
                                          //  entity, entity.mobile, 2),

                                          Expanded(
                                            child: IconButton(
                                                //icon: const Icon(Icons.delete),
                                                icon: imgIcons(
                                                    src: 'garbage.png',
                                                    color: Colors.white),
                                                onPressed:() => controller.deleteCourt(entity,AppRoute.courts.name)),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  const Divider(color: Colors.white70,height: 1,),
                                ],
                              );
                            },
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded tableRowCell(Court entity, String cell, int flex) {
    return Expanded(
      flex: flex,
      child: Padding(
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
       
            ],
          ),
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
}
