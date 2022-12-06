// server exceptions

import 'package:equatable/equatable.dart';

class NotFoundException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class GenericException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class Exceptions {
  static handleException(int statusCode) {
    if (statusCode == 404) {
      return NotFoundException();
    }

    return GenericException();
  }
}
