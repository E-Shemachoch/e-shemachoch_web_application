import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Notice extends Equatable {
  Notice(this.id, this.title, this.message, this.date);

  final String? id;
  final String title;
  final String message;
  final int date;

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);

  Notice copyWith({String? id, String? title, String? message, int? date}) => Notice(
        id ?? this.id,
        title ?? this.title,
        message ?? this.message,
        date ?? this.date,
      );
  static Notice empty() => Notice(null, '', '', 0);

  @override
  List<Object?> get props => [title, message];
}
