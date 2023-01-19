import 'package:myplaces_mexico/src/src.dart';

class ApiRequest {
  ApiRequest({
    required this.url,
    required this.method,
    this.query,
    this.headers,
    this.body,
    this.contentType,
  });

  ApiRequest.get(
    this.url, {
    this.query,
    this.headers,
    this.body,
    this.contentType,
  }) : method = HttpMethods.get;

  ApiRequest.post(
    this.url, {
    this.query,
    this.headers,
    this.body,
    this.contentType,
  }) : method = HttpMethods.post;

  ApiRequest.put(
    this.url, {
    this.query,
    this.headers,
    this.body,
    this.contentType,
  }) : method = HttpMethods.put;

  ApiRequest.patch(
    this.url, {
    this.query,
    this.headers,
    this.body,
    this.contentType,
  }) : method = HttpMethods.patch;

  ApiRequest.delete(
    this.url, {
    this.query,
    this.headers,
    this.body,
    this.contentType,
  }) : method = HttpMethods.delete;

  final String url;
  final String method;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? headers;
  final Object? body;
  final String? contentType;
}
