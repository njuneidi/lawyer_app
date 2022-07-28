import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabItemsNotifier extends StateNotifier<String> {
  TabItemsNotifier() : super('dashboard');
  void linkedPage(String menu) => state = menu;
}

final sideMenuItemProvider =
    StateNotifierProvider.autoDispose<TabItemsNotifier, String>((ref) {
  return TabItemsNotifier();
});
