// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adminstrator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Adminstrator _$AdminstratorFromJson(Map<String, dynamic> json) => Adminstrator(
      json['id'] as String?,
      json['username'] as String,
      json['password'] as String,
      json['token'] as String?,
    );

Map<String, dynamic> _$AdminstratorToJson(Adminstrator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['username'] = instance.username;
  val['password'] = instance.password;
  writeNotNull('token', instance.token);
  return val;
}
