import 'package:dartz/dartz.dart';
import 'package:finance_tracker/application/auth/sign_in_form/sign_in_form_state.dart';
import 'package:finance_tracker/domain/auth/auth_failure.dart';
import 'package:finance_tracker/domain/auth/i_authenticator.dart';
import 'package:finance_tracker/domain/auth/value_objects.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInFormNotifier extends StateNotifier<SignInFormState> {
  final IAuthenticator _authenticator;

  SignInFormNotifier(this._authenticator) : super(SignInFormState.initial());

  void emailChanged(String emailString) {
    state = state.copyWith(
      email: Email.create(emailString),
      authResponseOption: none(),
    );
  }

  void passwordChanged(String passwordString) {
    state = state.copyWith(
      password: Password.create(passwordString),
      authResponseOption: none(),
    );
  }

  void signUpWithEmail() {
    _performAuthAction(_authenticator.signUpWithEmail);
  }

  void signInWithEmail() {
    _performAuthAction(_authenticator.signInWithEmail);
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(
      isSubmitting: true,
      authResponseOption: none(),
    );

    final authResponse = await _authenticator.signInWithGoogle();

    state = state.copyWith(
      isSubmitting: false,
      authResponseOption: some(authResponse),
    );
  }

  Future<void> _performAuthAction(
    Future<Either<AuthFailure, Unit>> Function({
      required Email email,
      required Password password,
    })
        authAction,
  ) async {
    Either<AuthFailure, Unit>? authResponse;
    // TODO: Find a better way instead of using nullable types
    var email = state.email.toOption().toNullable();
    var password = state.password.toOption().toNullable();

    if (email != null && password != null) {
      state = state.copyWith(
        isSubmitting: true,
        authResponseOption: none(),
      );

      authResponse = await authAction(
        email: email,
        password: password,
      );
    }

    state = state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authResponseOption: optionOf(authResponse),
    );
  }
}
