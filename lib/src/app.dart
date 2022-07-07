// ignore_for_file: use_key_in_widget_constructors


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/features/locale/presentation/locale_provider.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lawyer_app/src/screens/side_menu_items.dart';
class MyApp extends ConsumerWidget {
   const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final localeProvider = ref.watch(mylocalNotifierProvider);
    final locale= localeProvider;
  
  
    debugPrint(localeProvider.countryCode);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'context.loc.pageTitle',
      restorationScopeId: 'app',
      //locale: const Locale.fromSubtags(languageCode: 'en'),
      locale: locale,
      //locale:  localeProvider.locale.countryCode,
      
      //_locale= const Locale.fromSubtags(languageCode: 'ar');
  
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      
  
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}
