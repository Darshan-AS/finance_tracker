import 'package:dartz/dartz.dart';
import 'package:finance_tracker/application/auth/sign_in_notifier.dart';
import 'package:finance_tracker/application/auth/sign_in_state.dart';
import 'package:finance_tracker/domain/auth/agent.dart';
import 'package:finance_tracker/domain/auth/i_authenticator.dart';
import 'package:finance_tracker/infrastructure/auth/firebase_authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
