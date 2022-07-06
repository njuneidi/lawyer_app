import 'package:lawyer_app/src/common_widgets/alert_dialogs.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isRefreshing && hasError) {
      showExceptionAlertDialog(
        context: context,
        title: context.loc.error,
        exception: error,
      );
    }
  }
}
