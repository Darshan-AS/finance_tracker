import 'package:finance_tracker/application/auth/auth_state.dart';
import 'package:finance_tracker/application/auth/auth_state_notifier.dart';
import 'package:finance_tracker/application/auth/authenticator_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) {
    return AuthStateNotifier(ref.read(authenticatorProvider));
  },
);
