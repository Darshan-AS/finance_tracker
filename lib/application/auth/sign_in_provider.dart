import 'package:dartz/dartz.dart';
import 'package:finance_tracker/application/auth/sign_in_state.dart';
import 'package:finance_tracker/domain/auth/agent.dart';
import 'package:finance_tracker/domain/auth/auth_failure.dart';
import 'package:finance_tracker/domain/auth/i_authenticator.dart';
import 'package:finance_tracker/domain/auth/value_objects.dart';
import 'package:finance_tracker/infrastructure/auth/firebase_authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  final IAuthenticator _authenticator;

  SignInNotifier(this._authenticator) : super(SignInState.initial());

  void emailChanged(String emailString) {
    state = state.copyWith(
      email: Email(emailString),
      authResponseOption: none(),
    );
  }

  void passwordChanged(String passwordString) {
    state = state.copyWith(
      password: Password(passwordString),
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

    if (state.email.isValid() && state.password.isValid()) {
      state = state.copyWith(
        isSubmitting: true,
        authResponseOption: none(),
      );

      authResponse = await authAction(
        email: state.email,
        password: state.password,
      );
    }

    state = state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authResponseOption: optionOf(authResponse),
    );
  }
}

final authenticatorProvider = Provider<IAuthenticator>((ref) {
  return FirebaseAuthenticator(FirebaseAuth.instance, GoogleSignIn());
});

final authStateProvider = FutureProvider<Option<Agent>>((ref) {
  return ref.read(authenticatorProvider).getSignedInAgent();
});

final signInStateProvider = StateNotifierProvider<SignInNotifier, SignInState>(
  (ref) {
    return SignInNotifier(ref.read(authenticatorProvider));
  },
);
