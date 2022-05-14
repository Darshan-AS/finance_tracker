import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required T invalidValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    required T invalidValue,
  }) = ShortPassword<T>;
}
