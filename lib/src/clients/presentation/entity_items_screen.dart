import 'package:flutter/material.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/entity/controller/entity_controller.dart';
import 'package:lawyer_app/src/screens/main/controller/entity_row_notifier.dart';
import 'package:lawyer_app/src/screens/main/controller/side_menu_items.dart';

class ClientiItems extends StatelessWidget {
  const ClientiItems({
    Key? key,
    required this.tabItem,
    required this.tab,
    required this.entity,
    required this.controller,
    required this.row,
  }) : super(key: key);

  final TabItemsNotifier tabItem;
  final String tab;
  final Client entity;
  final EntityConroller controller;
  final ClientRowNotifier row;

  @override
  Widget build(BuildContext context) {
  
    return InkWell(
        onTap: () {
         // row.entityRow(const Client(name: ''));
          tabItem.linkedPage(editLink(tab));
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  // onPressed: () => ClientScreenVMEdit(context: context, client: client,),
                  onPressed: () {
                    row.entityRow(entity);

                    tabItem.linkedPage(editLink(tab));
                       // 'edit${tab.substring(0, 1).toUpperCase()}${tab.substring(1)}');
                    //  row.entityRow(const Client(name: ''));
                  },
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      entity.name + (entity.documents.isNotEmpty ? '  📎' : ''),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      entity.address +
                          (entity.documents.isNotEmpty ? '  📎' : ''),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      entity.city + (entity.documents.isNotEmpty ? '  📎' : ''),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      entity.email +
                          (entity.documents.isNotEmpty ? '  📎' : ''),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      entity.phone +
                          (entity.documents.isNotEmpty ? '  📎' : ''),
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
                  icon: const Icon(Icons.delete),
                  onPressed: tab == AppRoute.clients.name
                      ? () => controller.deleteClient(entity)
                      : () => controller.deleteEmployee(entity),
                ),
              ),
            ]),
          ),
        ));
  }
}
