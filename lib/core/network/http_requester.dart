import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stock/core/errors/logger.dart';

@lazySingleton
class HttpServiceRequester {
  final Dio dio;

  HttpServiceRequester({
    required this.dio,
  });

  String baseUrl = 'https://api.polygon.io/';
  String apiKey = 'yZyOJ4XTAO_VVFa5T2O6eYUfxRRYjcES';

  Future<Response> getRequest<T>({
    required String url,
  }) async {
    dio.options.contentType = 'application/json';
    Log.d(url);
    final queryParams = {
      'apiKey': apiKey,
    };
    final req = await dio.get(
      baseUrl + url,
      queryParameters: queryParams,
    );
    Log.d({'response:', '$req'});
    return req;
  }
}
