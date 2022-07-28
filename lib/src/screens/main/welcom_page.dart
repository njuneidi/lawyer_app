import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/common_widgets/action_text_button.dart';
import 'package:lawyer_app/src/constants/app_route_constatnt.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(100),
        child: Column(
          children: [
            Text(
              context.loc.welcomeToLawyerApp,
              style: const TextStyle(fontSize: 28),
              //style: Theme.of(context).textTheme.headline4,
            ),
            Center(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),
                  ),
                ],
              ),
            ),
            ActionTextButton(
              text: context.loc.signIn,
              onPressed: () => context.pushNamed(AppRoute.signIn.name),
            ),
          ],
        ),
      ),
    );
  }
}
