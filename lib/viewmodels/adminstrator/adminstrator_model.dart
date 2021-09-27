import 'package:eshemachoch_web_application/models/adminstrator.dart';
import 'package:eshemachoch_web_application/services/adminstrator_service.dart';
import 'package:flutter/cupertino.dart';

class AdminstratorModel with ChangeNotifier {
  AdminstratorModel(this.service);
  final AdminstratorService service;
  Adminstrator? adminstrator;
  bool isLoggedIn = false;

  login(Adminstrator adminstrator) async {
    this.adminstrator = await service.loginAdminstrator(adminstrator);
    isLoggedIn = true;
    notifyListeners();
  }

  logout() {
    isLoggedIn = false;
    adminstrator = null;
    notifyListeners();
  }
}
