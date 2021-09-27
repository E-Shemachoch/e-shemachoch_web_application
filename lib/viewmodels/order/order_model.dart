import 'package:eshemachoch_web_application/models/order.dart';
import 'package:eshemachoch_web_application/services/order_service.dart';
import 'package:flutter/foundation.dart';

class OrderModel with ChangeNotifier {
  OrderModel(this.service) {
    getOrders();
  }
  final OrderService service;

  List<Order>? orders;
  bool isLoading = true;
  bool hasError = false;

  getOrders() async {
    try {
      this.orders = await service.getOrders();
      isLoading = false;
      hasError = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }
}
