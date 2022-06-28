import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/common_widgets/action_text_button.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:lawyer_app/src/routing/app_router.dart';

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
                'Welcome to Lawyer App'.hardcoded,
                style: const TextStyle(fontSize: 28),
                //style: Theme.of(context).textTheme.headline4,
              ),
              ActionTextButton(
                text: 'Sign In'.hardcoded,
                onPressed: () =>
                    context.pushNamed(AppRoute.signIn.name),
              ),
            ],
          ),
        ),
    );
  }
}