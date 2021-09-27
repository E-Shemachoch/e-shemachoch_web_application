import 'package:json_annotation/json_annotation.dart';

part 'adminstrator.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Adminstrator {
  Adminstrator(this.id, this.username, this.password, this.token);

  final String? id;
  final String username;
  final String password;
  final String? token;

  factory Adminstrator.fromJson(Map<String, dynamic> json) =>
      _$AdminstratorFromJson(json);

  Map<String, dynamic> toJson() => _$AdminstratorToJson(this);

  Adminstrator copyWith({String? username, String? password}) => Adminstrator(
        id ?? this.id,
        username ?? this.username,
        password ?? this.password,
        token ?? this.token,
      );

  static Adminstrator empty() => Adminstrator('', '', '', '');
}
