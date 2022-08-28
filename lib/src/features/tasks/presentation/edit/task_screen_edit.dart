// Create a Form widget.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lawyer_app/src/common_widgets/responsive_center.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/cases/domain/case.dart';
import 'package:lawyer_app/src/features/common/home_app_bar.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';
import 'package:lawyer_app/src/features/tasks/domain/task.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class TaskScreenEdit extends ConsumerStatefulWidget {
  const TaskScreenEdit({this.entity, required this.context, super.key});
  final BuildContext context;
  final Task? entity;

  //final Function(BuildContext) onSavePressed;

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends ConsumerState<TaskScreenEdit> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.

  final _formKey = GlobalKey<FormBuilderState>();
  bool _useCustomFileViewer = true;

  @override
  Widget build(
    BuildContext context,
  ) {
    // Build a Form widget using the _formKey created above.
    final clients = ref.watch(clientsProvider);
    final client = ref.watch(getClientByIDProvider(widget.entity!.clientID));
    final clientData = clients.value ?? [];
    final databaseController = ref.watch(entityControllerProvider);

    final tabItem = ref.watch(tabItemsNotifierProvider.notifier);
    final tab = ref.watch(tabItemsNotifierProvider);

    final scrollController = ScrollController();
    final onSaveLink = tab.substring(4).toLowerCase();
    final edit = widget.entity?.title != '' ? true : false;
    final enityTitle = getEditScreenEntityTitle(tab, context, edit);

    VoidCallback headerButton(tab) {
      return () {
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          _formKey.currentState!.save();
          final textfieldData = _formKey.currentState!.value;

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 3),
              // content: Text(
              //   '${textfieldData.values.toString()} ------ \n   ${widget.entity!.title} ---- $onSaveLink ----$textfieldData')));
              content: Text('edit $edit $textfieldData')));
          //databaseController.updateCourt(widget.entity!, textfieldData);
          edit
              ? databaseController.updateTask(
                  widget.entity!, textfieldData, AppRoute.tasks.name)
              : databaseController.addTask(textfieldData, AppRoute.tasks.name);

          tabItem.linkedPage(onSaveLink);
        }
      };
    }

    return Scaffold(
      appBar: HomeAppBar(
        tab: tab,
        enityTitle: enityTitle,
        imageIcon: const Icon(Icons.save),
        //item: item,
        tabItem: tabItem, headerButton: headerButton(tab),
      ),
      body: CustomScrollView(controller: scrollController, slivers: [
        ResponsiveSliverCenter(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding / 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            FormBuilder(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: FocusTraversalGroup(
                                policy: OrderedTraversalPolicy(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormBuilderTextField(
                                      style: formStyle(context),
                                      textDirection: TextDirection.rtl,
                                      name: 'title',
                                      initialValue:
                                          edit ? widget.entity!.title : '',

                                      decoration: decoration(
                                          widget.context.loc.taskTitle),
                                      onChanged: (value) => debugPrint(value),
                                      valueTransformer: (value) =>
                                          value.toString().trim(),

                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      // keyboardType: TextInputType.number,
                                    ),
                                      FormBuilderSearchableDropdown<Client>(
                                      //                                   dropdownSearchTextStyle: Theme.of(context)
                                      // .textTheme
                                      // .titleMedium
                                      // ?.merge(const TextStyle(color: primaryColor)),

                                      name: 'clientID',
                                      initialValue: client.value,
                                      popupProps: const PopupProps.menu(
                                          constraints:
                                              BoxConstraints(maxHeight: 230),
                                          showSearchBox: true),
                                      items: clientData,
                                      selectedItem: client.value,
                                      itemAsString: (Client c) => c.name,
                                      decoration: decoration(
                                        context.loc.clients,
                                        prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add,
                                              color: secondaryColor,
                                            )),
                                        icon: const Icon(
                                          Icons.people,
                                          color: secondaryColor,
                                        ),
                                      ),
                                      filterFn: (client, filter) => client.name
                                          .toLowerCase()
                                          .contains(filter.toLowerCase()),
                                      onChanged: (value) => print(value),
                                      compareFn: (i, s) => i.id == s.id,
                                    ),
                                      FormBuilderSearchableDropdown<Case>(
                                      //                                   dropdownSearchTextStyle: Theme.of(context)
                                      // .textTheme
                                      // .titleMedium
                                      // ?.merge(const TextStyle(color: primaryColor)),

                                      name: 'caseID',
                                      initialValue: client.value,
                                      popupProps: const PopupProps.menu(
                                          constraints:
                                              BoxConstraints(maxHeight: 230),
                                          showSearchBox: true),
                                      items: clientData,
                                      selectedItem: client.value,
                                      itemAsString: (Client c) => c.name,
                                      decoration: decoration(
                                        context.loc.clients,
                                        prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add,
                                              color: secondaryColor,
                                            )),
                                        icon: const Icon(
                                          Icons.people,
                                          color: secondaryColor,
                                        ),
                                      ),
                                      filterFn: (client, filter) => client.name
                                          .toLowerCase()
                                          .contains(filter.toLowerCase()),
                                      onChanged: (value) => print(value),
                                      compareFn: (i, s) => i.id == s.id,
                                    ),
                                    FormBuilderDateTimePicker(
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.merge(const TextStyle(
                                              color: Colors.black87)),
                                      resetIcon: const Icon(
                                        Icons.cancel,
                                        color: secondaryColor,
                                      ),

                                      initialDatePickerMode: DatePickerMode.day,
                                      initialEntryMode:
                                          DatePickerEntryMode.calendar,
                                      // initialValue: editEntityRow
                                      //     ? widget.entity!.dob
                                      //     : null,
                                      name: 'startDate',

                                      inputType: InputType.date,

                                      decoration: decoration(widget
                                          .context.loc.taskStartDate),
                                      //locale: Locale('ar','EG'),
                                      // format: DateFormat.yMd('en'),
                                      initialDate: DateTime.now(),
                                      // locale: const Locale('en'),

                                      //validator: (value) => null,
                                      // initialValue: DateTime.now(),
                                      // enabled: true,
                                    ),
                                      FormBuilderDateTimePicker(
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.merge(const TextStyle(
                                              color: Colors.black87)),
                                      resetIcon: const Icon(
                                        Icons.cancel,
                                        color: secondaryColor,
                                      ),

                                      initialDatePickerMode: DatePickerMode.day,
                                      initialEntryMode:
                                          DatePickerEntryMode.calendar,
                                      // initialValue: editEntityRow
                                      //     ? widget.entity!.dob
                                      //     : null,
                                      name: 'startDate',

                                      inputType: InputType.time,

                                      decoration: decoration(widget
                                          .context.loc.taskStartTime),
                                      //locale: Locale('ar','EG'),
                                      // format: DateFormat.yMd('en'),
                                      initialDate: DateTime.now(),
                                      // locale: const Locale('en'),

                                      //validator: (value) => null,
                                      // initialValue: DateTime.now(),
                                      // enabled: true,
                                    ),
                                    // FormBuilderSearchableDropdown<Client>(
                                    //   name: 'clientID',
                                    //   initialValue: client.value,
                                    //   popupProps: const PopupProps.menu(
                                    //       constraints:
                                    //           BoxConstraints(maxHeight: 230),
                                    //       showSearchBox: true),
                                    //   items: clientData,
                                    //   selectedItem: client.value,
                                    //   itemAsString: (Client c) => c.name,
                                    //        decoration: decoration(
                                    //     context.loc.clients,
                                    //     prefixIcon: IconButton(
                                    //         onPressed: () {},
                                    //         icon: const Icon(
                                    //           Icons.add,
                                    //           color: secondaryColor,
                                    //         )),
                                    //     icon: const Icon(
                                    //       Icons.people,
                                    //       color: secondaryColor,
                                    //     ),
                                    //   ),
                                    //   filterFn: (client, filter) => client.name
                                    //       .toLowerCase()
                                    //       .contains(filter.toLowerCase()),
                                    //   onChanged: (value) => print(value),
                                    //   compareFn: (i, s) => i.id == s.id,
                                    // ),
                                    // FormBuilderSearchableDropdown<Case>(
                                    //   name: 'CaseID',
                                    //   initialValue: caseItem.value,
                                    //   popupProps: const PopupProps.menu(
                                    //       constraints:
                                    //           BoxConstraints(maxHeight: 230),
                                    //       showSearchBox: true),
                                    //   items: caseData,
                                    //   selectedItem: caseItem.value,
                                    //   itemAsString: (Case c) => c.title,
                                    //   decoration:      decoration(
                                    //     context.loc.cases,
                                    //     prefixIcon: IconButton(
                                    //         onPressed: () {},
                                    //         icon: const Icon(
                                    //           Icons.add,
                                    //           color: secondaryColor,
                                    //         )),
                                    //     icon: const Icon(
                                    //       Icons.people,
                                    //       color: secondaryColor,
                                    //     ),
                                    //   ),
                                    //   filterFn: (client, filter) => client.title
                                    //       .toLowerCase()
                                    //       .contains(filter.toLowerCase()),
                                    //   onChanged: (value) => print(value),
                                    //   compareFn: (i, s) => i.id == s.id,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Center(
                              child: Column(
                            children: [
                              imgIcons2(src: 'tasks.png', scale: 1.9),
                              // FormBuilderFilePicker(
                              //   name: 'images',
                              //   decoration: const InputDecoration(
                              //       labelText: 'Attachments'),
                              //   maxFiles: null,
                              //   allowMultiple: true,
                              //   previewImages: true,
                              //   onChanged: (val) => //debugPrint(val.toString()),
                              //   typeSelectors: [
                              //     TypeSelector(
                              //       type: FileType.any,
                              //       selector: Row(
                              //         children: const <Widget>[
                              //           Icon(Icons.file_upload),
                              //           Text('Upload'),
                              //         ],
                              //       ),
                              //     )
                              //   ],
                              //   onFileLoading: (val) {
                              //     //debugPrint(val.toString());
                              //   },
                              //   customFileViewerBuilder: _useCustomFileViewer
                              //       ? customFileViewerBuilder
                              //       : null,
                              // ),
                              // const SizedBox(height: 20),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceAround,
                              //   children: [
                              //     // ElevatedButton(
                              //     //   child: const Text('Submit'),
                              //     //   onPressed: () {
                              //     //     _formKey.currentState!.save();
                              //     //     //debugPrint(_formKey
                              //     //         .currentState!.value
                              //     //         .toString());
                              //     //   },
                              //     // ),
                              //     //  const Spacer(),
                              //     ElevatedButton(
                              //       child: Text(_useCustomFileViewer
                              //           ? 'Use Default File Viewer'
                              //           : 'Use Custom File Viewer'),
                              //       onPressed: () {
                              //         setState(() => _useCustomFileViewer =
                              //             !_useCustomFileViewer);
                              //       },
                              //     ),
                              //   ],
                              // ),
                            ],
                          )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget customFileViewerBuilder(
    List<PlatformFile>? files,
    FormFieldSetter<List<PlatformFile>> setter,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final file = files![index];
        return ListTile(
          title: Text(file.name),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              files.removeAt(index);
              setter.call([...files]);
            },
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.blueAccent,
      ),
      itemCount: files!.length,
    );
  }
}
