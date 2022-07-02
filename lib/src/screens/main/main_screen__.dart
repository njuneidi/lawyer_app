
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/common_widgets/action_text_button.dart';
import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:lawyer_app/src/features/locale/data/locale_provider.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/localization/l10n.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:lawyer_app/src/routing/app_router.dart';
import 'package:lawyer_app/src/screens/home_page.dart';
import 'package:lawyer_app/src/screens/welcom_page.dart';

   final sideMenues = ['dashboard', 'definition', 'transaaction','finance','reports','settings'];
   

class MainScreenOld extends ConsumerStatefulWidget with PreferredSizeWidget{

  final int index;
   MainScreenOld({String tab = 'dashboard', Key? key}) : index = sideMenues.indexWhere((element) => element==tab), super(key: key) {
    assert(index != -1);
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScree();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _MainScree extends ConsumerState<MainScreenOld> with TickerProviderStateMixin {
   late final TabController _controller;

     @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: sideMenues.length,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  void didUpdateWidget(MainScreenOld oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.index;
  }
  debugPrint(index) {
  // TODO: implement debugPrint
  throw UnimplementedError();
}

  @override
  Widget build(BuildContext context) {

    final user = ref.watch(authStateChangesProvider).value;
    // final screenWidth = MediaQuery.of(context).size.width;
    final localeProvider = ref.read(mylocalNotifierProvider);
    final locale = localeProvider.locale;
  
    return  Scaffold(
        appBar: AppBar(
          title: Text(context.loc.appBar),
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
                    text: "Sign Out".hardcoded,
                    onPressed: () {},
                  )
                ] else
                  const Icon(Icons.login),
                ActionTextButton(
                  text: 'Sign In'.hardcoded,
                  onPressed: () => context.pushNamed(AppRoute.signIn.name),
                ),
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
                            // final localeProvider =
                            //     ref.read(mylocalNotifierProvider);
                            // final locale = localeProvider.locale;
                            // localeProvider.setLocale(locale);
                            // debugPrint('tapped');
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
       // key: sideMenuControlerProvider.scaffoldKey,
       // drawer: const SideMenu(),
       
       
        body: SafeArea(
          child: user != null
              ? HomePage(
                  user: user,
                  tab: widget.index,
                )
              : const WelcomPage(),
        ));
  }
}
