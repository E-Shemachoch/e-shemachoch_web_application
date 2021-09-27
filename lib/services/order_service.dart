import 'dart:convert';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/models/order.dart';
import 'package:http/http.dart' as http;

class OrderService {
  OrderService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/orders');

  Future<List<Order>> getOrders() async {
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final orders = jsonDecode(response.body) as List;
      return orders.map((json) {
        return Order.fromJson(json);
      }).toList();
    } else {
      throw Exception('Failed to load orders.');
    }
  }
}
