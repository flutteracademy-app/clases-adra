import 'package:json_annotation/json_annotation.dart';

part 'form_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
enum TypeForm { emptyForm, textForm, otroForm }

class FormModel {
  String? uid;
  final String? nameUser;
  final String? uidUser;
  final String? name;
  final String? description;

  FormModel({
    this.uid,
    this.nameUser,
    this.uidUser,
    this.name,
    this.description,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) =>
      _$FormModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormModelToJson(this);
}
