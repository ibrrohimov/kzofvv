import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure([this.message = '']) : super();
}

class ServerFailure extends Failure {
  @override
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}
