import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../storage/token_storage.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl)) {
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 15);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.readToken();
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          options.headers["Accept"] = "application/json";
          handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            await TokenStorage.clearToken();
          }
          handler.next(e);
        },
      ),
    );
  }

  Future<String> login(String email, String password) async {
    final res = await _dio.post(
      "/api/login",
      data: {"email": email, "password": password},
    );

    final token = res.data["token"]?.toString();
    if (token == null || token.isEmpty) {
      throw Exception("Token não retornou da API.");
    }
    return token;
  }

  Future<List<dynamic>> listarOrdensAbertas() async {
  final res = await _dio.get("/api/ordens-servico");

  if (res.data is Map && res.data["data"] is List) {
    return List<dynamic>.from(res.data["data"]);
  }

  if (res.data is List) {
    return List<dynamic>.from(res.data);
  }

  throw Exception("Formato de resposta inesperado na lista de ordens.");
}

  Future<Map<String, dynamic>> buscarOrdem(int id) async {
  final res = await _dio.get("/api/ordens-servico/$id");

  if (res.data is Map<String, dynamic>) {
    return Map<String, dynamic>.from(res.data);
  }
  throw Exception("Formato de resposta inesperado no detalhe da ordem.");
}

  Future<void> atualizarOrdem({
  required int id,
  required String defeito,
  required String solucao,
}) async {
  await _dio.put(
    "/api/ordens-servico/$id",
    data: {
      "defeito": defeito,
      "solucao": solucao,
    },
  );
}
}