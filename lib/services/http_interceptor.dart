import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.i(
        'Requisição de ${data.baseUrl}\n Cabeçalhos ${data.headers} \n Corpo${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode > 299 || data.statusCode < 200) {
      logger.e(
          'Resposta de ${data.url}\n Status de Reposta:${data.statusCode} \n Cabeçalhos ${data.headers} \n Corpo${data.body}');
    } else {
      logger.i(
          'Resposta de ${data.url}\n Status de Reposta:${data.statusCode} \n Cabeçalhos ${data.headers} \n Corpo${data.body}');
    }
    return data;
  }
}
