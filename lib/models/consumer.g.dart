// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consumer _$ConsumerFromJson(Map<String, dynamic> json) => Consumer(
      json['id'] as String?,
      json['name'] as String,
      json['image'] as String,
      json['block'] as String,
      json['district'] as String,
      json['sub_city'] as String,
      json['house_number'] as int,
      json['phone_number'] as String,
      json['family_size'] as int,
    );

Map<String, dynamic> _$ConsumerToJson(Consumer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['image'] = instance.image;
  val['block'] = instance.block;
  val['district'] = instance.district;
  val['sub_city'] = instance.subCity;
  val['house_number'] = instance.houseNumber;
  val['phone_number'] = instance.phoneNumber;
  val['family_size'] = instance.familySize;
  return val;
}
