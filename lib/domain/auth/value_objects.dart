import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/auth/value_validators.dart';
import 'package:finance_tracker/domain/core/failures.dart';
import 'package:finance_tracker/domain/core/value_objects.dart';

class Password extends ValueObject<String> {
  @override
  final String value;

  const Password._(this.value);

  static Either<ValueFailure<String>, Password> create(String stringPassword) =>
      passwordValidator(stringPassword).map((email) => Password._(email));
}
