import 'package:finance_tracker/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const SignInPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.green[800],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[900],
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
      ),
    );
  }
}
