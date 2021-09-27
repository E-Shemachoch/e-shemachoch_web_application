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
      hasError = false;
      isLoading = false;
    } catch (e) {
      print(e);
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

  updateConsumer(Consumer consumer) async {
    try {
      await service.updateConsumer(consumer);
      getConsumers();
    } catch (e) {}
  }

  deleteConsumer(Consumer consumer) async {
    try {
      await service.deleteConsumer(consumer);
      getConsumers();
    } catch (e) {}
  }

  updateImage(XFile xFile, String imageId) async {
    try {
      await service.updateImage(xFile, imageId);
      getConsumers();
    } catch (e) {}
  }
}
