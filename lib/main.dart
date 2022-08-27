// ignore_for_file: use_key_in_widget_constructors



import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/src/db/database_provider.dart';
import 'package:lawyer_app/src/entity_controller/data/local/sembast_local_repository.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

import 'package:lawyer_app/src/app.dart';

void main() async {
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // turn off the # in the URLs on the web
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
    final localClientRepository = await SembastRepository.makeDefault();
    // * Entry point of the app
    runApp(ProviderScope(
      overrides: [
        sembastDatabasProviderProvider.overrideWithValue(localClientRepository),
      ],
      child: const MyApp(),
    ));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}
