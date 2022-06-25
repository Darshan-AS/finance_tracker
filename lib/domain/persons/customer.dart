import 'package:finance_tracker/domain/persons/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required CIF cif,
    required FullName fullName,
    required DateTime dateOfBirth,
    required Address address,
    required ContactInfo contactInfo,
  }) = _Customer;
}
