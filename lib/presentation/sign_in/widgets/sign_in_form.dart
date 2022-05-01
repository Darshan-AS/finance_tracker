import 'package:dartz/dartz.dart';
import 'package:finance_tracker/application/auth/sign_in_provider.dart';
import 'package:finance_tracker/application/auth/sign_in_state.dart';
import 'package:finance_tracker/domain/auth/auth_failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInStateProvider);

    ref.listen<SignInState>(signInStateProvider, (prevState, state) {
      state.authResponseOption.fold(
        () => null,
        (authResponse) => _showAuthResponseSnackBar(context, authResponse),
      );
    });

    return Form(
      autovalidateMode: signInState.showErrorMessages
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Text(
            '💰',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 130),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
            ),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) =>
                ref.read(signInStateProvider.notifier).emailChanged(value),
            validator: (_) => signInState.email.value.fold(
              (f) => f.maybeMap(
                invalidEmail: (_) => 'Invalid Email',
                orElse: () => null,
              ),
              (_) => null,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            autocorrect: false,
            obscureText: true,
            onChanged: (value) =>
                ref.read(signInStateProvider.notifier).passwordChanged(value),
            validator: (_) => signInState.password.value.fold(
              (f) => f.maybeMap(
                shortPassword: (_) => 'Short Password',
                orElse: () => null,
              ),
              (_) => null,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: const Text('Sign In'),
                  onPressed: () =>
                      ref.read(signInStateProvider.notifier).signInWithEmail(),
                ),
              ),
              Expanded(
                child: TextButton(
                  child: const Text('Sign Up'),
                  onPressed: () =>
                      ref.read(signInStateProvider.notifier).signUpWithEmail(),
                ),
              ),
            ],
          ),
          ElevatedButton(
            child: const Text('Sign In with Google'),
            onPressed: () =>
                ref.read(signInStateProvider.notifier).signInWithGoogle(),
          ),
          if (signInState.isSubmitting) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(),
          ]
        ],
      ),
    );
  }

  void _showAuthResponseSnackBar(
    BuildContext context,
    Either<AuthFailure, Unit> authResponse,
  ) {
    final message = authResponse.fold(
      (failure) => failure.when(
        cancelledByUser: () => "Cancelled",
        serverError: () => "Server Error",
        emailAlreadyInUse: () => "Email already in use",
        invalidEmailOrPassword: () => "Invalid Email or Password",
      ),
      (_) => "Success",
    );

    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'OK',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }
}
