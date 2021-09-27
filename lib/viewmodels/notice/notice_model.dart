import 'package:eshemachoch_web_application/models/notice.dart';
import 'package:eshemachoch_web_application/services/notice_service.dart';
import 'package:flutter/foundation.dart';

class NoticeModel with ChangeNotifier {
  NoticeModel(this.service) {
    getNotices();
  }
  final NoticeService service;

  List<Notice>? notices;
  bool isLoading = true;
  bool hasError = false;

  getNotices() async {
    try {
      notices = await service.getNotices();
      isLoading = false;
      hasError = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }

  addNotice(Notice notice) async {
    try {
      await service.addNotice(notice);
      getNotices();
    } catch (e) {}
  }

  updateNotice(Notice notice) async {
    try {
      await service.updateNotice(notice);
      getNotices();
    } catch (e) {}
  }

  deleteNotice(Notice notice) {
    try {
      service.deleteNotice(notice);
      getNotices();
    } catch (e) {}
  }
}
