// Create a Form widget.
//import 'package:country_picker/country_picker.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:countries_utils/countries_utils.dart';

import 'package:lawyer_app/src/common_widgets/responsive_center.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/entity_controller/controller/entity_controller.dart';
import 'package:lawyer_app/src/features/entity/domain/client.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class EnitityScreenEdit extends ConsumerStatefulWidget {
  const EnitityScreenEdit({this.entity, required this.context, super.key});
  final BuildContext context;
  final Client? entity;

  //final Function(BuildContext) onSavePressed;

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends ConsumerState<EnitityScreenEdit> {
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
    final List<Country> countries = Countries.all();
    final onSaveLink = tab.substring(4).toLowerCase();
    //final prevLink = ref.watch(previousItemProvider.notifier);
    //prevLink.previousPage(tab);
    final backLink = ref.watch(previousLinkNotifierProvider);
    //debugPrint('backLink $backLink');

    final editEntityRow = widget.entity?.name != '' ? true : false;

    final editEntityScreenTitle =
        getEditScreenEntityTitle(tab, context, editEntityRow);

    if (editEntityRow) {
      //debugPrint('true');
    } else {
      //debugPrint('false');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        // foregroundColor: Colors.black54,
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

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(textfieldData.values.toString())));
                getSaveAction(tab, databaseController, editEntityRow,
                    textfieldData, widget.entity!);

                // databaseController.addClient(textfieldData);
                // widget.entity?.name == ''
                //     ? databaseController.addClient(textfieldData)
                //     : databaseController.updateClient(
                //         widget.entity!, textfieldData);
                tabItem.linkedPage(onSaveLink);
                //tab.linkedPage("definition");
                // myFiels.myFielsPage('editClient');
              }
            },
            //icon: imgIcons(src: 'save.png', color:Colors.white70),
            icon: imgIcons(src: 'save.png'),
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
                        flex: 4,
                        child: Column(
                          children: [
                            FormBuilder(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FormBuilderTextField(
                                    name: 'name',
                                    initialValue: editEntityRow
                                        ? widget.entity!.name
                                        : '',
                                    style: formStyle(context),
                                    decoration: decoration(
                                        widget.context.loc.nameFieldLabelText),
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
                                    decoration: decoration(
                                        widget.context.loc.idNumberLabel),
                                    name: 'cardIDNumber',
                                    initialValue: editEntityRow
                                        ? widget.entity!.name
                                        : '',

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
                                    name: 'address',
                                    initialValue: editEntityRow
                                        ? widget.entity!.address
                                        : '',
                                    style: formStyle(context),
                                    decoration: decoration(
                                        widget.context.loc.addressFieldLabel),
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
                                    name: 'city',
                                    initialValue: editEntityRow
                                        ? widget.entity!.city
                                        : '',
                                    style: formStyle(context),
                                    decoration: decoration(
                                        widget.context.loc.cityFieldLabel),
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
                                  FormBuilderDropdown(
                                     dropdownColor: bgColor,

                                    //focusColor: primaryColor,

                                    initialValue: editEntityRow
                                        ? widget.entity!.gender
                                        : null,
                                    icon: const Icon(
                                      Icons.people,
                                      color: secondaryColor,
                                    ),
                                    name: 'gender',
                                    
                                    
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.merge(const TextStyle(
                                            color: Colors.black87)),
                                    decoration: decoration(
                                      
                                        widget.context.loc.selectGender),
                                    //  hint: Text(widget.context.loc.selectGender),
                                    items: gender(widget.context)
                                        .map((gender) => DropdownMenuItem(
                                              value: gender['value'],
                                              child: Text('${gender['value']}'),
                                            ))
                                        .toList(),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    onChanged: (value) => widget.entity!.gender,
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
                                    initialValue: editEntityRow
                                        ? widget.entity!.dob
                                        : null,
                                    name: 'dob',

                                    inputType: InputType.date,

                                    decoration: decoration(widget
                                        .context.loc.birthOfDateFieldLabel),
                                    //locale: Locale('ar','EG'),
                                    // format: DateFormat.yMd('en'),
                                    initialDate: DateTime(1980),
                                    // locale: const Locale('en'),

                                    //validator: (value) => null,
                                    // initialValue: DateTime.now(),
                                    // enabled: true,
                                  ),
                                  FormBuilderTextField(
                                    name: 'email',
                                    // keyboardType: input.email,
                                    initialValue: editEntityRow
                                        ? widget.entity!.email
                                        : '',
                                    style: formStyle(context),
                                    decoration:
                                        decoration(widget.context.loc.email),
                                    onChanged: (value) => debugPrint(value),
                                    valueTransformer: (value) =>
                                        value.toString().trim(),
                                    // controller: _nameController,
                                    // valueTransformer: (text) => num.tryParse(text),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.email(),
                                      //FormBuilderValidators.max( 70),
                                    ]),
                                     keyboardType: TextInputType.emailAddress,
                                  ),
                                  FormBuilderPhoneField(
                                    name: 'phone',
                                    initialValue: editEntityRow
                                        ? widget.entity!.phone
                                        : '',
                                    style: formStyle(context),
                                    decoration: decoration(
                                        widget.context.loc.phoneFieldLabel),
                                    priorityListByIsoCode: const ['PS'],
                                    defaultSelectedCountryIsoCode: 'PS',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                  ),
                                  FormBuilderPhoneField(
                                    name: 'mobile',
                                    initialValue: editEntityRow
                                        ? widget.entity!.mobile
                                        : '',
                                    style: formStyle(context),
                                    decoration: decoration(
                                        widget.context.loc.mobileFieldLabel),
                                    priorityListByIsoCode: const ['PS'],
                                    defaultSelectedCountryIsoCode: 'PS',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                  ),
                                ],
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
                              child: imgIcons2(src: 'addUser.png', scale: .2)),
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
