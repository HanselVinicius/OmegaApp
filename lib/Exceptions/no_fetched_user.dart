import 'package:logger/logger.dart';

class NoUserFetchedException implements Exception{
  String message = "não foi retornado Usuarios da API";
  Logger logger = Logger();

  NoFetchedRoleException({cause}){
    logger.e(cause);
  }
}