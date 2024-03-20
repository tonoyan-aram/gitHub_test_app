import 'package:json_annotation/json_annotation.dart';

part 'repo_model.g.dart';

@JsonSerializable()
class RepoModel {
  int? id;

  String name;

  RepoModel({
    this.id,
    this.name = "",
  });
  factory RepoModel.fromJson(Map<String, dynamic> data) =>
      _$RepoModelFromJson(data);

  Map<String, dynamic> toJson() => _$RepoModelToJson(this);
}
