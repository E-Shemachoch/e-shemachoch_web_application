import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Product extends Equatable {
  Product(this.id, this.name, this.price, this.quantity, this.initialQuantity,
      this.image, this.date);

  final String? id;
  final String name;
  final double price;
  final int quantity;
  final int? initialQuantity;
  final String image;
  final int date;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith(
          {String? id,
          String? name,
          double? price,
          int? quantity,
          int? initialQuantity,
          String? image,
          int? date}) =>
      Product(
        id ?? this.id,
        name ?? this.name,
        price ?? this.price,
        quantity ?? this.quantity,
        initialQuantity ?? this.initialQuantity,
        image ?? this.image,
        date ?? this.date,
      );
  static Product empty() => Product(null, '', 0, 0, 0, '', 0);

  @override
  List<Object?> get props => [name, price, quantity];
}
