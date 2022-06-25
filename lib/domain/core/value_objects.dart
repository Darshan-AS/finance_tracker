import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_tracker/domain/core/failures.dart';
import 'package:finance_tracker/domain/core/value_validators.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  const ValueObject();

  T get value;

  @override
  List get props => [value];

  @override
  String toString() => 'Value: $value';

  // bool isValid() => value.isRight();

  // static Either<ValueFailure<T>, ValueObject> create(T valueT);

  // T getOrThrow({e = UnexpectedValueError}) =>
  //     value.fold((f) => throw UnexpectedValueError(f), id);

  // Either<ValueFailure<dynamic>, Unit> get getFailureOrUnit => value.fold(
  //       (f) => left(f),
  //       (_) => right(unit),
  //     );
}

class UniqueId extends ValueObject<String> {
  @override
  final String value;

  const UniqueId._(this.value);

  static UniqueId create() => UniqueId._(const Uuid().v1());

  static Either<ValueFailure<String>, UniqueId> fromUniqueString(
          String stringUniqueId) =>
      right(UniqueId._(stringUniqueId));
}

class UnsignedInt extends ValueObject<int> {
  @override
  final int value;

  const UnsignedInt._(this.value);

  static Either<ValueFailure<int>, UnsignedInt> create(int intValue) =>
      unsignedNumValidator(intValue).bind((iv) => right(UnsignedInt._(iv)));

  factory UnsignedInt.zero() => const UnsignedInt._(0);
}

class UnsignedDouble extends ValueObject<double> {
  @override
  final double value;

  const UnsignedDouble._(this.value);

  static Either<ValueFailure<double>, UnsignedDouble> create(
          double doubleValue) =>
      unsignedNumValidator(doubleValue)
          .bind((dv) => right(UnsignedDouble._(dv)));

  factory UnsignedDouble.zero() => const UnsignedDouble._(0.0);
}

class Email extends ValueObject<String> {
  @override
  final String value;

  const Email._(this.value);

  static Either<ValueFailure<String>, Email> create(String stringEmail) =>
      emailValidator(stringEmail).map((email) => Email._(email));
}

class Phone extends ValueObject<String> {
  @override
  final String value;

  const Phone._(this.value);

  static Either<ValueFailure<String>, Phone> create(String stringPhone) =>
      phoneValidator(stringPhone).map((phone) => Phone._(phone));
}
