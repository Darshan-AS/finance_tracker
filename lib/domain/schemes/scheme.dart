import 'package:finance_tracker/domain/schemes/value_objects.dart';
// import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scheme.freezed.dart';

@freezed
class TimeDeposit with _$TimeDeposit {
  final String name = "Time Deposit";
  final String code = "TD";

  const TimeDeposit._();

  const factory TimeDeposit({
    required RateOfInterest rateOfInterest,
    required TDTerm term,
  }) = _TimeDeposit;
}

@freezed
class MonthlyIncomeScheme with _$MonthlyIncomeScheme {
  final String name = "Monthly Income Scheme";
  final String code = "MIS";

  const MonthlyIncomeScheme._();

  const factory MonthlyIncomeScheme({
    required RateOfInterest rateOfInterest,
    required MISTerm term,
  }) = _MonthlyIncomeScheme;
}

@freezed
class SavingsScheme with _$SavingsScheme {
  const factory SavingsScheme.timeDeposit(
    TimeDeposit timeDeposit,
  ) = _SavingsSchemeTimeDeposit;
  const factory SavingsScheme.monthlyIncomeScheme(
    MonthlyIncomeScheme monthlyIncomeScheme,
  ) = _SavingsSchemeMonthlyIncomeScheme;
}
