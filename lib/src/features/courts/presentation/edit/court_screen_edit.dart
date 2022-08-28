// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:lawyer_app/src/common_widgets/responsive_center.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/courts/domain/court.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class CourtScreenEdit extends ConsumerStatefulWidget {
  const CourtScreenEdit({this.entity, required this.context, super.key});
  final BuildContext context;
  final Court? entity;

  //final Function(BuildContext) onSavePressed;

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends ConsumerState<CourtScreenEdit> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.

  final _formKey = GlobalKey<FormBuilderState>();
  final _nameController = TextEditingController();
  String get name => _nameController.text;

  @override
  Widget build(
    BuildContext context,
  ) {
    // Build a Form widget using the _formKey created above.
    final tabItem = ref.watch(tabItemsNotifierProvider.notifier);
    final tab = ref.watch(tabItemsNotifierProvider);
    final databaseController = ref.watch(entityControllerProvider);
    final scrollController = ScrollController();

    final onSaveLink = tab.substring(4).toLowerCase();

    final backLink = ref.watch(previousLinkNotifierProvider);
    //debugPrint('backLink $backLink');

    final editCourtRow = widget.entity?.name != '' ? true : false;

    final editEntityScreenTitle =
        getEditScreenEntityTitle(tab, context, editCourtRow);

    return Scaffold(
      appBar: AppBar(
        backgroundColor:secondaryColor,
      //  foregroundColor: Colors.black54,
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
                        '${textfieldData.values.last}  ${widget.entity!.name} $onSaveLink $textfieldData')));
                //databaseController.updateCourt(widget.entity!, textfieldData);
                editCourtRow
                    ? databaseController.updateCourt(
                        widget.entity!, textfieldData, AppRoute.courts.name)
                    : databaseController.addCourt(textfieldData,AppRoute.courts.name);

                tabItem.linkedPage(onSaveLink);
              }
            },
            icon: imgIcons(src: 'save.png', scale: 1.6,color: Colors.white54),
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
                                      style: formStyle(context),
                                      name: 'name',
                                      initialValue: editCourtRow
                                          ? widget.entity!.name
                                          : '',

                                      decoration: decoration(context.loc.courtName),
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
                                      name: 'address',
                                      initialValue: editCourtRow
                                          ? widget.entity!.address
                                          : '',
                                      decoration: decoration(context.loc.courtAdress)
                                    ),
                                    FormBuilderTextField(
                                      style: formStyle(context),
                                      name: 'location',
                                      initialValue: editCourtRow
                                          ? widget.entity!.location
                                          : '',
                                      decoration: decoration(context.loc.courtLocation),
                                      onChanged: (value) => debugPrint(value),
                                      valueTransformer: (value) =>
                                          value.toString().trim(),
                                      // controller: _nameController,
                                      // valueTransformer: (text) => num.tryParse(text),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      // keyboardType: TextInputType.number,
                                    ),
                                    FormBuilderTextField(
                                      style: formStyle(context),
                                      name: 'city',
                                      initialValue: editCourtRow
                                          ? widget.entity!.city
                                          : '',
                                      decoration: decoration(context.loc.cityFieldLabel,),
                                      onChanged: (value) => debugPrint(value),
                                      valueTransformer: (value) =>
                                          value.toString().trim(),
                                      // controller: _nameController,
                                      // valueTransformer: (text) => num.tryParse(text),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      // keyboardType: TextInputType.number,
                                    ),
                                    FormBuilderPhoneField(
                                      name: 'phone',
                                      initialValue: editCourtRow
                                          ? widget.entity!.phone
                                          : '',
                                          //backgroundColor: primaryColor,
                                           style: formStyle(context),
                                      decoration: decoration(context.loc.phoneFieldLabel,),
                                      priorityListByIsoCode: const ['PS'],
                                      defaultSelectedCountryIsoCode: 'PS',
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
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
                              child: imgIcons2(src: 'courts.png', scale: 1.9)),
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
