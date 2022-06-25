import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/core/failures.dart';

Either<ValueFailure<String>, String> passwordValidator(String password) {
  return password.length >= 6
      ? right(password)
      : left(ValueFailure.shortPassword(invalidValue: password));
}
