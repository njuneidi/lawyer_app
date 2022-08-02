import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/clients/domain/client.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/screens/main/controller/side_menu_items.dart';

/// Search field used to filter products by name
class EntitiesSearchTextField extends ConsumerStatefulWidget {
  const EntitiesSearchTextField(
      {super.key, required this.tabItem, required this.tab});
  final TabItemsNotifier tabItem;
  final String tab;

  @override
  _EntitiesSearchTextFieldState createState() =>
      _EntitiesSearchTextFieldState();
}

class _EntitiesSearchTextFieldState
    extends ConsumerState<EntitiesSearchTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _controller.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    debugPrint('enteredKeyword $enteredKeyword');
    final searchText = ref.watch(searchFilterProvider.notifier);
     searchText.searchFilterText(enteredKeyword);
    widget.tabItem.linkedPage(widget.tab);
   
    // we use the toLowerCase() method to make it case-insensitive
  }

  @override
  Widget build(BuildContext context) {
    // See this article for more info about how to use [ValueListenableBuilder]
    // with TextField:
    // https://codewithandrea.com/articles/flutter-text-field-form-validation/
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        return TextField(
          controller: _controller,
          autofocus: false,
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            hintText: context.loc.searchEntity,
            icon: const Icon(Icons.search),
            suffixIcon: value.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                      // TODO: Clear search state
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
          ),
          // TODO: Implement onChanged
          onChanged: (value) => _runFilter(value),
        );
      },
    );
  }
}
