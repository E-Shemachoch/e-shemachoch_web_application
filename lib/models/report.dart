import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.snake, includeIfNull: false)
class Report {
  Report(this.income, this.sold, this.available, this.date);

  final double income;
  final int sold;
  final int available;
  final int date;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
