import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/core/failures.dart';
import 'package:finance_tracker/domain/core/value_objects.dart';
import 'package:finance_tracker/domain/core/value_validators.dart';

class Email extends ValueObject<String> {
  @override
  final String value;

  const Email._(this.value);

  static Either<ValueFailure<String>, Email> create(String stringEmail) =>
      emailValidator(stringEmail).map((email) => Email._(email));
}

class Password extends ValueObject<String> {
  @override
  final String value;

  const Password._(this.value);

  static Either<ValueFailure<String>, Password> create(String stringPassword) =>
      passwordValidator(stringPassword).map((email) => Password._(email));
}
