import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_tracker/domain/core/errors.dart';
import 'package:finance_tracker/domain/core/failures.dart';
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

  static Either<ValueFailure<String>, UniqueId> create() =>
      right(UniqueId._(const Uuid().v1()));

  static Either<ValueFailure<String>, UniqueId> fromUniqueString(
          String stringUniqueId) =>
      right(UniqueId._(stringUniqueId));
}
