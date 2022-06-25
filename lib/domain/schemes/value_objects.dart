import 'package:finance_tracker/domain/core/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_objects.freezed.dart';

@freezed
class TDTerm with _$TDTerm {
  const factory TDTerm._({required Period period}) = _TDTerm;

  factory TDTerm.oneYear() => const TDTerm._(period: Period.years(1));
  factory TDTerm.twoYears() => const TDTerm._(period: Period.years(2));
  factory TDTerm.threeYears() => const TDTerm._(period: Period.years(3));
  factory TDTerm.fiveYears() => const TDTerm._(period: Period.years(5));
}

@freezed
class MISTerm with _$MISTerm {
  const factory MISTerm._({required Period period}) = _MISTerm;

  factory MISTerm.fiveYears() => const MISTerm._(period: Period.years(5));
}

@freezed
class Period with _$Period {
  const factory Period.years([@Default(1) int value]) = _Years;
  const factory Period.months([@Default(1) int value]) = _Months;
  const factory Period.weeks([@Default(1) int value]) = _Weeks;
  const factory Period.days([@Default(1) int value]) = _Days;
}

@freezed
class RateOfInterest with _$RateOfInterest {
  const factory RateOfInterest({
    required UnsignedDouble percent,
    required Period period,
  }) = _RateOfInterest;

  factory RateOfInterest.perAnnum({required UnsignedDouble percent}) =>
      RateOfInterest(percent: percent, period: const Period.years());
}
