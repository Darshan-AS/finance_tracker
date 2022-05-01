import 'package:finance_tracker/domain/auth/i_authenticator.dart';
import 'package:finance_tracker/infrastructure/auth/firebase_authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authenticatorProvider = Provider<IAuthenticator>((ref) {
  return FirebaseAuthenticator(FirebaseAuth.instance, GoogleSignIn());
});
