import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/core/failures.dart';
import 'package:finance_tracker/domain/core/value_objects.dart';
import 'package:finance_tracker/domain/core/value_validators.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_objects.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String street,
    required String city,
    required String state,
    required String country,
    required String zip,
  }) = _Address;
}

@freezed
class ContactInfo with _$ContactInfo {
  const factory ContactInfo({
    required Option<Phone> phone,
    required Option<Email> email,
  }) = _ContactInfo;
}

class FullName extends ValueObject<String> {
  @override
  final String value;

  const FullName._(this.value);

  static Either<ValueFailure<String>, FullName> create(String stringName) =>
      nonEmptyStringValidator(stringName).map((name) => FullName._(name));
}

class CIF extends ValueObject<String> {
  @override
  final String value;

  const CIF._(this.value);

  static Either<ValueFailure<String>, CIF> create(String stringCIF) =>
      nonEmptyStringValidator(stringCIF).map((cif) => CIF._(cif));
}
