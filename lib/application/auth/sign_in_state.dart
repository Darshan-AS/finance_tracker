import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/auth/auth_failure.dart';
import 'package:finance_tracker/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    required Password password,
    required Email email,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authResponseOption,
  }) = _SignInState;

  factory SignInState.initial() => SignInState(
        email: Email(''),
        password: Password(''),
        isSubmitting: false,
        showErrorMessages: false,
        authResponseOption: none(),
      );
}
