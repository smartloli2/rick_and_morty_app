import 'exception.dart';

class RouteException extends BussinessException {
  const RouteException(String message) : super(message);
}

class InvalidNavArgumentsException extends BussinessException {
  const InvalidNavArgumentsException(String message) : super(message);
}
