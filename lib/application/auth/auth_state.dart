import 'package:finance_tracker/domain/auth/agent.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.authenticated({required Agent agent}) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}
