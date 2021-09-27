import 'dart:convert';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/models/consumer.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ConsumerService {
  ConsumerService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/consumers');

  Future<List<Consumer>> getConsumers() async {
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final consumers = jsonDecode(response.body) as List;
      return consumers.map((json) => Consumer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load consumers.');
    }
  }

  Future<Consumer> getConsumer(String consumerId) async {
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Consumer.fromJson(json);
    } else {
      throw Exception('Failed to load consumers.');
    }
  }

  addConsumer(Consumer consumer, XFile file) async {
    var request = http.MultipartRequest('POST', uri)
      ..fields['consumer'] = jsonEncode(consumer.toJson())
      ..files.add(await http.MultipartFile.fromBytes(
          'image', await file.readAsBytes(),
          filename: file.name));
    var response = await client.send(request);
    if (response.statusCode == 200) {
      return Consumer.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception('Failed to create consumer');
    }
  }

  updateConsumer(Consumer consumer) async {
    final http.Response response =
        await client.put(uri, body: jsonEncode(consumer.toJson()));

    if (response.statusCode != 200) {
      throw Exception('Failed to update product.');
    }
  }

  deleteConsumer(Consumer consumer) async {
    final Uri uri = Uri.parse('$BASEURL/consumers/${consumer.id!}');

    final http.Response response = await client.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product.');
    }
  }

  updateImage(XFile xFile, String imageId) async {
    final Uri uri = Uri.parse('$BASEURL/consumers/images/$imageId');

    var request = http.MultipartRequest('PUT', uri)
      ..files.add(await http.MultipartFile.fromBytes(
          'image', await xFile.readAsBytes(),
          filename: xFile.name));
    var response = await client.send(request);
    if (response.statusCode != 200) {
      throw Exception('Failed to update consumer image.');
    }
  }
}
