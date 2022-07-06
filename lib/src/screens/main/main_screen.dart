// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/common_widgets/action_text_button.dart';
import 'package:lawyer_app/src/common_widgets/alert_dialogs.dart';
import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:lawyer_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:lawyer_app/src/features/locale/presentation/locale_provider.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/localization/l10n.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:lawyer_app/src/responsive.dart';
import 'package:lawyer_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyer_app/src/screens/home_page.dart';
import 'package:lawyer_app/src/screens/main/components/side_menu.dart';
import 'package:lawyer_app/src/screens/welcom_page.dart';

class MainScreen extends ConsumerWidget with PreferredSizeWidget {
  final int index;
  final String tabTitle;
  MainScreen({String tab = '', Key? key})
      : index = indexFrom(tab),
        tabTitle = tab,
        super(key: key);

  static int indexFrom(String tab) {
    switch (tab) {
      case 'dashboard':
        return 1;
      case 'definition':
        return 2;
      case 'transaction':
        return 3;
      case 'finance':
        return 4;
      case 'reports':
        return 5;
      case 'settings':
        return 6;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    // final screenWidth = MediaQuery.of(context).size.width;
    final locale = ref.watch(mylocalNotifierProvider);
    final localLang =ref.watch(mylocalNotifierProvider.notifier);
    //final locale = localeProvider;
   // debugPrint(locale.countryCode);
    final state = ref.watch(accountScreenControllerProvider);

    return Scaffold(
        appBar: AppBar(
          // title: Text(context.loc.appBar),
          centerTitle: true,
          
        
        automaticallyImplyLeading: true,
        title:  Text(context.loc.welcomeToLawyerApp),
        leadingWidth: 200,
          leading: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 30,),
              tabTitle == 'dashboard'
                  ? Text(context.loc.dashboardPageTitle)
                  : tabTitle == 'definition'
                      ? Text(context.loc.sideMenuItemTwoDefinition)
                      : tabTitle == 'transaction'
                          ? Text(context.loc.sideMenuItemThreeTransaction)
                          : tabTitle == 'finance'
                              ? Text(context.loc.sideMenuItemFourFinance)
                              : tabTitle == 'reports'
                                  ? Text(context.loc.sideMenuIteFiveReport)
                                  : Text(context.loc.sideMenuItemSixSettings),
                                 
             
            ],
          ),
          //centerTitle: true,
          actions: [
            Row(
              children: [
                Row(
                    // children: const [
                    //   Icon(Icons.logout),
                    //   SizedBox(width: 8),
                    //   Text('Sign Out'),
                    // ],
                    ),
                if (user != null) ...[
                  const Icon(Icons.logout),
                  ActionTextButton(
                    text: context.loc.signOut,
                    onPressed: state.isLoading
                        ? null
                        : () async {
                            final logout = await showAlertDialog(
                                context: context,
                                title: context.loc.areYouSure,
                                cancelActionText: context.loc.cancel,
                                defaultActionText: context.loc.logout);
                            if (logout == true) {
                              ref
                                  .read(
                                      accountScreenControllerProvider.notifier)
                                  .signOut();
                            }
                          },
                  )
                ] else ...[
                  const Icon(Icons.login),
                  ActionTextButton(
                    text: context.loc.signIn,
                    onPressed: () => context.pushNamed(AppRoute.signIn.name),
                  ),
                ]
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            PopupMenuButton(
                initialValue: locale,
                icon: const Icon(Icons.language),
                onSelected: null,
                itemBuilder: (context) => L10n.all.map(
                      (locale) {
                        final flag = L10n.getFlag(locale.languageCode);
                        return PopupMenuItem(
                          value: locale,
                          
                          onTap: () {
                            debugPrint('${locale.languageCode} befor');
                             if (locale.languageCode =='ar'){
                               localLang.setArabic();
                                

                            }else{
                              localLang.setEnglish();
                             }
                            // context.pushNamed(AppRoute.root.name);
                            debugPrint('${locale.languageCode} after');
                           // debugPring(localeProvider.state.toString());
                            //(localeProvider.notifier).setloca
                            //final localeProvider =
                            //  ref.read(mylocalNotifierProvider.notifier);
                            // final locale = localeProvider.state;
                            // debugPrint(locale?.countryCode.toString());
                            //   localeProvider.setArabic();
                            // debugPrint('tapped');
                            // debugPrint(locale?.countryCode);
                            // // context.goNamed(AppRoute.root.name);
                          },
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  flag,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: defaultPadding,
                                ),
                                locale.languageCode == 'ar'
                                    ? Text(
                                        'العربية'.hardcoded,
                                        style: const TextStyle(fontSize: 18),
                                      )
                                    : Text(
                                        'English'.hardcoded,
                                        style: const TextStyle(fontSize: 18),
                                      )
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList()),
          ],
        ),
        //  key: context.read<MenuController>().scaffoldKey,
        //key: sideMenuControlerProvider.scaffoldKey,
        //  if (Responsive.isDesktop(context)){
        drawer:
            Responsive.isDesktop(context) == false ? const SideMenu() : null,
        body: SafeArea(
          child: user != null
              ? HomePage(
                  user: user,
                  tab: index,
                )
              : const WelcomPage(),
        ),persistentFooterButtons:  [
          Center(child: Text('All Rights Reserved @2022'.hardcoded))
      ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}

class DrawListTitle extends StatelessWidget {
  const DrawListTitle({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
