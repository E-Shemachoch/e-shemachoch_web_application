import 'package:eshemachoch_web_application/models/report.dart';
import 'package:eshemachoch_web_application/services/report_service.dart';
import 'package:flutter/foundation.dart';

class ReportModel with ChangeNotifier {
  ReportModel(this.service) {
    getReports();
  }
  final ReportService service;

  Report? report;
  bool isLoading = true;
  bool hasError = false;

  getReports() async {
    try {
      this.report = await service.getReports();
      isLoading = false;
      hasError = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }
}
