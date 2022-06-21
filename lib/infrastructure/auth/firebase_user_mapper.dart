import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/auth/agent.dart';
import 'package:finance_tracker/domain/core/failures.dart';
import 'package:finance_tracker/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserDomain on User {
  Either<ValueFailure, Agent> toDomain() {
    return UniqueId.fromUniqueString(uid).bind((id) => right(Agent(id: id)));
  }
}
