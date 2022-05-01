import 'package:finance_tracker/application/auth/authenticator_provider.dart';
import 'package:finance_tracker/application/auth/sign_in_form/sign_in_form_notifier.dart';
import 'package:finance_tracker/application/auth/sign_in_form/sign_in_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInFormStateProvider =
    StateNotifierProvider<SignInFormNotifier, SignInFormState>(
  (ref) {
    return SignInFormNotifier(ref.read(authenticatorProvider));
  },
);
