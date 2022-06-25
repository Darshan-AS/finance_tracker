import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';

@freezed
class ChequeInfo with _$ChequeInfo {
  const factory ChequeInfo({
    required String chequeNumber,
    required String issuerBank,
  }) = _ChequeInfo;
}

@freezed
class Currency with _$Currency {
  // ignore: non_constant_identifier_names
  const factory Currency.INR() = _INR;
}

@freezed
class Amount with _$Amount {
  const factory Amount({
    required double value,
    required Currency currency,
  }) = _Amount;
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod.cash() = _Cash;
  const factory PaymentMethod.cheque(ChequeInfo chequeInfo) =
      _PaymentMethodCheque;
}

@freezed
class Payment with _$Payment {
  const factory Payment({
    required PaymentMethod paymentMethod,
    required Amount amount,
    required DateTime date,
  }) = _Payment;
}
