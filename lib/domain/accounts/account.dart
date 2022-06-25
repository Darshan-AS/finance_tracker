import 'package:finance_tracker/domain/accounts/value_objects.dart';
import 'package:finance_tracker/domain/payments/payment.dart';
import 'package:finance_tracker/domain/persons/customer.dart';
import 'package:finance_tracker/domain/schemes/scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
class AccountInfo with _$AccountInfo {
  const AccountInfo._();

  const factory AccountInfo({
    required AccountNumber accountNumber,
    required DateTime startDate,
    required Customer customer,
  }) = _AccountInfo;
}

@freezed
class TimeDepositAccount with _$TimeDepositAccount {
  const factory TimeDepositAccount({
    required TimeDeposit scheme,
    required AccountInfo accountInfo,
    required Payment payment,
  }) = _TimeDepositAccount;
}

@freezed
class MonthlyIncomeSchemeAccount with _$MonthlyIncomeSchemeAccount {
  const factory MonthlyIncomeSchemeAccount({
    required MonthlyIncomeScheme scheme,
    required AccountInfo accountInfo,
    required Payment payment,
  }) = _MonthlyIncomeSchemeAccount;
}
