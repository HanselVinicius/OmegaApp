import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:logger/logger.dart';

class LogginInterceptor implements InterceptorContract{
  
  Logger logger = Logger();
  
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async{
    logger.v("Request de: ${data.baseUrl}\n Headers: ${data.headers} \n Corpo: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async{
    if(data.statusCode ~/100 == 2){
      logger.i("Response vindo de :${data.url}\n status da resposta: ${data.statusCode} \n Headers: ${data.headers}\n Corpo: ${data.body}");
    }else{
     logger.e("Response vindo de :${data.url}\n status da resposta: ${data.statusCode} \n Headers: ${data.headers}\n Corpo: ${data.body}");
    }
    return data;
  }

}