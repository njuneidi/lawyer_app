import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class LocaleProvider extends StateNotifier<Locale> {

  LocaleProvider() : super(const Locale('ar', 'PS'));
  void setArabic() => state = const Locale('ar','PS');
  void setEnglish() => state = const Locale('en','US');


}
final mylocalNotifierProvider =
    StateNotifierProvider.autoDispose<LocaleProvider, Locale>((ref) {
  return LocaleProvider();
});