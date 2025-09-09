import 'package:myplaces_mexico/src/src.dart';

class ClientRequest {
  const ClientRequest._();

  static Future<ApiResult<T>> request<T>(
    ApiRequest request,
    T Function(dynamic) fromJson,
  ) async {
    try {
      final response = await ApiClient.request(request);
      return ApiResult.success(data: fromJson(response.data));
    } on Exception catch (exception, stackTrace) {
      return ApiResult.failure(exception: exception, stackTrace: stackTrace);
    }
  }
}
