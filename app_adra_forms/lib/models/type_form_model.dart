import 'package:json_annotation/json_annotation.dart';

part 'type_form_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class TypeFormModel {
  final String? uid;
  final String? type;
  final String? name;
  final bool? title;
  final bool? description;
  final bool? dropdown;

  TypeFormModel(
      {this.uid,
      this.type,
      this.name,
      this.title,
      this.description,
      this.dropdown});

  factory TypeFormModel.fromJson(Map<String, dynamic> json) =>
      _$TypeFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeFormModelToJson(this);
}
