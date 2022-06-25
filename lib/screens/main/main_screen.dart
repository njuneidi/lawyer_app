// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/constants.dart';
import 'package:lawyer_app/controllers/MenuController.dart';
import 'package:lawyer_app/features/authentication/data/fake_auth_repository.dart';
import 'package:lawyer_app/features/locale/data/locale_provider.dart';
import 'package:lawyer_app/localization/app_localizations_context.dart';
import 'package:lawyer_app/localization/l10n.dart';
import 'package:lawyer_app/responsive.dart';
import 'package:lawyer_app/screens/dashbord/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/side_menu.dart';

class MainScreen extends ConsumerWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sideMenuControlerProvider = ref.read(menuControlerProvider);
    final user = ref.watch(authStateChangesProvider).value;
    final screenWidth = MediaQuery.of(context).size.width;
    final localeProvider = ref.read(mylocalNotifierProvider);
    final locale = localeProvider.locale;
    final mItem = [
      L10n.all.map((e) => e).toList(),
      ['singIn']
    ].expand((element) => element).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.appBar),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              initialValue: locale,
              icon: const Icon(Icons.language),
              onSelected: null,
              itemBuilder: (context) => L10n.all.map(
                    (locale) {
                      final flag = L10n.getFlag(locale.languageCode);
                      return PopupMenuItem(
                        value: locale,
                        onTap: () {},
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                flag,
                              ),
                              const SizedBox(
                                width: defaultPadding,
                              ),
                              locale.languageCode == 'ar'
                                  ? const Text('العربية')
                                  : const Text('English')
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList()),
          //, const PopupMenuDivider(),
        ],
      ),
      //  key: context.read<MenuController>().scaffoldKey,
      key: sideMenuControlerProvider.scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                //defalut flex =1
                // and it takes 1/6 part of screen
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: DashboardScreen(),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}

@override
// TODO: implement preferredSize
Size get preferredSize => const Size.fromHeight(60.0);

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
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
