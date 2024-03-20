import 'package:json_annotation/json_annotation.dart';

part 'page_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageModel<T> {
  @JsonKey(name: "incomplete_results")
  bool success;
  List<T> items;
  @JsonKey(name: "total_count")
  int? count;

  PageModel({
    required this.items,
    this.count = 0,
    required this.success,
  });
  factory PageModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PageModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) fromJsonT) =>
      _$PageModelToJson(this, fromJsonT);
}
