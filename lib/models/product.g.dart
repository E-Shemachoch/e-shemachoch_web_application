// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as String?,
      json['name'] as String,
      (json['price'] as num).toDouble(),
      json['quantity'] as int,
      json['initial_quantity'] as int,
      json['image'] as String,
      json['date'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['price'] = instance.price;
  val['quantity'] = instance.quantity;
  val['initial_quantity'] = instance.initialQuantity;
  val['image'] = instance.image;
  val['date'] = instance.date;
  return val;
}
