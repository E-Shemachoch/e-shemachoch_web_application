// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['id'] as String?,
      (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total_price'] as num).toDouble(),
      json['total_quantity'] as int,
      json['consumer_id'] as String,
      json['phone_number'] as String,
      json['claimed'] as bool,
      json['date'] as int,
    );

Map<String, dynamic> _$OrderToJson(Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['products'] = instance.products.map((e) => e.toJson()).toList();
  val['total_price'] = instance.totalPrice;
  val['total_quantity'] = instance.totalQuantity;
  val['consumer_id'] = instance.consumerId;
  val['phone_number'] = instance.phoneNumber;
  val['claimed'] = instance.claimed;
  val['date'] = instance.date;
  return val;
}
