import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/auth/auth_failure.dart';
import 'package:finance_tracker/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_state.freezed.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Password password,
    required Email email,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authResponseOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        email: Email(''),
        password: Password(''),
        isSubmitting: false,
        showErrorMessages: false,
        authResponseOption: none(),
      );
}
