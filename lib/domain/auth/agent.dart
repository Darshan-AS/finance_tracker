import 'package:finance_tracker/domain/core/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent.freezed.dart';

@freezed
class Agent with _$Agent {
  const factory Agent({required UniqueId id}) = _Agent;
}
