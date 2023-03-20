import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:omega_app/Services/http_interceptors.dart';

class WebClient{
  static const url = "http://192.168.88.108:5050";
  http.Client client = InterceptedClient.build(
      interceptors: [LogginInterceptor()],
      requestTimeout: const Duration(seconds: 5),);

}