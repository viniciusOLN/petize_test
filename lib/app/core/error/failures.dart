import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// usual failures

class NotFoundFailure extends Failure {}

class GenericFailure extends Failure {}
