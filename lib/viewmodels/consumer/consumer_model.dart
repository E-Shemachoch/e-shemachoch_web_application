import 'package:eshemachoch_web_application/models/consumer.dart';
import 'package:eshemachoch_web_application/services/consumer_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ConsumerModel with ChangeNotifier {
  ConsumerModel(this.service) {
    getConsumers();
  }
  final ConsumerService service;

  List<Consumer>? consumers;
  bool isLoading = true;
  bool hasError = false;

  getConsumers() async {
    try {
      consumers = await service.getConsumers();
      isLoading = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }

  addConsumer(Consumer consumer, XFile file) async {
    try {
      await service.addConsumer(consumer, file);
      getConsumers();
    } catch (e) {}
  }

  updateConsumer(Consumer consumer) {
    service.updateConsumer(consumer);
  }

  deleteConsumer(Consumer consumer) {
    service.deleteConsumer(consumer);
  }
}
