import 'package:json_annotation/json_annotation.dart';

part 'consumer.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Consumer {
  Consumer(this.id, this.name, this.photo, this.block, this.district, this.subCity,
      this.houseNumber, this.phoneNumber, this.familySize);

  final String? id;
  final String name;
  final String photo;
  final String block;
  final String district;
  final String subCity;
  final int houseNumber;
  final String phoneNumber;
  final int familySize;

  factory Consumer.fromJson(Map<String, dynamic> json) => _$ConsumerFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumerToJson(this);

  Consumer copyWith(
          {final String? id,
          String? name,
          String? photo,
          String? block,
          String? district,
          String? subCity,
          int? houseNumber,
          String? phoneNumber,
          int? familySize}) =>
      Consumer(
        id,
        name ?? this.name,
        photo ?? this.photo,
        block ?? this.block,
        district ?? this.district,
        subCity ?? this.subCity,
        houseNumber ?? this.houseNumber,
        phoneNumber ?? this.phoneNumber,
        familySize ?? this.familySize,
      );
  static Consumer empty() => Consumer(null, '', '', '', '', '', 0, '', 0);
}
