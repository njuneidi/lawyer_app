import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabItemsNotifier extends StateNotifier<String> {
  TabItemsNotifier() : super('dashboard');
  void linkedPage(String menu) => state = menu;
}

final sideMenuItemProvider =
    StateNotifierProvider.autoDispose<TabItemsNotifier, String>((ref) {
  return TabItemsNotifier();
});

class TextFieldFilter extends StateNotifier<String?> {
  TextFieldFilter() : super(null);
  void searchFilterText(String search) => state = search;
}

final searchFilterProvider =
    StateNotifierProvider.autoDispose<TextFieldFilter, String?>((ref) {
  return TextFieldFilter();
});

class PreviousLink extends StateNotifier<String> {
  PreviousLink() : super('definition');
  void previousPage(String menu) => state = menu;
}

final previousItemProvider =
    StateNotifierProvider.autoDispose<PreviousLink, String>((ref) {
  return PreviousLink();
});


class EntityLenth extends StateNotifier<int?> {
  EntityLenth() : super(0);
  void entityLength(int? length) => state = length;
}

final entitLengthProvider =
    StateNotifierProvider.autoDispose<EntityLenth, int?>((ref) {
  return EntityLenth();
});









