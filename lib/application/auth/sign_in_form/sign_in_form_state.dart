import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/auth/auth_failure.dart';
import 'package:finance_tracker/domain/auth/value_objects.dart';
import 'package:finance_tracker/domain/core/failures.dart';
import 'package:finance_tracker/domain/core/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_state.freezed.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Either<ValueFailure, Password> password,
    required Either<ValueFailure, Email> email,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authResponseOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        email: left(const ValueFailure.invalidEmail(invalidValue: '')),
        password: left(const ValueFailure.shortPassword(invalidValue: '')),
        isSubmitting: false,
        showErrorMessages: false,
        authResponseOption: none(),
      );
}
