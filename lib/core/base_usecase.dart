// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

/// A base use case class designed to be extended for specific use cases.
///
/// Each use case should have its own unique [Failure] and [Type] types,
/// as well as a [Parameters] type that provides input to the use case.
///
/// This base class contains a single abstract method [call] that performs
/// the actual business logic for each use case and returns an [Either]
/// object containing either a [Failure] or a successful [Type] object.
abstract class BaseUseCase<Failure, Type, Parameters> {
  /// Executes the use case logic and returns an [Either] containing
  /// either a [Failure] or a successful [Type] object.
  ///
  /// Takes a [Parameters] object as input to the use case, if needed.
  Future<Either<Failure, Type>> call(Parameters parameters);
}

/// A utility class representing an absence of parameters.
///
/// Used in use cases where no input parameters are required.
class NoParameters {}
