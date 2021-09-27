import 'package:eshemachoch_web_application/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.snake, includeIfNull: false)
class Order {
  Order(this.id, this.products, this.totalPrice, this.totalQuantity,
      this.consumerId, this.phoneNumber, this.claimed, this.date);
  final String? id;
  final List<Product> products;
  final double totalPrice;
  final int totalQuantity;
  final String consumerId;
  final String phoneNumber;
  final bool claimed;
  final int date;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
