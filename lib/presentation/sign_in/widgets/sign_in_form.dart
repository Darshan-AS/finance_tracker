import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: state.showErrorMessages
      //     ? AutovalidateMode.always
      //     : AutovalidateMode.disabled,
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
            onChanged: (value) {},
            validator: (_) => null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            autocorrect: false,
            obscureText: true,
            onChanged: (value) {},
            validator: (_) => null,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Sign In'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Sign In with Google'),
          ),
          // if (state.isSubmitting) ...[
          //   const SizedBox(height: 8),
          //   const LinearProgressIndicator(),
          // ]
        ],
      ),
    );
  }
}
