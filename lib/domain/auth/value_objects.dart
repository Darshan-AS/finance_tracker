import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/core/failures.dart';
import 'package:finance_tracker/domain/core/value_objects.dart';
import 'package:finance_tracker/domain/core/value_validators.dart';

class Email extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Email(String email) => Email._(emailValidator(email));

  const Email._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String password) => Password._(passwordValidator(password));

  const Password._(this.value);
}
