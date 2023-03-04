import 'package:film_gamed_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

 const  ServerException({required this.errorMessageModel});
}
