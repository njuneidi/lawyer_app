import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/localization/l10n.dart';

class LocaleProvider extends ChangeNotifier {
   late Locale _locale = const Locale('en', 'US');
  //fianl local<string> =Locale.fromSubtags()

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
  
  }

  void clearLocale() {
    _locale = const Locale('ar', 'JO');
  
  }
}
final mylocalNotifierProvider = ChangeNotifierProvider.autoDispose<LocaleProvider>((ref) {
  //final local = LocaleProvider();
  //ref.onDispose(() => local.dispose());
  //return local;
  return LocaleProvider();
});
// final localStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
//   final localRepository = ref.watch(mylocalNotifierProvider);
//   return localRepository.setLocale();
// });

