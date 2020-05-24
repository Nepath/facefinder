// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    id: json['id'] as int,
    sex: json['sex'] as String,
    skinColor: json['skinColor'] as String,
  )..image = json['image'] as String;
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'skinColor': instance.skinColor,
      'sex': instance.sex,
      'image': instance.image,
    };
