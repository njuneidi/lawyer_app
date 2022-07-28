import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabItemsNotifier extends StateNotifier<String> {
  TabItemsNotifier() : super('dashboard');
  void linkedPage(String menu) => state = menu;
}

final sideMenuItemProvider =
    StateNotifierProvider.autoDispose<TabItemsNotifier, String>((ref) {
  return TabItemsNotifier();
});

class PreviousLink extends StateNotifier<String> {
  PreviousLink() : super('definition');
  void previousPage(String menu) => state = menu;
}

final previousItemProvider =
    StateNotifierProvider.autoDispose<PreviousLink, String>((ref) {
  return PreviousLink();
});

