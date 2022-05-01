import 'package:finance_tracker/application/auth/auth_state.dart';
import 'package:finance_tracker/domain/auth/i_authenticator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final IAuthenticator _authenticator;

  AuthStateNotifier(this._authenticator) : super(const AuthState.initial());

  Future<void> authStatusRequested() async {
    final optionalAgent = await _authenticator.getSignedInAgent();
    state = optionalAgent.fold(
      () => const AuthState.unauthenticated(),
      (agent) => AuthState.authenticated(agent: agent),
    );
  }

  Future<void> signedOut() async {
    await _authenticator.signOut();
    state = const AuthState.unauthenticated();
  }
}
