// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/common_widgets/action_text_button.dart';
import 'package:lawyer_app/src/common_widgets/alert_dialogs.dart';
import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/constants/action_menu.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:lawyer_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:lawyer_app/src/features/locale/presentation/locale_provider.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/localization/l10n.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/src/screens/main/home_page.dart';
import 'package:lawyer_app/src/screens/main/controller/side_menu_items.dart';
import 'package:lawyer_app/src/screens/main/welcom_page.dart';

class MainScreen extends ConsumerWidget with PreferredSizeWidget {
  MainScreen({String tab = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(sideMenuItemProvider);
    final user = ref.watch(authStateChangesProvider).value;
    // final screenWidth = MediaQuery.of(context).size.width;
    final locale = ref.watch(mylocalNotifierProvider);
    final localLang = ref.watch(mylocalNotifierProvider.notifier);

    final state = ref.watch(accountScreenControllerProvider);

 

    return Scaffold(
        appBar: AppBar(
          // title: Text(context.loc.appBar),
          centerTitle: true,

          title: Text(context.loc.welcomeToLawyerApp),

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
                            if (locale.languageCode == 'ar') {
                              localLang.setArabic();
                            } else {
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
        // drawer:const SideMenu(),
        //    Responsive.isDesktop(context) == false ? const SideMenu() : null,
        body: SafeArea(
          child: user == null
              ? HomePage(
                  user: user,
                  tab: tab,
                )
              : const WelcomPage(),
        ),
        persistentFooterButtons: [
          Center(child: Text('All Rights Reserved @2022'.hardcoded))
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}

class DrawListTitle extends StatefulWidget {
  const DrawListTitle({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.entity, //required this.onTap,
  }) : super(key: key);

  final String entity, title, svgSrc;
  final VoidCallback press;

  @override
  State<DrawListTitle> createState() => _DrawListTitleState();
}

class _DrawListTitleState extends State<DrawListTitle> {
  bool isHovered = false;
  IconData getIcon(e) => e == AppRoute.dashboard.name
      ? Icons.dashboard
      : e == AppRoute.definition.name
          ? Icons.dataset
          : e == AppRoute.transaction.name
              ? Icons.display_settings_sharp
              : e == AppRoute.finance.name
                  ? Icons.business
                  : e == AppRoute.reports.name
                      ? Icons.chat_rounded
                      : e == AppRoute.setting.name
                      ? Icons.settings
                      : Icons.people;
  //final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: ListTile(
        onTap: widget.press,
        horizontalTitleGap: 0.0,

        // leading: SvgPicture.asset(
        //   svgSrc,
        //   color: Colors.white54,
        //   height: 16,
        // ),
        trailing: widget.entity != 'definition0'
            ? const Icon(
                Icons.navigate_next,
                color: Colors.white54,
              )
            : PopupMenuButton(
                offset: const Offset(0, 50),
                initialValue: ActionMenuItem.actionMenuItemsPart1[0],
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white54,
                ),
                onSelected: (value) {
                  if (value == MnuItems.newItem) {}
                },
                itemBuilder: (context) => ActionMenuItem.actionMenuItemsPart1
                    .map((e) => PopupMenuItem<MenuItem2>(
                        value: e,
                        onTap: () => {},
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(e.icon, color: Colors.white, size: 22),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                e.text,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        )))
                    .toList()),
        leading: isHovered
            ? widget.entity == 'definition'
                ? null
                : const IconButton(
                    tooltip: null,
                    icon: Icon(
                      Icons.add_circle_outline,
                      //color: textColor,
                    ),
                    onPressed: null,
                  )
            : FocusTraversalGroup(
                descendantsAreTraversable: false,
                child: IconButton(
                  icon: Icon(getIcon(widget.entity)),
                  //color: textColor,
                  onPressed: null,
                ),
              ),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}
