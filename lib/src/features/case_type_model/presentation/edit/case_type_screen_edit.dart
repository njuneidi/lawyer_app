// Create a Form widget.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lawyer_app/src/common_widgets/responsive_center.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/case_type_model/model/case_type_model.dart';
import 'package:lawyer_app/src/features/common/home_app_bar.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class CaseTypeScreenEdit extends ConsumerStatefulWidget {
  const CaseTypeScreenEdit({this.entity, required this.context, super.key});
  final BuildContext context;
  final CaseTypeModel? entity;

  //final Function(BuildContext) onSavePressed;

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends ConsumerState<CaseTypeScreenEdit> {
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

    //final casetypes = ref.watch(caseTypesProvider);
    //final caseItem = ref.watch(getCaseByIDProvider(widget.entity!.caseID));
    //final caseData = casetypes.value ?? [];
    final databaseController = ref.watch(entityControllerProvider);
    final tabItem = ref.watch(tabItemsNotifierProvider.notifier);
    final tab = ref.watch(tabItemsNotifierProvider);

    final scrollController = ScrollController();
    final onSaveLink =
        '${tab.substring(4, 5).toLowerCase()}${tab.substring(5)}';

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
              duration: const Duration(seconds: 10),
              // content: Text(
              //   '${textfieldData.values.toString()} ------ \n   ${widget.entity!.title} ---- $onSaveLink ----$textfieldData')));
              content: Text('edit $edit $textfieldData $onSaveLink')));
          // databaseController.updateCaseType(widget.entity!, textfieldData);
          edit
              ? databaseController.updateCaseType(
                  widget.entity!, textfieldData, AppRoute.casesType.name)
              : databaseController.addCaseType(
                  textfieldData, AppRoute.casesType.name);

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
                                      maxLength: 14,
                                      style: formStyle(context),
                                      name: 'title',
                                      initialValue:
                                          edit ? widget.entity!.title : '',

                                      decoration:
                                          decoration(context.loc.caseTypeTitle),
                                      onChanged: (value) => debugPrint(value),
                                      valueTransformer: (value) =>
                                          value.toString().trim(),
                                      // controller: _nameController,
                                      // valueTransformer: (text) => num.tryParse(text),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        //FormBuilderValidators.numeric(),
                                        //FormBuilderValidators.max( 70),
                                      ]),
                                      // keyboardType: TextInputType.number,
                                    ),
                                    FormBuilderTextField(
                                      style: formStyle(context),
                                      name: 'description',
                                      initialValue: edit
                                          ? widget.entity!.description
                                          : '',

                                      keyboardType: TextInputType.multiline,
                                      maxLines: 10,
                                      minLines: 10,

                                      decoration: decoration(
                                          context.loc.caseTypeDescription),
                                      onChanged: (value) => debugPrint(value),
                                      valueTransformer: (value) =>
                                          value.toString().trim(),
                                      // controller: _nameController,
                                      // valueTransformer: (text) => num.tryParse(text),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        //FormBuilderValidators.numeric(),
                                        //FormBuilderValidators.max( 70),
                                      ]),
                                      // keyboardType: TextInputType.number,
                                    ),
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
                              imgIcons2(
                                  src: '${AppRoute.casesType.name}.png',
                                  scale: 1.9),
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
