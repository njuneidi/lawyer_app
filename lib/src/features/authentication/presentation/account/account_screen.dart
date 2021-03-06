import 'package:flutter/material.dart';
import 'package:lawyer_app/src/common_widgets/action_text_button.dart';
import 'package:lawyer_app/src/common_widgets/alert_dialogs.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawyer_app/src/common_widgets/responsive_center.dart';
import 'package:lawyer_app/src/constants/app_sizes.dart';
import 'package:lawyer_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:lawyer_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:lawyer_app/src/localization/app_localizations_context.dart';
import 'package:lawyer_app/src/utils/async_value_ui.dart';

/// Simple account screen showing some user info and a logout button.
class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      accountScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(accountScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: state.isLoading
            ? const CircularProgressIndicator()
            : Text(context.loc.account),
        actions: [
          ActionTextButton(
            text: context.loc.logout,
            onPressed: state.isLoading
                ? null
                : () async {
                    final logout = await showAlertDialog(
                      context: context,
                      title: context.loc.areYouSure,
                      cancelActionText: context.loc.cancel,
                      defaultActionText: context.loc.logout,
                    );
                    if (logout == true) {
                      ref
                          .read(accountScreenControllerProvider.notifier)
                          .signOut();
                    }
                  },
          ),
        ],
      ),
      body: const ResponsiveCenter(
        padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: UserDataTable(),
      ),
    );
  }
}

/// Simple user data table showing the uid and email
class UserDataTable extends ConsumerWidget {
  const UserDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme.subtitle2!;
    final user = ref.watch(authStateChangesProvider).value;
   // const user =  AppUser(uid: '123',email: 'test@test.com');
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            context.loc.field,
            style: style,
          ),
        ),
        DataColumn(
          label: Text(
            context.loc.value,
            style: style,
          ),
        ),
      ],
      rows: [
        _makeDataRow(
          context.loc.uid,
          user?.uid ?? '',
          style,
        ),
        _makeDataRow(
          context.loc.email,
          user?.email ?? '',
          style,
        ),
      ],
    );
  }

  DataRow _makeDataRow(String name, String value, TextStyle style) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            name,
            style: style,
          ),
        ),
        DataCell(
          Text(
            value,
            style: style,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
