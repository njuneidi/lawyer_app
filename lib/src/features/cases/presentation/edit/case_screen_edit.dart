// Create a Form widget.

import 'package:flutter/foundation.dart';
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
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class CaseScreenEdit extends ConsumerStatefulWidget {
  const CaseScreenEdit({this.entity, required this.context, super.key});
  final BuildContext context;
  final Case? entity;

  //final Function(BuildContext) onSavePressed;

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends ConsumerState<CaseScreenEdit> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.

  final _formKey = GlobalKey<FormBuilderState>();
  final _nameController = TextEditingController();
  bool _useCustomFileViewer = true;

  String get name => _nameController.text;

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

  @override
  Widget build(
    BuildContext context,
  ) {
    // Build a Form widget using the _formKey created above.
    final clients = ref.watch(clientsProvider);

    //final x = <String>[];
    final Map<String, String> x = {};

    final clientName = clients.valueOrNull;

    clientName?.forEach((element) {
      //x.add(element.name.toString());
      x[element.id.toString()] = element.name;
    });

    //debugPrint(clientName!.first.address)
    final fclients = ref.watch(filteredClientsProvider(''));
    final fclientName = fclients.value;

    filteredClients(filter) => ref.watch(filteredClientsProvider(filter)).value;
    getData(String filter) {
      return filteredClients(filter);
    }
    //Future<List<Client>>   x(String filter) async => clientName!.firstWhere((element) => element==filter);

    final tabItem = ref.watch(tabItemsNotifierProvider.notifier);
    final tab = ref.watch(tabItemsNotifierProvider);
    final databaseController = ref.watch(entityControllerProvider);
    final scrollController = ScrollController();

    final onSaveLink = tab.substring(4).toLowerCase();

    final backLink = ref.watch(previousLinkNotifierProvider);
    debugPrint('backLink $backLink');

    final editRow = widget.entity?.title != '' ? true : false;

    final editEntityScreenTitle =
        getEditScreenEntityTitle(tab, context, editRow);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: BackButton(
          onPressed: () {
            return tabItem.linkedPage(backLink);
          },
        ),
        title: Text(editEntityScreenTitle),
        actions: [
          IconButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                _formKey.currentState!.save();
                final textfieldData = _formKey.currentState!.value;

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        '${textfieldData.values.last}  ${widget.entity!.title} $onSaveLink $textfieldData')));
                //databaseController.updateCourt(widget.entity!, textfieldData);
                editRow
                    ? databaseController.updateCase(
                        widget.entity!, textfieldData, AppRoute.cases.name)
                    : databaseController.addCase(
                        textfieldData, AppRoute.cases.name);

                tabItem.linkedPage(onSaveLink);
              }
            },
            icon: imgIcons(src: 'save.png', scale: 1.6, color: Colors.white),
            tooltip: context.loc.save,
            //  child: Text(context.loc.submit),
          ),
          const SizedBox(
            width: 100,
          ),
        ],
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
                                      textDirection: TextDirection.rtl,
                                      name: 'title',
                                      initialValue:
                                          editRow ? widget.entity!.title : '',

                                      decoration: InputDecoration(
                                        labelText: widget.context.loc.caseTitle,
                                        // 'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                                      ),
                                      onChanged: (value) => debugPrint(value),
                                      valueTransformer: (value) =>
                                          value.toString().trim(),

                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      // keyboardType: TextInputType.number,
                                    ),
                                    FormBuilderTextField(
                                      name: 'description',
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 10,
                                      minLines: 10,
                                      //  cursorWidth: 10,

                                      initialValue: editRow
                                          ? widget.entity!.description
                                          : '',
                                      decoration: InputDecoration(
                                        labelText:
                                            widget.context.loc.caseDescription,
                                        // 'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                                      ),
                                    ),

                                    FormBuilderSearchableDropdown<String>(
                                      popupProps: const PopupProps.menu(
                                          constraints:
                                              BoxConstraints(maxHeight: 230),
                                          showSearchBox: true),
                                      // dropdownButtonProps:
                                      //     const DropdownButtonProps(
                                      //         padding: EdgeInsets.all(4)),
                                      dropdownSearchDecoration: InputDecoration(
                                        hintText: context.loc.searchEntity,
                                        labelText: context.loc.searchEntity,
                                      ),
                                      name: 'clientID',
                                      initialValue: editRow
                                          ? widget.entity!.clientID
                                          : '',
                                      items: x.values.toList(),

                                      itemAsString: (item) => item,

                                      //onChanged: _onChanged,
                                      decoration: InputDecoration(
                                          icon: const Icon(Icons.people),
                                          // fillColor: Colors.amberAccent,

                                          labelText: context.loc.searchEntity),
                                      filterFn: (client, filter) => client
                                          .toLowerCase()
                                          .contains(filter.toLowerCase()),
                                      onChanged: (value) =>
                                          widget.entity!.clientID,
                                    ),
                                    FormBuilderFilePicker(
                                      name: 'images',
                                      decoration: const InputDecoration(
                                          labelText: 'Attachments'),
                                      maxFiles: null,
                                      allowMultiple: true,
                                      previewImages: true,
                                      onChanged: (val) =>
                                          debugPrint(val.toString()),
                                      typeSelectors: [
                                        TypeSelector(
                                          type: FileType.any,
                                          selector: Row(
                                            children: const <Widget>[
                                              Icon(Icons.file_upload),
                                              Text('Upload'),
                                            ],
                                          ),
                                        )
                                      ],
                                      onFileLoading: (val) {
                                        debugPrint(val.toString());
                                      },
                                      customFileViewerBuilder:
                                          _useCustomFileViewer
                                              ? customFileViewerBuilder
                                              : null,
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          child: const Text('Submit'),
                                          onPressed: () {
                                            _formKey.currentState!.save();
                                            debugPrint(_formKey
                                                .currentState!.value
                                                .toString());
                                          },
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                          child: Text(_useCustomFileViewer
                                              ? 'Use Default File Viewer'
                                              : 'Use Custom File Viewer'),
                                          onPressed: () {
                                            setState(() =>
                                                _useCustomFileViewer =
                                                    !_useCustomFileViewer);
                                          },
                                        ),
                                      ],
                                    ),
                                    FormBuilderFilePicker(
                                      name: "images",
                                      decoration: const InputDecoration(
                                          labelText: "Attachments"),
                                      maxFiles: null,
                                      previewImages: true,
                                      onChanged: (val) => print(val),
                                      typeSelectors: [
                                        TypeSelector(
                                          type: FileType.any,
                                          selector: Row(
                                            children: <Widget>[
                                              const Icon(Icons.add_circle),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.0),
                                                child:
                                                    const Text("Add documents"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      onFileLoading: (val) {
                                        print(val);
                                      },
                                    ),

                                    FormBuilderFilePicker(
                                      name: "attachments",
                                      previewImages: false,
                                      allowMultiple: true,
                                      withData: true,
                                      typeSelectors: [
                                        TypeSelector(
                                          type: FileType.any,
                                          selector: Row(
                                            children: const <Widget>[
                                              Icon(Icons.add_circle),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.0),
                                                child: Text("Add documents"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!kIsWeb)
                                          TypeSelector(
                                            type: FileType.image,
                                            selector: Row(
                                              children: const <Widget>[
                                                Icon(Icons.add_photo_alternate),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text("Add images"),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    )

                                    //  items: gender(widget.context)
                                    //     .map((gender) => DropdownMenuItem(
                                    //           value: gender['value'],
                                    //           child: Text('${gender['value']}'),
                                    //         ))
                                    //     .toList(),
                                    // DropdownSearch<String>(
                                    //   popupProps: const PopupProps.menu(
                                    //     showSearchBox: true,
                                    //     fit: FlexFit.loose,
                                    //     title: Text(
                                    //         'fit to a specific max height'),
                                    //     constraints:
                                    //         BoxConstraints(maxHeight: 300),
                                    //   ),
                                    //   items: x,
                                    //   dropdownDecoratorProps:
                                    //       const DropDownDecoratorProps(
                                    //     dropdownSearchDecoration:
                                    //         InputDecoration(labelText: "Name"),
                                    //   ),

                                    //   filterFn: (client, filter) =>
                                    //       filter.toString().contains(filter),
                                    //   // asyncItems:( filter) => x(filter),
                                    //   itemAsString: (Client u) => u.name,
                                    //   onChanged: (Client? data) => print(data),
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
                              child: imgIcons(src: 'cases.png', scale: 1.9)),
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
}
