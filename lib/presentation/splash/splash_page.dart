import 'package:finance_tracker/application/auth/auth_state.dart';
import 'package:finance_tracker/application/auth/auth_state_provider.dart';
import 'package:finance_tracker/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authStateProvider.notifier).authStatusRequested();

    ref.listen<AuthState>(authStateProvider, (prevState, state) {
      state.when(
        initial: () => null,
        authenticated: (agent) => Container(color: Colors.green),
        unauthenticated: () => context.router.replace(const SignInRoute()),
      );
    });

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
