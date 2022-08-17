// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeFormModel _$TypeFormModelFromJson(Map json) => TypeFormModel(
      uid: json['uid'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      title: json['title'] as bool?,
      description: json['description'] as bool?,
      dropdown: json['dropdown'] as bool?,
    );

Map<String, dynamic> _$TypeFormModelToJson(TypeFormModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'type': instance.type,
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'dropdown': instance.dropdown,
    };
