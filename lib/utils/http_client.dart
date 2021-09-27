import 'dart:io';

import 'package:http/http.dart' as http;

class MyCustomClient extends http.BaseClient {
  MyCustomClient(this.token);
  final String token;

  http.Client httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll({
      HttpHeaders.authorizationHeader: token,
    });
    return httpClient.send(request);
  }
}
