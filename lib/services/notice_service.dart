import 'dart:convert';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/models/notice.dart';
import 'package:http/http.dart' as http;

class NoticeService {
  NoticeService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/notices');

  Future<List<Notice>> getNotices() async {
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final notices = jsonDecode(response.body) as List;
      return notices.map((json) => Notice.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load notices.');
    }
  }

  addNotice(Notice notice) async {
    final response = await client.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(notice.toJson()),
    );
    if (response.statusCode == 200) {
      return Notice.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create notice.');
    }
  }

  updateNotice(Notice notice) async {
    final http.Response response =
        await client.put(uri, body: jsonEncode(notice.toJson()));

    if (response.statusCode != 200) {
      throw Exception('Failed to update product.');
    }
  }

  deleteNotice(Notice notice) async {
    final Uri uri = Uri.parse('$BASEURL/notices/${notice.id!}');

    final http.Response response = await client.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product.');
    }
  }
}
