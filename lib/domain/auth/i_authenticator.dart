import 'package:dartz/dartz.dart';
import 'package:finance_tracker/domain/auth/agent.dart';
import 'package:finance_tracker/domain/auth/auth_failure.dart';
import 'package:finance_tracker/domain/auth/value_objects.dart';

abstract class IAuthenticator {
  Future<Option<Agent>> getSignedInAgent();

  Future<Either<AuthFailure, Unit>> signUpWithEmail({
    required Email email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmail({
    required Email email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
