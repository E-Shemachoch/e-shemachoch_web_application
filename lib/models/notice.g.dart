// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
      json['id'] as String?,
      json['title'] as String,
      json['message'] as String,
      json['date'] as int,
    );

Map<String, dynamic> _$NoticeToJson(Notice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['message'] = instance.message;
  val['date'] = instance.date;
  return val;
}
