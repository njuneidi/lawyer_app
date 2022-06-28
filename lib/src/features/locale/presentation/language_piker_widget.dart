import 'package:flutter/material.dart';
import 'package:lawyer_app/src/constants/breakpoints.dart';
import 'package:lawyer_app/src/features/authentication/domain/app_user.dart';
import 'package:lawyer_app/src/localization/l10n.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';

enum PopupMenuOption {
  signIn,
  arabic,
  egnlish,
  signOut,
}

class language_piker_widget extends StatelessWidget {
  const language_piker_widget({
    Key? key,
    this.user,
    this.locale,
  }) : super(key: key);
  final AppUser? user;
  final Locale? locale;

  // * Keys for testing using find.byKey()
  static const signInKey = Key('menuSignIn');
  static const arabicKey = Key('menuArabic');
  static const englishKey = Key('menuEgnlish');
  static const signOutKey = Key('menuSingOut');

  @override
  Widget build(BuildContext context) {
   
    final screenWidth = MediaQuery.of(context).size.width;
   // debugPrint(locale?.countryCode);
 
 
  
    var popMenuBtn = Center(
      child: Column(
        children: [
          PopupMenuButton<int>(
            //color: Colors.indigo,
            //onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                key: arabicKey,
                value: 0,
                //child: Text('AE'.hardcoded),
                child: Text('arbflag'),
              ),
              PopupMenuItem<int>(
                key: englishKey,
                value: 1,
                child: Text('Orders'.hardcoded),
              ),
              const PopupMenuDivider(),
              user != null
                  ? PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: const [
                          Icon(Icons.logout),
                          SizedBox(width: 8),
                          Text('Sign Out'),
                        ],
                      ),
                    )
                  : PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: const [
                          Icon(Icons.login),
                          SizedBox(width: 8),
                          Text('Sign In'),
                        ],
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
    if (screenWidth < Breakpoint.tablet) {
      return popMenuBtn;
    } else {
      return Stack(
        children: const [
          Center(
            child: IconButton(onPressed: null, icon: Icon(Icons.language)),
          )
        ],
      );
    }
  }
}
