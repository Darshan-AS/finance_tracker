import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/core/failures.dart';

Either<ValueFailure<String>, String> emailValidator(String email) {
  const emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  return RegExp(emailRegex).hasMatch(email)
      ? right(email)
      : left(ValueFailure.invalidEmail(invalidValue: email));
}

Either<ValueFailure<T>, T> unsignedNumValidator<T>(T value) {
  return value is num && !value.isNegative
      ? right(value)
      : left(ValueFailure.negativeValue(invalidValue: value));
}

Either<ValueFailure<String>, String> phoneValidator(String phone) {
  const phoneRegex = r"^(?:[+0]9)?[0-9]{10,12}$";
  return RegExp(phoneRegex).hasMatch(phone)
      ? right(phone)
      : left(ValueFailure.invalidPhone(invalidValue: phone));
}

Either<ValueFailure<String>, String> nonEmptyStringValidator(String value) {
  return value.isNotEmpty
      ? right(value)
      : left(ValueFailure.emptyValue(invalidValue: value));
}
