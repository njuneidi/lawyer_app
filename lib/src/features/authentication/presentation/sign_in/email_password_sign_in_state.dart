import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lawyer_app/src/features/authentication/presentation/sign_in/string_validators.dart';
import 'package:lawyer_app/src/localization/string_hardcoded.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Form type for email & password authentication
enum EmailPasswordSignInFormType { signIn, register }

/// Mixin class to be used for client-side email & password validation
mixin EmailAndPasswordValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordRegisterSubmitValidator =
      MinLengthStringValidator(8);
  final StringValidator passwordSignInSubmitValidator =
      NonEmptyStringValidator();
}

/// State class for the email & password form.
class EmailPasswordSignInState with EmailAndPasswordValidators {
  EmailPasswordSignInState({
    this.formType = EmailPasswordSignInFormType.signIn,
    this.value = const AsyncValue.data(null),
  });

  final EmailPasswordSignInFormType formType;
  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  EmailPasswordSignInState copyWith({
    EmailPasswordSignInFormType? formType,
    AsyncValue<void>? value,
  }) {
    return EmailPasswordSignInState(
      formType: formType ?? this.formType,
      value: value ?? this.value,
    );
  }

  @override
  String toString() =>
      'EmailPasswordSignInState(formType: $formType, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailPasswordSignInState &&
        other.formType == formType &&
        other.value == value;
  }

  @override
  int get hashCode => formType.hashCode ^ value.hashCode;
}



extension EmailPasswordSignInStateX on EmailPasswordSignInState {
  String  passwordLabelText (AppLocalizations  loc)  {
 
    if (formType == EmailPasswordSignInFormType.register) {
      return loc.passwordCharactersLabel;
    } else {
      return loc.passwordLabel;
    }
  }

  // Getters
  String  primaryButtonText (AppLocalizations loc) {
    if (formType == EmailPasswordSignInFormType.register) {
      return loc.createAnAccount;
    } else {
      return loc.signIn;
    }
  }

  String  secondaryButtonText (AppLocalizations loc){
    if (formType == EmailPasswordSignInFormType.register) {
      return loc.haveAnAccount;
    } else {
      return loc.needAnAccount;
    }
  }

  EmailPasswordSignInFormType get secondaryActionFormType {
    if (formType == EmailPasswordSignInFormType.register) {
      return EmailPasswordSignInFormType.signIn;
    } else {
      return EmailPasswordSignInFormType.register;
    }
  }

  String  errorAlertTitle (AppLocalizations loc) {
    if (formType == EmailPasswordSignInFormType.register) {
      return loc.registrationFailed;
    } else {
      return loc.signInFailed;
    }
  }

  String  title (AppLocalizations loc){
    if (formType == EmailPasswordSignInFormType.register) {
      return loc.register;
    } else {
      return loc.signIn;
    }
  }

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    if (formType == EmailPasswordSignInFormType.register) {
      return passwordRegisterSubmitValidator.isValid(password);
    }
    return passwordSignInSubmitValidator.isValid(password);
  }

  String? emailErrorText(String email,AppLocalizations loc) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText = email.isEmpty
        ? loc.emailCantBeEmpty
        : loc.invalidEmail;
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password,AppLocalizations loc) {
    final bool showErrorText = !canSubmitPassword(password);
    final String errorText = password.isEmpty
        ? loc.passwordCantBeEmpty
        : loc.passwordIsTooShort;
    return showErrorText ? errorText : null;
  }
}
