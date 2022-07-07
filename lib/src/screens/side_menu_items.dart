import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenuItemsNotifier extends StateNotifier<String> {
  SideMenuItemsNotifier() : super('dashboard');
  void sideMenuPage(String menu) => state = menu;
}

final sideMenuItemProvider =
    StateNotifierProvider.autoDispose<SideMenuItemsNotifier, String>((ref) {
  return SideMenuItemsNotifier();
});
