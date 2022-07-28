import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/clients/presentation/entity_items_screen.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/entity/controller/entity_controller.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/screens/main/controller/entity_row_notifier.dart';
import 'package:lawyer_app/src/screens/main/controller/side_menu_items.dart';

class EntityScreen extends ConsumerWidget {
  const EntityScreen(
      {required this.tab,
      required this.tabItem,
      required this.controller,
      Key? key})
      : super(key: key);
  final TabItemsNotifier tabItem;
  final EntityConroller controller;
  final String tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final row = ref.watch(clientRowProvider.notifier);

    final rowItem = ref.watch(clientRowProvider);
    final clients = ref.watch(clientsProvider);
    final employees = ref.watch(employeesProvider);
    final advocates = ref.watch(advocatesProvider);
    final suppliers = ref.watch(suppliersProvider);
    final judges = ref.watch(judgesProvider);
    final backLink = AppRoute.definition.name;
    final onSaveLink = ref.watch(previousItemProvider.notifier);

    final List<Widget> viewTableHeader = <Widget>[
      Expanded(
          child: IconButton(
              onPressed: () {}, icon: imgIcons(src: 'pencil.png', scale: .2))),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(context.loc.tableHeaderName),
        ],
      )),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(context.loc.tableHeaderAddress),
        ],
      )),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(context.loc.tableHeaderCity),
        ],
      )),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(context.loc.tableHeaderEmail),
        ],
      )),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(context.loc.tableHeaderPhone),
        ],
      )),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(context.loc.tableHeaderMobile),
        ],
      )),
      Expanded(
          child: IconButton(
              onPressed: () {},
              icon: imgIcons(
                  src: 'garbage.png', color: Colors.orange, scale: .2)))
    ];
    // tab.substring(4).toLowerCase()'';
    entities() {
      if (tab == AppRoute.clients.name) {
        return clients;
      } else if (tab == AppRoute.employees.name) {
        return employees;
      } else if (tab == AppRoute.advocates.name) {
        return advocates;
      } else if (tab == AppRoute.suppliers.name) {
        return suppliers;
      } else if (tab == AppRoute.judges.name) {
        return judges;
      }
    }

//final prevLink =
    VoidCallback headerButton(tab) {
      return () {
        row.entityRow(const Client(name: ''));
        onSaveLink.previousPage(tab);
        if (tab == AppRoute.clients.name) {
          // prevLink.previousPage(AppRoute.clients.name);
          tabItem.linkedPage(AppRoute.editClients.name);
        } else if (tab == AppRoute.employees.name) {
          //prevLink.previousPage(AppRoute.employees.name);
          tabItem.linkedPage(AppRoute.editEmployees.name);
        } else if (tab == AppRoute.advocates.name) {
          // prevLink.previousPage(AppRoute.advocates.name);
          tabItem.linkedPage(AppRoute.editAdvocates.name);
        } else if (tab == AppRoute.suppliers.name) {
          // prevLink.previousPage(AppRoute.suppliers.name);
          tabItem.linkedPage(AppRoute.editSuppliers.name);
        } else if (tab == AppRoute.judges.name) {
          //prevLink.previousPage(AppRoute.judges.name);
          tabItem.linkedPage(AppRoute.editJudges.name);
        }
      };
    }

    final enityTitle = getEntityScreenTitle(tab, context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(enityTitle),
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
              icon: imgIcons(src: 'add.png', color: lightBlue),
            ),
            const SizedBox(
              width: 100,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0*1.5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                         padding: const EdgeInsets.all(defaultPadding),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 3, 96, 139),
                            borderRadius: BorderRadius.all(Radius.circular(1))),
                    
                  //  padding: const EdgeInsets.all(defaultPadding / 8),
                    child: Center(
                      child: Row(
                        children: viewTableHeader,
                      ),
                    ),
                  ),
                ),
                const Divider(color: Colors.white70),
                Expanded(
                  child: Container(
                    //color: secondaryColor,
                   padding: const EdgeInsets.all(Sizes.p4 / 24),
                    child: entities()?.when(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, trace) =>
                            Center(child: Text(error.toString())),
                        data: (elements) => Center(
                              child: ListView.builder(
                                itemCount: elements.length,
                                itemBuilder: (context, index) {
                                  final entity = elements[index];
                                  return Column(
                                    children: [
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
                                                // color: Colors.amber,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            padding: const EdgeInsets.all(
                                                defaultPadding*.250),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                child: IconButton(
                                                  icon: imgIcons(
                                                      src: 'pencil.png',
                                                      scale: 1.5),
                                                  // onPressed: () => ClientScreenVMEdit(context: context, client: client,),
                                                  onPressed: () {
                                                    row.entityRow(entity);
                                                    onSaveLink.previousPage(tab);
                                                    tabItem.linkedPage(
                                                        editLink(tab));
                                                    // 'edit${tab.substring(0, 1).toUpperCase()}${tab.substring(1)}');
                                                    //  row.entityRow(const Client(name: ''));
                                                  },
                                                ),
                                              ),
                                             // const VerticalDivider(color: Colors.red,),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      entity.name +
                                                          (entity.documents
                                                                  .isNotEmpty
                                                              ? '  📎'
                                                              : ''),
                                                      //style: textStyle
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
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      entity.address +
                                                          (entity.documents
                                                                  .isNotEmpty
                                                              ? '  📎'
                                                              : ''),
                                                      //style: textStyle
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
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      entity.city +
                                                          (entity.documents
                                                                  .isNotEmpty
                                                              ? '  📎'
                                                              : ''),
                                                      //style: textStyle
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
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      entity.email +
                                                          (entity.documents
                                                                  .isNotEmpty
                                                              ? '  📎'
                                                              : ''),
                                                      //style: textStyle
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
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      entity.phone +
                                                          (entity.documents
                                                                  .isNotEmpty
                                                              ? '  📎'
                                                              : ''),
                                                      //style: textStyle
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
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      entity.mobile +
                                                          (entity.documents
                                                                  .isNotEmpty
                                                              ? '  📎'
                                                              : ''),
                                                      //style: textStyle
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
                                              Expanded(
                                                child: IconButton(
                                                  //icon: const Icon(Icons.delete),
                                                  icon: imgIcons(
                                                      src: 'garbage.png',
                                                      color: Colors.orangeAccent),
                                                  onPressed: tab ==
                                                          AppRoute.clients.name
                                                      ? () => controller
                                                          .deleteClient(entity)
                                                      : tab ==
                                                              AppRoute
                                                                  .employees.name
                                                          ? () => controller
                                                              .deleteEmployee(
                                                                  entity)
                                                          : () => controller
                                                              .deleteEmployee(
                                                                  entity),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ),
                                      const Divider(color: Colors.white70),
                                    ],
                                  );
                                  ;
                                },
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
