import 'package:myplaces_mexico/src/src.dart';

sealed class ApiRequest {
  ApiRequest({
    required this.url,
    required this.method,
    this.query,
    this.headers,
    this.body,
    this.contentType,
  });
  final String url;
  final String method;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? headers;
  final Object? body;
  final String? contentType;
}

class ApiGet extends ApiRequest {
  ApiGet({
    required super.url,
    super.query,
    super.headers,
  }) : super(
          method: HttpMethods.get,
        );
}

class ApiPost extends ApiRequest {
  ApiPost({
    required super.url,
    super.query,
    super.headers,
    super.body,
    super.contentType,
  }) : super(
          method: HttpMethods.post,
        );
}

class ApiPut extends ApiRequest {
  ApiPut({
    required super.url,
    super.query,
    super.headers,
    super.body,
    super.contentType,
  }) : super(
          method: HttpMethods.put,
        );
}

class ApiPatch extends ApiRequest {
  ApiPatch({
    required super.url,
    super.query,
    super.headers,
    super.body,
    super.contentType,
  }) : super(
          method: HttpMethods.patch,
        );
}

class ApiDelete extends ApiRequest {
  ApiDelete({
    required super.url,
    super.query,
    super.headers,
    super.body,
    super.contentType,
  }) : super(
          method: HttpMethods.delete,
        );
}
