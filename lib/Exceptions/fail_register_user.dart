import 'package:logger/logger.dart';

class FailRegisterUserException implements Exception{
  String message = "falhou a registrar o usuario";
  Logger logger = Logger();

  FailRegisterUserException({message}){
    logger.e(message);
  }
}