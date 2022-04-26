import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/core/failures.dart';

Either<ValueFailure<String>, String> emailValidator(String email) {
  const emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  return RegExp(emailRegex).hasMatch(email)
      ? right(email)
      : left(ValueFailure.invalidEmail(invalidValue: email));
}

Either<ValueFailure<String>, String> passwordValidator(String password) {
  return password.length >= 6
      ? right(password)
      : left(ValueFailure.shortPassword(invalidValue: password));
}
