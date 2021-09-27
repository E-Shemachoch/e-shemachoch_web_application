import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consumer.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Consumer extends Equatable {
  Consumer(this.id, this.name, this.image, this.block, this.district, this.subCity,
      this.houseNumber, this.phoneNumber, this.familySize);

  final String? id;
  final String name;
  final String image;
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
          String? image,
          String? block,
          String? district,
          String? subCity,
          int? houseNumber,
          String? phoneNumber,
          int? familySize}) =>
      Consumer(
        id ?? this.id,
        name ?? this.name,
        image ?? this.image,
        block ?? this.block,
        district ?? this.district,
        subCity ?? this.subCity,
        houseNumber ?? this.houseNumber,
        phoneNumber ?? this.phoneNumber,
        familySize ?? this.familySize,
      );
  static Consumer empty() => Consumer(null, '', '', '', '', '', 0, '', 0);

  @override
  List<Object?> get props =>
      [name, block, district, subCity, houseNumber, phoneNumber, familySize];
}
