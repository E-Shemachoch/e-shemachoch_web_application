import 'dart:convert';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/models/report.dart';
import 'package:http/http.dart' as http;

class ReportService {
  ReportService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/reports');

  Future<Report?> getReports() async {
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final report = jsonDecode(response.body);
      return Report.fromJson(report);
    } else {
      throw Exception('Failed to load reports.');
    }
  }
}
