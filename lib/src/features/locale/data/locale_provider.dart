import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/localization/l10n.dart';

class LocaleProvider extends ChangeNotifier {
   late Locale _locale = const Locale('en', 'US');
   //late Locale _locale ;
  //fianl local<string> =Locale.fromSubtags()

  Locale get locale => _locale;

  void setLocale(Locale locale) {
   // debugPrint(locale.languageCode);
    if (!L10n.all.contains(locale)) return;
  //  debugPrint("aaaa");

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

