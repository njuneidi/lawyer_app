// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lawyer_app/src/notifier/state_notifier_contoller.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final localeProvider = ref.watch(localNotifierProvider);
    final locale = localeProvider;

    debugPrint(localeProvider.countryCode);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'context.loc.pageTitle',
      restorationScopeId: 'app',
      //locale: const Locale.fromSubtags(languageCode: 'en'),
      locale: locale,
      //locale:  localeProvider.locale.countryCode,

      //_locale= const Locale.fromSubtags(languageCode: 'ar');

      //localizationsDelegates: 
       // AppLocalizations.localizationsDelegates,
       localizationsDelegates: const [
        AppLocalizations.delegate,
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      
      ],
      

      supportedLocales: AppLocalizations.supportedLocales,
      

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
       onGenerateTitle: (BuildContext context) => context.loc.welcomeToLawyerApp,
      // theme: ThemeData(
      //   primarySwatch: Colors.grey,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.black87,
      //     foregroundColor: Colors.white,
      //     elevation: 0,
      //   ),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       primary: Colors.black, // background (button) color
      //       onPrimary: Colors.white, // foreground (text) color
      //     ),
      //   ),
      // ),

      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}
