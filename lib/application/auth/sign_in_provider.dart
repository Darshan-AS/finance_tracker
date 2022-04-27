import 'package:dartz/dartz.dart';
import 'package:finance_tracker/application/auth/sign_in_state.dart';
import 'package:finance_tracker/domain/auth/agent.dart';
import 'package:finance_tracker/domain/auth/i_authenticator.dart';
import 'package:finance_tracker/domain/auth/value_objects.dart';
import 'package:finance_tracker/infrastructure/auth/firebase_authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState.initial());

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
    state = SignInState.initial();
  }

  void signInWithEmail() {
    state = SignInState.initial();
  }

  void signInWithGoogle() {
    state = SignInState.initial();
  }
}

final authenticatorProvider = Provider<IAuthenticator>((ref) {
  return FirebaseAuthenticator(FirebaseAuth.instance, GoogleSignIn());
});

final authStateProvider = FutureProvider<Option<Agent>>((ref) {
  return ref.read(authenticatorProvider).getSignedInAgent();
});
