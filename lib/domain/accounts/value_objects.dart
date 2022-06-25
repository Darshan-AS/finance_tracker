import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/core/failures.dart';
import 'package:finance_tracker/domain/core/value_objects.dart';
import 'package:finance_tracker/domain/core/value_validators.dart';

class AccountNumber extends ValueObject<String> {
  @override
  final String value;

  const AccountNumber._(this.value);

  static Either<ValueFailure<String>, AccountNumber> create(
          String stringAccountNumber) =>
      nonEmptyStringValidator(stringAccountNumber)
          .map((an) => AccountNumber._(an));
}
