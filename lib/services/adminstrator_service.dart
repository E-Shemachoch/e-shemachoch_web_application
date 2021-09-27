import 'dart:convert';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/models/adminstrator.dart';
import 'package:http/http.dart' as http;

class AdminstratorService {
  AdminstratorService(this.httpClient);
  final http.Client httpClient;
  final Uri uri = Uri.parse('$BASEURL/adminstrators/login');

  Future<Adminstrator> loginAdminstrator(Adminstrator adminstrator) async {
    final response = await httpClient.post(uri, body: jsonEncode(adminstrator.toJson()));
    if (response.statusCode == 200) {
      return Adminstrator.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login adminstrator');
    }
  }
}
