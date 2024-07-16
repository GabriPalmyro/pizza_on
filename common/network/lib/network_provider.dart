import 'package:dio/dio.dart';
import 'package:network_provider/interceptors/network_interceptors.dart';
import 'package:provider/provider.dart';

abstract class NetworkProvider {
  Future<Dio> getNetworkInstanceForUrl({
    required String url,
  });
}

class NetworkProviderImlp implements NetworkProvider {
  final List<Interceptor> _networkInterceptors = NetworkInterceptorsImpl().interceptors();

  @override
  Future<Dio> getNetworkInstanceForUrl({
    required String url,
  }) async {
    final Dio newInstance = _provideDio(url);
    return newInstance;
  }

  Dio _provideDio(String url) {
    final Dio dio = Dio(BaseOptions(baseUrl: url));
    dio.interceptors.addAll(_networkInterceptors);
    return dio;
  }
}

final networkProviders = [
  Provider<NetworkProvider>.value(
    value: NetworkProviderImlp(),
  ),
];
