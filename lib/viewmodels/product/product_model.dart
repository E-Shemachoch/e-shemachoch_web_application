import 'package:eshemachoch_web_application/models/product.dart';
import 'package:eshemachoch_web_application/services/product_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ProductModel with ChangeNotifier {
  ProductModel(this.service) {
    getProducts();
  }
  final ProductService service;

  List<Product>? products;
  bool isLoading = true;
  bool hasError = false;

  getProducts() async {
    try {
      products = await service.getProducts();
      isLoading = false;
      hasError = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }

  addProduct(Product product, XFile file) async {
    try {
      await service.addProduct(product, file);
      getProducts();
    } catch (e) {}
  }

  updateProduct(Product product) async {
    try {
      await service.updateProduct(product);
      getProducts();
    } catch (e) {}
  }

  deleteProduct(Product product) async {
    try {
      await service.deleteProduct(product);
      getProducts();
    } catch (e) {}
  }

  updateImage(XFile xFile, String imageId) async {
    try {
      await service.updateImage(xFile, imageId);
      getProducts();
    } catch (e) {}
  }
}
