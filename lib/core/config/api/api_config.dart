class ApiConfig {
  const ApiConfig._();

  static const prod = _ApiData._(
    http: 'https://www.inegi.org.mx/app/api/denue/v1/consulta/',
  );
}

class _ApiData {
  const _ApiData._({
    required this.http,
  });

  final String http;
}
