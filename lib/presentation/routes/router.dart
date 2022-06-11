import 'package:auto_route/auto_route.dart';
import 'package:finance_tracker/presentation/sign_in/sign_in_page.dart';
import 'package:finance_tracker/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
  ],
)
class AppRouter extends _$AppRouter {}
