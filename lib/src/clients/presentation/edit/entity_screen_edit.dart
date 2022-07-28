// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';

import 'package:lawyer_app/src/common_widgets/responsive_center.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/entity/controller/entity_controller.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/screens/main/controller/side_menu_items.dart';

class ClientScreenVMEdit extends ConsumerStatefulWidget {
  const ClientScreenVMEdit({this.entity, required this.context, super.key});
  final BuildContext context;
  final Client? entity;

  //final Function(BuildContext) onSavePressed;

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends ConsumerState<ClientScreenVMEdit> {
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
    final tabItem = ref.watch(sideMenuItemProvider.notifier);
    final tab = ref.watch(sideMenuItemProvider);
    final databaseController = ref.watch(entityControllerProvider);
    final scrollController = ScrollController();

    final onSaveLink = tab.substring(4).toLowerCase();
    //final prevLink = ref.watch(previousItemProvider.notifier);
    //prevLink.previousPage(tab);
    final backLink = ref.watch(previousItemProvider);
    debugPrint('backLink $backLink');

    final editEntityRow = widget.entity?.name != '' ? true : false;

    final editEntityScreenTitle =
        getEditScreenEntityTitle(tab, context, editEntityRow);

    if (editEntityRow) {
      debugPrint('true');
    } else {
      debugPrint('false');
    }

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

                //ScaffoldMessenger.of(context)
                //.showSnackBar(SnackBar(content: Text(textfieldData)));
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
            icon: imgIcons(src: 'save2.png', scale: 1.6),
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
              padding: const EdgeInsets.all(defaultPadding/4),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                        
                    children: [
                      Expanded(
                        
                        flex:2,
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
                                    initialValue:
                                        editEntityRow ? widget.entity!.name : '',
                      
                                    decoration: InputDecoration(
                                      labelText: widget.context.loc.nameFieldLabelText,
                                      // 'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                                    ),
                                    onChanged: (value) => debugPrint(value),
                                    valueTransformer: (value) => value.toString().trim(),
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
                                    initialValue:
                                        editEntityRow ? widget.entity!.address : '',
                                    decoration: InputDecoration(
                                      labelText: widget.context.loc.addressFieldLabel,
                                      // 'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                                    ),
                                    onChanged: (value) => debugPrint(value),
                                    valueTransformer: (value) => value.toString().trim(),
                                    // controller: _nameController,
                                    // valueTransformer: (text) => num.tryParse(text),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    // keyboardType: TextInputType.number,
                                  ),
                                  FormBuilderTextField(
                                    name: 'city',
                                    initialValue:
                                        editEntityRow ? widget.entity!.city : '',
                                    decoration: InputDecoration(
                                      labelText: widget.context.loc.cityFieldLabel,
                                      // 'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                                    ),
                                    onChanged: (value) => debugPrint(value),
                                    valueTransformer: (value) => value.toString().trim(),
                                    // controller: _nameController,
                                    // valueTransformer: (text) => num.tryParse(text),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    // keyboardType: TextInputType.number,
                                  ),
                                  FormBuilderDropdown(
                                    // initialValue:  (BuildContext context) {
                                    //   return gender(widget.context).map<Widget>((e) {
                                    //     return SafeArea(
                                    //         child: Column(
                                    //       children: [
                                    //         Text( e['value']!),
                      
                                    //       ],
                                    //     ));
                                    //   }).toList();
                                    // },
                                    icon: const Icon(Icons.people),
                                    selectedItemBuilder: (BuildContext context) {
                                      return gender(widget.context).map<Widget>((e) {
                                        return SafeArea(
                                            child: Column(
                                          children: [
                                            Text(e['value']!),
                                          ],
                                        ));
                                      }).toList();
                                    },
                      
                                    name: 'gender',
                                    //  initialValue:
                                    //   widget.client != null ? widget.client!.gender : ' ذكر',
                                    decoration: const InputDecoration(
                                      //labelText: widget.context.loc.gender,
                                      border: OutlineInputBorder(),
                                      // 'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                                    ),
                                    hint: Text(widget.context.loc.selectGender),
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
                                    initialValue:
                                        editEntityRow ? widget.entity!.dob : null,
                                    name: 'bod',
                      
                                    // onChanged: _onChanged,
                                    inputType: InputType.date,
                                    decoration: InputDecoration(
                                      labelText: widget.context.loc.birthOfDateFieldLabel,
                                    ),
                                    initialDate: DateTime(1980),
                                    // initialValue: DateTime.now(),
                                    // enabled: true,
                                  ),
                                  FormBuilderTextField(
                                    name: 'email',
                                    initialValue:
                                        editEntityRow ? widget.entity!.email : '',
                                    decoration: InputDecoration(
                                      labelText: widget.context.loc.emailFieldLabel,
                                      // 'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                                    ),
                                    onChanged: (value) => debugPrint(value),
                                    valueTransformer: (value) => value.toString().trim(),
                                    // controller: _nameController,
                                    // valueTransformer: (text) => num.tryParse(text),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.email(),
                                      //FormBuilderValidators.max( 70),
                                    ]),
                                    // keyboardType: TextInputType.number,
                                  ),
                                  FormBuilderPhoneField(
                                    name: 'phone',
                                    initialValue:
                                        editEntityRow ? widget.entity!.phone : '',
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(Sizes.p16),
                                      labelText: widget.context.loc.phoneFieldLabel,
                                      hintText: '02XXXXXXX',
                                    ),
                                    priorityListByIsoCode: const ['PS'],
                                    defaultSelectedCountryIsoCode: 'PS',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                  ),
                                  FormBuilderPhoneField(
                                    name: 'mobile',
                                    initialValue:
                                        editEntityRow ? widget.entity!.mobile : '',
                                    decoration: InputDecoration(
                                      labelText: widget.context.loc.mobileFieldLabel,
                                      hintText: '05XXXXXXXX',
                                    ),
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
                      Container(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Expanded(
                          flex:1,
                         // padding: const EdgeInsets.all(defaultPadding),
                          child: Center(child: imgIcons(src: 'addUser.png',scale: 1.9)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
                
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
