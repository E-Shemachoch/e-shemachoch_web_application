import 'dart:convert';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProductService {
  ProductService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/products');

  Future<List<Product>> getProducts() async {
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final products = jsonDecode(response.body) as List;
      return products.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products.');
    }
  }

  addProduct(Product product, XFile file) async {
    var request = http.MultipartRequest('POST', uri)
      ..fields['product'] = jsonEncode(product.toJson())
      ..files.add(await http.MultipartFile.fromBytes(
          'image', await file.readAsBytes(),
          filename: file.name));
    var response = await client.send(request);
    if (response.statusCode == 200) {
      return Product.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception('Failed to create product');
    }
  }

  updateProduct(Product product) async {
    final http.Response response =
        await client.put(uri, body: jsonEncode(product.toJson()));

    if (response.statusCode != 200) {
      throw Exception('Failed to update product.');
    }
  }

  deleteProduct(Product product) async {
    final Uri uri = Uri.parse('$BASEURL/products/${product.id!}');

    final http.Response response = await client.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product.');
    }
  }

  updateImage(XFile xFile, String imageId) async {
    final Uri uri = Uri.parse('$BASEURL/products/images/$imageId');

    var request = http.MultipartRequest('PUT', uri)
      ..files.add(await http.MultipartFile.fromBytes(
          'image', await xFile.readAsBytes(),
          filename: xFile.name));
    var response = await client.send(request);
    if (response.statusCode != 200) {
      throw Exception('Failed to update product image.');
    }
  }
}
