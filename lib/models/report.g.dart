// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      (json['income'] as num).toDouble(),
      json['sold'] as int,
      json['available'] as int,
      json['date'] as int,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'income': instance.income,
      'sold': instance.sold,
      'available': instance.available,
      'date': instance.date,
    };
